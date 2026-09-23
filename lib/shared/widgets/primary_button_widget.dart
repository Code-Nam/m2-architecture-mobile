import 'package:material_ui/material_ui.dart';
import 'package:tenpai/shared/theme/app_tokens.dart';

/// The one full-width CTA of a screen (handoff: one primary action per
/// screen); lesson blocks, feedback sheet and scanner sheets share it.
/// `Size.fromHeight` already means infinite width, and the explicit shape is
/// needed because a FilledButton defaults to a stadium.
class PrimaryButtonWidget extends StatelessWidget {
  /// [color] is the only styling knob; everything else is theme.
  const PrimaryButtonWidget({
    super.key,
    required this.label,
    this.onPressed,
    this.color,
  });

  /// French, verbatim from the handoff (« Continuer », « Vérifier »).
  final String label;

  /// Null renders the disabled style: « Vérifier » before an option is picked.
  final VoidCallback? onPressed;

  /// Null keeps the theme primary; the error sheet passes `scheme.error`.
  final Color? color;

  @override
  Widget build(BuildContext context) => FilledButton(
    onPressed: onPressed,
    style: FilledButton.styleFrom(
      backgroundColor: color,
      minimumSize: const Size.fromHeight(AppTokens.buttonHeight),
      shape: const RoundedRectangleBorder(borderRadius: AppTokens.radiusCard),
    ),
    child: Text(label),
  );
}
