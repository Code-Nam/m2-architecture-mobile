import 'package:material_ui/material_ui.dart';

/// Local-only preferences (Isar); never synced, never in Firestore.
abstract interface class SettingsRepository {
  /// [ThemeMode.system] until the user picks something: a fresh install has
  /// no row, and that is not an error.
  Future<ThemeMode> themeMode();

  /// Persists at once; the caller updates its state after this completes.
  Future<void> setThemeMode(ThemeMode mode);
}
