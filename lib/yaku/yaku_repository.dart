import 'package:tenpai/yaku/yaku.dart';

/// Read side of the yaku catalog; the seam tests fake. The Isar-cached
/// implementation (M4+) replaces the remote one behind this interface.
abstract interface class YakuRepository {
  /// Every yaku in catalog order. Throws on network or shape errors.
  Future<List<Yaku>> catalog();
}
