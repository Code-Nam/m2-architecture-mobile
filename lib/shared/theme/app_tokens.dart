import 'package:material_ui/material_ui.dart';
import 'package:tenpai/shared/theme/app_colors.dart';

/// Mode-independent, so plain consts; colours live in [AppColors]
abstract final class AppTokens {
  //* Spacing
  /// The 8 px base unit; every other spacing is a multiple of it.
  static const space1 = 8.0;

  /// 2 units.
  static const space2 = 16.0;

  /// 3 units.
  static const space3 = 24.0;

  /// 4 units.
  static const space4 = 32.0;

  /// Screen edge margin. Off the 8 px grid on purpose: the handoff sets 20.
  static const sideMargin = 20.0;

  /// Lesson progress bar height (handoff: 6 px, radius 3 = radiusProgress).
  static const progressHeight = 6.0;

  /// Full-width CTA height (handoff screens 6–8).
  static const buttonHeight = 56.0;

  /// Gap between hand tiles: 13 × 24 + 12 × 2 = 336 must fit 350 dp.
  static const handGap = 2.0;

  /// Gap between drill hand tiles: 7 × 44 + 6 × 6 = 344 fits 350 dp.
  static const drillGap = 6.0;

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
  ///
  /// Shadows are the one place literal hex is allowed: they are the same in
  /// both modes and `BoxShadow` must be `const`, so they cannot come from
  /// `AppColors`.
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

  /// Chip lift; the closest a Material chip gets to the surface shadow.
  static const chipElevation = 2.0;

  //* Motion

  /// Motion duration for all transitions
  static const duration = Duration(milliseconds: 250);

  /// Motion curve for all transitions
  static const curve = Cubic(0.2, 0.8, 0.3, 1);

  /// Button pressed: shift down 1 px.
  static const pressedOffset = Offset(0, 1);

  /// Connect and receive timeout for the one HTTP client; dio's default is
  /// no timeout at all, which would hang the Yaku Dex on a dead network.
  static const networkTimeout = Duration(seconds: 10);

  //* Tile selection

  /// Width of the tile selection ring
  static const ringWidth = 3.0;

  /// Lift of a selected tile
  static const tileLift = 6.0;

  //* Badge

  /// Badge diameter. One size for every [TileSize]: a known deviation from
  /// the handoff, which scales it with the tile.
  static const badgeSize = 22.0;

  /// How far the badge sticks out past the tile's top-right corner.
  static const badgeOverhang = 9.0;

  /// Shadow of the badge has 0 2 6 ink 20 %
  static const shadowBadge = [
    BoxShadow(offset: Offset(0, 2), blurRadius: 6, color: Color(0x331C1A17)),
  ];

  /// Size of the badge icon
  static const badgeIconSize = 13.0;

  //* Tile bevel and back

  /// Stroke of the inner frame on a face-down tile: translucent white over
  /// the green back gradient.
  static const backFrame = Color(0x2EFFFFFF);

  /// Stroke width of that frame.
  static const backFrameWidth = 1.5;

  /// Frame corner radius as a fraction of the tile radius.
  static const backFrameRadiusFactor = 0.6;

  /// Frame width as a fraction of tile width (30 of 64 in the handoff).
  static const backFrameWidthFactor = 30 / 64;

  /// Frame height as a fraction of tile height (44 of 88 in the handoff).
  static const backFrameHeightFactor = 44 / 88;

  /// Margin around the SVG symbol as a share of tile width, so the art
  /// never touches the bevel bands; applied on all four sides.
  static const symbolInsetFactor = 0.08;

  //* Bevel

  /// Top edge highlight of a face-up tile, drawn as a foreground gradient.
  static const bevelTop = Color(0xF2FFFFFF);

  /// Bottom edge shade of a face-up tile.
  static const bevelBottom = Color(0x171C1A17);

  /// Top edge highlight of a face-down tile; softer than [bevelTop] because
  /// the back is dark.
  static const backHighlight = Color(0x2EFFFFFF);

  /// Height of the top highlight band.
  static const bevelTopHeight = 2.0;

  /// Height of the bottom shade band; the widget scales both by tile height.
  static const bevelBottomHeight = 4.0;

  //* Path (Apprendre)

  /// Completed and locked node diameter.
  static const pathNodeSize = 72.0;

  /// Current node diameter, ring included.
  static const pathNodeSizeCurrent = 96.0;

  /// Progress ring stroke around the current node.
  static const pathRingWidth = 5.0;

  /// Horizontal zigzag as an `Alignment` x value; sign alternates per unit.
  static const pathZigzag = 0.3;

  //* Yaku Dex

  /// Dimming of a locked yaku card (handoff: « atténués »).
  static const lockedOpacity = 0.55;

  // AI-GENERATED (Claude) BEGIN — scanner geometry, milestone 3
  //* Scanner

  /// Stroke of the four corner brackets around the viewfinder frame.
  static const bracketStroke = 3.0;

  /// Length of each bracket arm from the corner.
  static const bracketArm = 28.0;

  /// Share of the screen width the tile-shaped frame takes; height follows
  /// the 64:88 tile ratio.
  static const viewfinderWidthFactor = 0.6;

  /// Diameter of the round shutter.
  static const shutterSize = 72.0;

  /// Ring stroke around the shutter disc.
  static const shutterRing = 4.0;

  /// Drag-handle bar at the top of the result and failure sheets.
  static const sheetHandleWidth = 40.0;

  /// Thickness of that bar.
  static const sheetHandleHeight = 4.0;
  // AI-GENERATED (Claude) END

  //* Entry

  /// Rotation between neighbouring tiles of the welcome fan, in radians
  /// (about 12.6°); the outer tiles get twice that.
  static const fanTileAngle = 0.22;

  // AI-GENERATED (Claude) BEGIN — fan height, milestone 4 review
  /// Height of the fan box as a multiple of a regular tile: room for the
  /// rotated, dropped outer tiles, since `Transform` does not grow layout.
  static const fanHeightFactor = 1.6;
  // AI-GENERATED (Claude) END

  /// Horizontal distance between fanned tile centres; less than a tile
  /// width so they overlap like a held hand.
  static const fanTileOffset = 44.0;

  /// Extra drop per step away from the centre, so the fan arcs.
  static const fanDrop = 12.0;

  /// Height of the Connexion | Inscription control (handoff 02).
  static const segmentHeight = 48.0;

  /// Side of the square card holding the logo tile on the login screen.
  static const logoCardSize = 72.0;

  //* Sensei

  /// Side of the square hanko seal « 先 » (handoff: 22, radius = radiusSeal).
  static const senseiSealSize = 22.0;

  /// Width of the panel's left rule; the only border in the design system.
  static const senseiRule = 3.0;

  /// Loading indicator: three small tiles, not a spinner (handoff rule).
  static const pulseTileWidth = 11.0;

  /// Tile proportion kept (11×15 ≈ 64×88).
  static const pulseTileHeight = 15.0;

  /// Vertical travel of one pulsing tile at the top of its wave.
  static const pulseLift = 5.0;

  /// One full wave; tiles start at 0, 0.2 and 0.4 of it.
  static const pulseDuration = Duration(milliseconds: 1200);

  /// Streaming cursor: a block, not a bar, so it reads as a tile edge.
  static const cursorWidth = 8.0;

  /// Matches the pulsing tile height so the two indicators align.
  static const cursorHeight = 15.0;

  /// Full blink period: visible half, hidden half (steps, no fade).
  static const cursorBlink = Duration(milliseconds: 900);
}
