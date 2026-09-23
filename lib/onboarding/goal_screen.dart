import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tenpai/app/router.dart';
import 'package:tenpai/onboarding/onboarding_scaffold_widget.dart';
import 'package:tenpai/onboarding/option_card_widget.dart';
import 'package:tenpai/profile/profile_providers.dart';
import 'package:tenpai/profile/user_profile.dart';

/// Onboarding 04, last step: saves the profile; the router then lets the
/// user into the tabs.
class GoalScreen extends ConsumerStatefulWidget {
  /// From the query string of the route, chosen on the previous screen.
  const GoalScreen({super.key, required this.level});

  /// Carried through the URL so a restart mid-onboarding loses nothing.
  final MahjongLevel level;
  @override
  ConsumerState<GoalScreen> createState() => _GoalScreenState();
}

const _options = [
  (5, 'Tranquille'),
  (10, 'Régulier'),
  (15, 'Sérieux'),
  (20, 'Intensif'),
];

class _GoalScreenState extends ConsumerState<GoalScreen> {
  int? _minutes;
  bool _busy = false;

  @override
  Widget build(BuildContext context) => OnboardingScaffoldWidget(
    progress: 1,
    title: 'Votre objectif quotidien',
    subtitle: 'Des leçons courtes suffisent. Vous pourrez changer plus tard.',
    ctaLabel: "C'est parti",
    onBack: () => context.go(AppRoutes.onboardingLevel),
    onCta: _minutes == null || _busy ? null : _finish,
    children: [
      for (final (minutes, word) in _options)
        OptionCardWidget(
          title: '$minutes min / jour',
          trailing: word,
          selected: _minutes == minutes,
          onTap: () => setState(() => _minutes = minutes),
        ),
    ],
  );
  Future<void> _finish() async {
    setState(() => _busy = true);
    try {
      await ref
          .read(userProfileProvider.notifier)
          .complete(level: widget.level, dailyGoalMinutes: _minutes!);
    } on Exception catch (e) {
      debugPrint('profile save failed: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Impossible d'enregistrer. Réessayez.")),
        );
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }
}
