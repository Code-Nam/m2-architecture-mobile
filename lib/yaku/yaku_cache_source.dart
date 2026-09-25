import 'package:tenpai/yaku/yaku.dart';

/// Offline copy of the catalog, read only when the network fails. A seam of
/// its own so the cache policy in `CachedYakuRepository` tests without Isar.
abstract interface class YakuCacheSource {
  /// Empty list, not an error, when nothing was ever cached.
  Future<List<Yaku>> read();

  /// Swaps the whole cache atomically: never a mix of old and new entries.
  Future<void> replace(List<Yaku> yakus);
}
