import 'package:material_ui/material_ui.dart';
import 'package:tenpai/shared/theme/app_colors.dart';
import 'package:tenpai/shared/theme/app_tokens.dart';

/// One choice of onboarding 03/04: white card, green ring when selected.
/// [subtitle] sits under the title (03), [trailing] on the right (04).
class OptionCardWidget extends StatelessWidget {
  /// Exactly one of [subtitle] / [trailing] per screen; both null is fine.
  const OptionCardWidget({
    super.key,
    required this.title,
    this.subtitle,
    this.trailing,
    required this.selected,
    required this.onTap,
  });

  /// Handoff copy, verbatim.
  final String title;

  /// Second line under the title (screen 03).
  final String? subtitle;

  /// Word on the right (screen 04: « Tranquille » …).
  final String? trailing;

  /// Draws the green ring and tints the title; the parent owns the choice.
  final bool selected;

  /// Always tappable, selecting again is a no-op for the parent.
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final colors = theme.extension<AppColors>()!;
    return Material(
      color: scheme.surfaceContainer,
      borderRadius: AppTokens.radiusCard,
      child: InkWell(
        borderRadius: AppTokens.radiusCard,
        onTap: onTap,
        child: AnimatedContainer(
          duration: AppTokens.duration,
          curve: AppTokens.curve,
          padding: const EdgeInsets.all(AppTokens.space2),
          decoration: BoxDecoration(
            borderRadius: AppTokens.radiusCard,
            boxShadow: AppTokens.shadowSurface,
            border: Border.all(
              color: selected ? scheme.primary : Colors.transparent,
              width: AppTokens.ringWidth,
            ),
          ),
          child: _content(theme, scheme, colors),
        ),
      ),
    );
  }

  Widget _content(ThemeData theme, ColorScheme scheme, AppColors colors) => Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                color: selected ? scheme.primary : scheme.onSurface,
              ),
            ),
            if (subtitle case final s?)
              Text(
                s,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colors.mutedStrong,
                ),
              ),
          ],
        ),
      ),
      if (trailing case final t?)
        Text(
          t,
          style: theme.textTheme.bodySmall?.copyWith(color: colors.mutedStrong),
        ),
    ],
  );
}
