import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tenpai/app/router.dart';
import 'package:tenpai/shared/models/tile.dart';
import 'package:tenpai/shared/theme/app_colors.dart';
import 'package:tenpai/shared/theme/app_tokens.dart';
import 'package:tenpai/shared/widgets/primary_button_widget.dart';
import 'package:tenpai/shared/widgets/tile_size.dart';
import 'package:tenpai/shared/widgets/tile_widget.dart';

/// Onboarding 01. Two ways in, both to the login screen: « Commencer »
/// opens it on Inscription, « J'ai déjà un compte » on Connexion.
class WelcomeScreen extends StatelessWidget {
  /// No parameters: navigation comes from the router.
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppColors>()!;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppTokens.sideMargin),
          child: Column(
            children: [
              const Spacer(),
              const _TileFan(),
              const SizedBox(height: AppTokens.space3),
              Text('Tenpai', style: theme.textTheme.displayLarge),
              const SizedBox(height: AppTokens.space2),
              Text(
                'Le mahjong japonais, expliqué depuis zéro. Dix minutes par jour.',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: colors.mutedStrong,
                ),
                textAlign: .center,
              ),
              const Spacer(),
              PrimaryButtonWidget(
                label: 'Commencer',
                onPressed: () => context.go('${AppRoutes.login}?mode=signup'),
              ),
              TextButton(
                onPressed: () => context.go(AppRoutes.login),
                child: const Text("J'ai déjà un compte"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Five tiles fanned like a held hand (handoff 01). Painted outer-first so
/// the centre tile ends on top; `Transform` leaves layout alone, hence the
/// fixed-height box around the stack.
class _TileFan extends StatelessWidget {
  const _TileFan();

  static final _tiles = [
    '1m',
    '2p',
    '3s',
    '4z',
    '5pr',
  ].map(Tile.parse).toList();

  @override
  Widget build(BuildContext context) => SizedBox(
    height: TileSize.regular.height * 1.6,
    child: Stack(
      alignment: .center,
      children: [
        for (final i in [0, 4, 1, 3, 2]) _fanned(i),
      ],
    ),
  );

  Widget _fanned(int i) {
    final k = i - 2; // −2..2, centre = 0
    return Transform.translate(
      offset: Offset(k * AppTokens.fanTileOffset, k.abs() * AppTokens.fanDrop),
      child: Transform.rotate(
        angle: k * AppTokens.fanTileAngle,
        child: TileWidget(tile: _tiles[i], state: i == 3 ? .faceDown : .normal),
      ),
    );
  }
}
