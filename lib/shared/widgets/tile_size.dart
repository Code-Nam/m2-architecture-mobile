/// Rendered size of a tile. All values keep the 64:88 ratio
enum TileSize {
  /// Hand row
  small(24, 34, 4),

  /// Tappable hand (drill): 7 + 6 fit 350 dp with a 6 dp gap.
  hand(44, 61, 6),

  /// Quiz row
  option(48, 66, 7),

  /// Default
  regular(64, 88, 10),

  /// Lesson demo
  demo(110, 152, 16);

  const TileSize(this.width, this.height, this.radius);

  /// Logical pixels width of the tile
  final double width;

  /// Logical pixels height of the tile
  final double height;

  /// Logical pixels corner radius of the tile
  final double radius;
}
