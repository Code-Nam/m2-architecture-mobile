import 'dart:typed_data';

import 'package:tenpai/shared/models/tile.dart';

/// What the scanner asks of any recogniser. Async now so the M5 firebase_ai
/// implementation slots in without touching the notifier. Null = nothing seen.
abstract interface class TileIdentifier {
  /// Null when no tile is recognised; that is a normal outcome (failure
  /// sheet), not an error. Throws only when the recogniser itself breaks.
  Future<Tile?> identify(Uint8List photo);
}
