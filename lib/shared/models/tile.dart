import 'package:freezed_annotation/freezed_annotation.dart';

part 'tile.freezed.dart';

/// Enumeration representing the four suits of Mahjong tiles.
enum TileSuit {
  /// The character suit, represented by the letter 'm'.
  man('m'),

  /// The pin suit, represented by the letter 'p'.
  pin('p'),

  /// The sou suit, represented by the letter 's'.
  sou('s'),

  /// The honor suit, represented by the letter 'z'.
  honor('z');

  const TileSuit(this.letter);

  /// The letter representation of the suit.
  final String letter;
}

/// The one tile model: suit, number, red-five flag. Everything that shows a
/// tile takes this and hands it to `TileWidget`.
@freezed
abstract class Tile with _$Tile {
  const Tile._();

  /// Numbers run 1–9 for suits, 1–7 for honours (four winds, then three
  /// dragons); the assert enforces it because content is hand-authored.
  @Assert('number >= 1 && number <= (suit == TileSuit.honor ? 7 : 9)')
  const factory Tile({
    required TileSuit suit,
    required int number,
    @Default(false) bool isRed,
  }) = _Tile;

  /// Parses content codes: `1m`, `9s`, `1z`, `5pr` (trailing `r` = red five).
  /// No validation beyond the constructor assert; a bad code throws, which is
  /// the right outcome for authored content.
  factory Tile.parse(String code) {
    final suit = TileSuit.values.firstWhere((s) => s.letter == code[1]);
    return Tile(
      suit: suit,
      number: int.parse(code[0]),
      isRed: code.endsWith('r'),
    );
  }

  /// Inverse of [Tile.parse]; also what the placeholder symbol renders.
  String get code => '$number${suit.letter}${isRed ? 'r' : ''}';
}
