import 'package:flutter_svg/flutter_svg.dart';
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
    final scheme = theme.colorScheme;
    final badge = switch (state) {
      .correct => _Badge(
        color: scheme.primary,
        icon: Icons.check,
        onColor: scheme.onPrimary,
      ),
      .incorrect => _Badge(
        color: scheme.error,
        icon: Icons.close,
        onColor: scheme.onError,
      ),
      .normal || .selected || .highlighted || .faceDown => null,
    };

    return Stack(
      clipBehavior: .none,
      children: [
        AnimatedContainer(
          width: size.width,
          height: size.height,
          duration: AppTokens.duration,
          curve: AppTokens.curve,
          foregroundDecoration: _bevel(),
          transform: state == .selected
              ? Matrix4.translationValues(0, -AppTokens.tileLift, 0)
              : Matrix4.identity(),
          decoration: BoxDecoration(
            gradient: _gradient(colors),
            borderRadius: BorderRadius.circular(size.radius),
            boxShadow: _shadows(scheme),
          ),
          child: state == .faceDown ? _backFrame() : _symbol(),
        ),
        if (badge != null)
          Positioned(
            top: -AppTokens.badgeOverhang,
            right: -AppTokens.badgeOverhang,
            child: badge,
          ),
      ],
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

  Widget _backFrame() => Center(
    child: FractionallySizedBox(
      widthFactor: AppTokens.backFrameWidthFactor,
      heightFactor: AppTokens.backFrameHeightFactor,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppTokens.backFrame,
            width: AppTokens.backFrameWidth,
          ),
          borderRadius: BorderRadius.circular(
            size.radius * AppTokens.backFrameRadiusFactor,
          ),
        ),
      ),
    ),
  );

  /// CC0 art from `assets/tiles/<code>.svg`: symbol only on a transparent
  /// 3:4 canvas (the face is ours), colours baked in, red fives included.
  /// `contain` fits it into our 64:88 box without cropping.
  Widget _symbol() => Padding(
    padding: EdgeInsets.all(size.width * AppTokens.symbolInsetFactor),
    child: SvgPicture.asset('assets/tiles/${tile.code}.svg'),
  );

  BoxDecoration _bevel() {
    final top = state == .faceDown
        ? AppTokens.backHighlight
        : AppTokens.bevelTop;
    final bottomStop = state == .faceDown
        ? 1.0
        : 1 - AppTokens.bevelBottomHeight / size.height;
    return BoxDecoration(
      borderRadius: BorderRadius.circular(size.radius),
      gradient: LinearGradient(
        begin: .topCenter,
        end: .bottomCenter,
        colors: [
          top,
          top,
          Colors.transparent,
          Colors.transparent,
          AppTokens.bevelBottom,
          AppTokens.bevelBottom,
        ],
        stops: [
          0,
          AppTokens.bevelTopHeight / size.height,
          AppTokens.bevelTopHeight / size.height,
          bottomStop,
          bottomStop,
          1,
        ],
      ),
    );
  }
}

/// A small circular badge with an icon, used for the tile state indicators.
class _Badge extends StatelessWidget {
  /// Creates a badge with the given [color], [icon], and [onColor].
  const _Badge({
    required this.color,
    required this.icon,
    required this.onColor,
  });

  final Color color;
  final IconData icon;
  final Color onColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: AppTokens.badgeSize,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: .circle,
          color: color,
          boxShadow: AppTokens.shadowBadge,
        ),
        child: Icon(icon, size: AppTokens.badgeIconSize, color: onColor),
      ),
    );
  }
}
