import 'package:flutter/foundation.dart';
import 'package:tenpai/yaku/yaku.dart';
import 'package:tenpai/yaku/yaku_cache_source.dart';
import 'package:tenpai/yaku/yaku_repository.dart';

/// Network first, cache fallback: a fresh catalog always wins and refreshes
/// the cache; offline, the last good copy is served; with no copy, the
/// network error propagates so the Dex shows « Réessayer ».
class CachedYakuRepository implements YakuRepository {
  /// [_remote] keeps its own in-flight caching; this class only adds the
  /// offline layer on top.
  CachedYakuRepository(this._remote, this._cache);
  final YakuRepository _remote;
  final YakuCacheSource _cache;

  @override
  Future<List<Yaku>> catalog() async {
    try {
      final fresh = await _remote.catalog();
      await _cache.replace(fresh);
      return fresh;
    } on Exception catch (e, s) {
      debugPrint('yaku catalog offline, trying cache: $e\n$s');
      final cached = await _cache.read();
      if (cached.isEmpty) rethrow;
      return cached;
    }
  }
}
