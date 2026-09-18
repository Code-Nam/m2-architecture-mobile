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

    return SizedBox(
      width: size.width,
      height: size.height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: _gradient(colors),
          borderRadius: AppTokens.radiusTile,
          boxShadow: AppTokens.shadowTile,
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
}
