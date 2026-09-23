import 'dart:convert';
import 'dart:typed_data';

import 'package:firebase_ai/firebase_ai.dart';
import 'package:tenpai/scanner/tile_identifier.dart';
import 'package:tenpai/shared/models/tile.dart';

/// Replaces the hash fake behind the same interface: one photo in, one
/// [Tile] or null out. Structured output (JSON + enum schema) so the model
/// can only answer with a code [Tile.parse] accepts, or `none`; the parse
/// still runs inside `try` so a bad picture is never an exception.
class FirebaseTileIdentifier implements TileIdentifier {
  /// [_model] comes from `identifierModelProvider`: same backend as the
  /// Sensei, no system instruction (the JSON schema is the whole contract).
  FirebaseTileIdentifier(this._model);
  final GenerativeModel _model;

  /// Every code [Tile.parse] accepts, plus `none`. Suits first so the enum
  /// order matches [TileSuit]; red fives are separate values because
  /// `isRed` is part of the code.
  static final _codes = [
    for (final suit in TileSuit.values)
      if (suit != TileSuit.honor)
        for (var n = 1; n <= 9; n++) '$n${suit.letter}',
    '5mr',
    '5pr',
    '5sr',
    for (var n = 1; n <= 7; n++) '${n}z',
    _none,
  ];
  static const _none = 'none';

  /// Per call, not on the model: the schema and the parser below must agree,
  /// so they live in the same file. Temperature 0 = deterministic answer.
  static final _config = GenerationConfig(
    temperature: 0,
    responseMimeType: 'application/json',
    responseSchema: Schema.object(
      properties: {'code': Schema.enumString(enumValues: _codes)},
    ),
  );

  static const _prompt =
      'Cette photo montre une tuile de riichi mahjong. Réponds par son code : '
      'chiffre 1 à 9 puis m (caractères), p (cercles) ou s (bambous) ; '
      '5mr, 5pr ou 5sr pour un cinq rouge ; 1z à 4z pour les vents est, sud, '
      'ouest, nord ; 5z dragon blanc, 6z dragon vert, 7z dragon rouge ; '
      'none si aucune tuile nette.';

  /// image_picker re-encodes as JPEG whenever `imageQuality` or `maxWidth`
  /// is set, which `TilePhotoSourceImpl` does, hence the fixed MIME type.
  /// SDK exceptions (quota, API off, blocked) propagate: `ScanNotifier`
  /// already turns any `Exception` into the failure sheet.
  @override
  Future<Tile?> identify(Uint8List photo) async {
    final response = await _model.generateContent([
      Content.multi([
        const TextPart(_prompt),
        InlineDataPart('image/jpeg', photo),
      ]),
    ], generationConfig: _config);
    return _parse(response.text);
  }

  /// Null for anything that is not `{"code": "<code in _codes>"}`. The
  /// schema makes a stray value unlikely; the membership test makes it
  /// harmless, and keeps `Tile.parse` (which throws an `Error` on a short
  /// string) out of the failure path. The `try` covers the decode and cast.
  static Tile? _parse(String? text) {
    if (text == null) return null;
    try {
      final code = (jsonDecode(text) as Map<String, Object?>)['code'];
      if (code is! String || code == _none || !_codes.contains(code)) {
        return null;
      }
      return Tile.parse(code);
    } on FormatException {
      return null;
    } on TypeError {
      return null;
    }
  }
}
