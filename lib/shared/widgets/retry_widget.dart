import 'package:material_ui/material_ui.dart';

/// Error fallback with one action, shared by every screen that loads data.
///
/// Riverpod-free on purpose: the caller owns the retry, usually
/// `ref.invalidate` on the provider that failed. « Réessayer » is fixed here
/// so the wording cannot drift between screens.
class RetryWidget extends StatelessWidget {
  /// [message] is the one line that differs per screen, French, no period.
  const RetryWidget({super.key, required this.message, required this.onRetry});

  /// What failed to load, e.g. « Impossible de charger la leçon ».
  final String message;

  /// Runs on « Réessayer »; must make the failing load happen again.
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisSize: .min,
      children: [
        Text(message),
        TextButton(onPressed: onRetry, child: const Text('Réessayer')),
      ],
    ),
  );
}
