import 'package:material_ui/material_ui.dart';
import 'package:tenpai/shared/theme/app_colors.dart';

/// Mode-independent, so plain consts; colours live in [AppColors]
abstract final class AppTokens {
  //* Spacing
  /// Base unit spacing
  static const space1 = 8.0;

  /// Base unit spacing for small elements.
  static const space2 = 16.0;

  /// Base unit spacing for medium elements.
  static const space3 = 24.0;

  /// Base unit spacing for large elements.
  static const space4 = 32.0;

  /// Base unit spacing for extra large elements.
  static const sideMargin = 20.0;

  //* Radius
  /// Cards and buttons
  static const radiusCard = BorderRadius.all(Radius.circular(16));

  /// Panels
  static const radiusSubPanel = BorderRadius.all(Radius.circular(12));

  /// Seals
  static const radiusSeal = BorderRadius.all(Radius.circular(6));

  /// Progress bars
  static const radiusProgress = BorderRadius.all(Radius.circular(3));

  /// Bottom sheet, top corners only
  static const radiusSheet = BorderRadius.vertical(top: Radius.circular(24));

  //* Shadows

  /// Surface: 0 2 12 ink 6 %.
  static const shadowSurface = [
    BoxShadow(offset: Offset(0, 2), blurRadius: 12, color: Color(0x0F1C1A17)),
  ];

  /// Primary button: 0 4 14 bamboo 25 %.
  static const shadowButton = [
    BoxShadow(offset: Offset(0, 4), blurRadius: 14, color: Color(0x401E6B52)),
  ];

  /// Tile outer: 0 4 10 ink 12 %. Bevel insets are drawn by the tile widget.
  static const shadowTile = [
    BoxShadow(offset: Offset(0, 4), blurRadius: 10, color: Color(0x1F1C1A17)),
  ];

  /// Tile selected has 0 10 18 ink 16 %. Replaces [shadowTile], ring is added by the widget.
  static const shadowTileSelected = [
    BoxShadow(offset: Offset(0, 10), blurRadius: 18, color: Color(0x291C1A17)),
  ];

  //* Motion

  /// Motion duration for all transitions
  static const duration = Duration(milliseconds: 250);

  /// Motion curve for all transitions
  static const curve = Cubic(0.2, 0.8, 0.3, 1);

  /// Button pressed: shift down 1 px.
  static const pressedOffset = Offset(0, 1);

  //* Tile selection and highlight

  /// Width of the tile selection ring
  static const ringWidth = 3.0;

  /// Width of the tile highlight halo
  static const haloWidth = 6.0;

  /// Alpha of the tile highlight halo
  static const haloAlpha = 0.15;

  /// Lift of a selected tile
  static const tileLift = 6.0;

  //* Badge

  /// Size of the badge, which is a circle with this diameter
  static const badgeSize = 22.0;

  /// Overhang of the badge, which is how much it extends beyond the corner of the tile
  static const badgeOverhang = 9.0;

  /// Shadow of the badge has 0 2 6 ink 20 %
  static const shadowBadge = [
    BoxShadow(offset: Offset(0, 2), blurRadius: 6, color: Color(0x331C1A17)),
  ];

  /// Size of the badge icon
  static const badgeIconSize = 13.0;
}
