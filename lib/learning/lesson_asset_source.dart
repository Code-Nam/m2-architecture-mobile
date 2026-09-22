import 'dart:convert';

import 'package:flutter/services.dart';

/// A source of lesson assets
class LessonAssetSource {
  /// Creates a new [LessonAssetSource] with the given [bundle]
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

  /// Loads the units from the asset bundle
  Future<List<Map<String, Object?>>> loadUnits() async => [
    for (final path in _paths)
      jsonDecode(await _bundle.loadString(path)) as Map<String, Object?>,
  ];
}
