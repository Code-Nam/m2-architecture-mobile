import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tenpai/settings/settings_providers.dart';
import 'package:tenpai/shared/theme/app_colors.dart';
import 'package:tenpai/shared/theme/app_tokens.dart';

/// Réglages: the theme choice only, stored in Isar. Not in the handoff;
/// kept to one card built from existing tokens.
class SettingsScreen extends ConsumerWidget {
  /// Everything comes from `themeModeProvider`; no parameters.
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeModeProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Réglages')),
      body: Padding(
        padding: const EdgeInsets.all(AppTokens.sideMargin),
        child: _ThemeCard(
          mode: mode.value,
          onChanged: mode.hasValue
              ? (m) => ref.read(themeModeProvider.notifier).set(m)
              : null,
        ),
      ),
    );
  }
}

/// « Thème » card. Null [onChanged] disables the whole control, which the
/// screen does while the stored choice is still loading.
class _ThemeCard extends StatelessWidget {
  const _ThemeCard({this.mode, this.onChanged});
  final ThemeMode? mode;
  final ValueChanged<ThemeMode>? onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final colors = theme.extension<AppColors>()!;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: scheme.surfaceContainer,
        borderRadius: AppTokens.radiusCard,
        boxShadow: AppTokens.shadowSurface,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppTokens.space2),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            Text(
              'thème'.toUpperCase(),
              style: theme.textTheme.labelMedium?.copyWith(
                color: colors.mutedStrong,
              ),
            ),
            const SizedBox(height: AppTokens.space1),
            SegmentedButton<ThemeMode>(
              segments: const [
                ButtonSegment(value: ThemeMode.system, label: Text('Système')),
                ButtonSegment(value: ThemeMode.light, label: Text('Clair')),
                ButtonSegment(value: ThemeMode.dark, label: Text('Sombre')),
              ],
              selected: {mode ?? ThemeMode.system},
              showSelectedIcon: false,
              onSelectionChanged: onChanged == null
                  ? null
                  : (s) => onChanged!(s.first),
            ),
          ],
        ),
      ),
    );
  }
}
