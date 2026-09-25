import 'package:isar_community/isar.dart';
import 'package:material_ui/material_ui.dart';

part 'settings_record.g.dart';

/// Single row (id 0) holding the local-only preferences; the repository
/// reads it or falls back to defaults when absent.
@collection
class SettingsRecord {
  /// Fixed key: `put` always overwrites the one row instead of appending.
  Id id = 0;

  /// Stored by ordinal (`@enumerated` default); reordering [ThemeMode] in a
  /// future Flutter would silently remap, acceptable for a preference.
  @enumerated
  ThemeMode themeMode = ThemeMode.system;
}
