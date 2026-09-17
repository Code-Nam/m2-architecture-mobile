import 'package:material_ui/material_ui.dart';
import 'package:tenpai/app/theme/app_colors.dart';

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

  /// Tiles
  static const radiusTile = BorderRadius.all(Radius.circular(10));

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

  //* Motion

  /// Motion duration for all transitions
  static const duration = Duration(milliseconds: 250);

  /// Motion curve for all transitions
  static const curve = Cubic(0.2, 0.8, 0.3, 1);

  /// Button pressed: shift down 1 px.
  static const pressedOffset = Offset(0, 1);
}
