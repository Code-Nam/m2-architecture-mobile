import 'package:material_ui/material_ui.dart';
import 'package:tenpai/shared/theme/app_colors.dart';
import 'package:tenpai/shared/theme/app_tokens.dart';
import 'package:tenpai/shared/widgets/primary_button_widget.dart';

/// Chrome shared by onboarding 03 and 04: back + progress, title, subtitle,
/// the choices, CTA pinned at the bottom. [onBack] null hides the arrow.
class OnboardingScaffoldWidget extends StatelessWidget {
  /// [onCta] null disables the button until the user has chosen.
  const OnboardingScaffoldWidget({
    super.key,
    required this.progress,
    required this.title,
    required this.subtitle,
    required this.children,
    required this.ctaLabel,
    this.onCta,
    this.onBack,
  });

  /// 0–1 fill of the top bar: 0.5 on screen 03, 1 on screen 04.
  final double progress;

  /// Question of the step, `headlineLarge`.
  final String title;

  /// One muted line under the title.
  final String subtitle;

  /// The option cards, laid out with a fixed gap.
  final List<Widget> children;

  /// « Continuer » or « C'est parti ».
  final String ctaLabel;

  /// Null while nothing is selected or a save is running.
  final VoidCallback? onCta;

  /// Null hides the arrow (screen 03 has nothing to go back to).
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppColors>()!;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppTokens.sideMargin),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Row(
                children: [
                  if (onBack case final back?)
                    IconButton(
                      onPressed: back,
                      icon: const Icon(Icons.arrow_back),
                    ),
                  Expanded(
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: AppTokens.progressHeight,
                      borderRadius: AppTokens.radiusProgress,
                      backgroundColor: colors.track,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppTokens.space4),
              Text(title, style: theme.textTheme.headlineLarge),
              const SizedBox(height: AppTokens.space1),
              Text(
                subtitle,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colors.mutedStrong,
                ),
              ),
              const SizedBox(height: AppTokens.space3),
              for (final child in children) ...[
                child,
                const SizedBox(height: AppTokens.space2),
              ],
              const Spacer(),
              PrimaryButtonWidget(label: ctaLabel, onPressed: onCta),
            ],
          ),
        ),
      ),
    );
  }
}
