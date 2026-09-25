import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tenpai/local/isar_providers.dart';
import 'package:tenpai/settings/isar_settings_repository.dart';
import 'package:tenpai/settings/settings_repository.dart';

/// Swap point: tests override with a fake, never Isar.
final settingsRepositoryProvider = Provider<SettingsRepository>(
  (ref) => IsarSettingsRepository(ref.watch(isarProvider)),
);

/// The persisted theme choice; `TenpaiApp` falls back to system while it
/// loads, so the first frame never waits on disk.
final themeModeProvider = AsyncNotifierProvider<ThemeModeNotifier, ThemeMode>(
  ThemeModeNotifier.new,
);

/// Public only as the provider's type argument.
class ThemeModeNotifier extends AsyncNotifier<ThemeMode> {
  @override
  Future<ThemeMode> build() =>
      ref.watch(settingsRepositoryProvider).themeMode();

  /// Writes first, then updates state: a failed write never shows a choice
  /// that was not saved.
  Future<void> set(ThemeMode mode) async {
    await ref.read(settingsRepositoryProvider).setThemeMode(mode);
    state = AsyncData(mode);
  }
}
