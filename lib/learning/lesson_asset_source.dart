import 'dart:convert';

import 'package:flutter/services.dart';

/// Reads the unit JSON files bundled under `assets/lessons/`.
///
/// The paths are a fixed list because Flutter cannot list an asset directory
/// at runtime; their order is the order of units on the path screen.
class LessonAssetSource {
  /// [bundle] defaults to [rootBundle]; tests pass a fake bundle instead.
  LessonAssetSource({AssetBundle? bundle}) : _bundle = bundle ?? rootBundle;

  final AssetBundle _bundle;

  static const _paths = [
    'assets/lessons/unit_01_lire_les_tuiles.json',
    'assets/lessons/unit_02_les_briques_d_une_main.json',
    'assets/lessons/unit_03_la_table.json',
    'assets/lessons/unit_04_le_deroule_d_une_partie.json',
    'assets/lessons/unit_05_gagner.json',
    'assets/lessons/unit_06_le_score.json',
  ];

  /// One decoded JSON object per unit, in path order.
  ///
  /// Throws when an asset is missing or not valid JSON: content is authored,
  /// so that is a build-time bug, not a runtime state to handle.
  Future<List<Map<String, Object?>>> loadUnits() async => [
    for (final path in _paths)
      jsonDecode(await _bundle.loadString(path)) as Map<String, Object?>,
  ];
}
