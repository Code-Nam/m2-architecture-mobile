import 'package:material_ui/material_ui.dart';
import 'package:tenpai/shared/models/tile.dart';
import 'package:tenpai/shared/theme/app_colors.dart';
import 'package:tenpai/shared/theme/app_tokens.dart';
import 'package:tenpai/shared/widgets/tile_size.dart';
import 'package:tenpai/shared/widgets/tile_state.dart';

/// The one tile renderer. States from [TileState], Symbol is text until SVG art lands
class TileWidget extends StatelessWidget {
  /// Draws [tile] in [state] at [size]. Red comes from [Tile.isRed]
  const TileWidget({
    super.key,
    required this.tile,
    this.state = .normal,
    this.size = .regular,
  });

  /// Tile to draw
  final Tile tile;

  /// Visual variant
  final TileState state;

  /// Rendered dimensions
  final TileSize size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppColors>()!;

    return AnimatedContainer(
      width: size.width,
      height: size.height,
      duration: AppTokens.duration,
      curve: AppTokens.curve,
      transform: state == .selected
          ? Matrix4.translationValues(0, -AppTokens.tileLift, 0)
          : Matrix4.identity(),
      decoration: BoxDecoration(
        gradient: _gradient(colors),
        borderRadius: BorderRadius.circular(size.radius),
        boxShadow: _shadows(theme.colorScheme),
      ),
      child: state == .faceDown
          ? null
          : Center(
              child: Text(
                tile.code,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: tile.isRed ? colors.vermillionText : null,
                ),
              ),
            ),
    );
  }

  LinearGradient _gradient(AppColors colors) {
    final (top, bottom) = switch (state) {
      .normal ||
      .selected ||
      .highlighted => (colors.tileFaceTop, colors.tileFaceBottom),
      .correct => (colors.successTint, colors.successTintDeep),
      .incorrect => (colors.errorTint, colors.errorTintDeep),
      .faceDown => (colors.tileBackTop, colors.tileBackBottom),
    };
    return LinearGradient(
      begin: .topCenter,
      end: .bottomCenter,
      colors: [top, bottom],
    );
  }

  List<BoxShadow> _shadows(ColorScheme scheme) {
    final base = state == .selected
        ? AppTokens.shadowTileSelected
        : AppTokens.shadowTile;
    final ring = switch (state) {
      .normal || .faceDown => null,
      .selected || .correct => BoxShadow(
        color: scheme.primary,
        spreadRadius: AppTokens.ringWidth,
      ),
      .incorrect => BoxShadow(
        color: scheme.error,
        spreadRadius: AppTokens.ringWidth,
      ),
      .highlighted => BoxShadow(
        color: scheme.primary.withValues(alpha: AppTokens.haloAlpha),
        spreadRadius: AppTokens.haloWidth,
      ),
    };

    return [...base, ?ring];
  }
}
