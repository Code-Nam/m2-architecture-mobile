/// Rendered size of a tile. All values keep the 64:88 ratio
enum TileSize {
  /// Hand row
  small(24, 34),

  /// Quiz row
  option(48, 66),

  /// Default
  regular(64, 88),

  /// Lesson demo
  demo(110, 152);

  const TileSize(this.width, this.height);

  /// Logical pixels width of the tile
  final double width;

  /// Logical pixels height of the tile
  final double height;
}
