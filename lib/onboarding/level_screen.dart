import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tenpai/app/router.dart';
import 'package:tenpai/onboarding/onboarding_scaffold_widget.dart';
import 'package:tenpai/onboarding/option_card_widget.dart';
import 'package:tenpai/profile/user_profile.dart';

/// Onboarding 03. Pure UI state: the level only leaves this screen in the
/// query string of the next one, never in a provider.
class LevelScreen extends StatefulWidget {
  /// No parameters: first step, nothing chosen yet.
  const LevelScreen({super.key});
  @override
  State<LevelScreen> createState() => _LevelScreenState();
}

/// Copy verbatim from the handoff, one record per [MahjongLevel].
const _options = [
  (MahjongLevel.never, 'Jamais joué', 'On part de zéro, tranquillement.'),
  (MahjongLevel.seen, "J'ai vu jouer", 'Un anime, des amis, une salle de jeu.'),
  (MahjongLevel.some, 'Je connais un peu', 'Les bases, mais pas le score.'),
];

class _LevelScreenState extends State<LevelScreen> {
  MahjongLevel? _selected;

  @override
  Widget build(BuildContext context) => OnboardingScaffoldWidget(
    progress: 0.5,
    title: 'Vous connaissez déjà le mahjong ?',
    subtitle: 'Pour choisir votre point de départ.',
    ctaLabel: 'Continuer',
    onCta: _selected == null ? null : _continue,
    children: [
      for (final (level, title, line) in _options)
        OptionCardWidget(
          title: title,
          subtitle: line,
          selected: _selected == level,
          onTap: () => setState(() => _selected = level),
        ),
    ],
  );

  void _continue() =>
      context.go('${AppRoutes.onboardingGoal}?level=${_selected!.wireName}');
}
