import 'package:isar_community/isar.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tenpai/settings/settings_record.dart';
import 'package:tenpai/settings/settings_repository.dart';

/// Settings as the single row 0 of `settingsRecords`.
class IsarSettingsRepository implements SettingsRepository {
  /// [_isar] comes from `isarProvider`, opened in `main`.
  const IsarSettingsRepository(this._isar);
  final Isar _isar;

  @override
  Future<ThemeMode> themeMode() async =>
      (await _isar.settingsRecords.get(0))?.themeMode ?? ThemeMode.system;

  @override
  Future<void> setThemeMode(ThemeMode mode) => _isar.writeTxn(
    () => _isar.settingsRecords.put(SettingsRecord()..themeMode = mode),
  );
}
