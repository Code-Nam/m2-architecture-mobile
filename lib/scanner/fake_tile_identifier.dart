import 'dart:typed_data';

import 'package:tenpai/scanner/tile_identifier.dart';
import 'package:tenpai/shared/models/tile.dart';

/// Stand-in until M5: a hash of the bytes picks a tile, so the same photo
/// always gives the same answer and one photo in five gives none.
class FakeTileIdentifier implements TileIdentifier {
  @override
  Future<Tile?> identify(Uint8List photo) async {
    final hash = photo.fold(17, (h, b) => h * 31 + b) & 0x7fffffff;
    if (hash % 5 == 0) return null;
    final index = hash % 34;
    if (index >= 27) return Tile(suit: .honor, number: index - 26);
    final number = index % 9 + 1;
    return Tile(
      suit: TileSuit.values[index ~/ 9],
      number: number,
      isRed: number == 5 && hash % 2 == 0,
    );
  }
}
