import 'package:tenpai/shared/models/tile.dart';
import 'package:tenpai/yaku/yaku.dart';
import 'package:tenpai/yaku/yaku_remote_source.dart';
import 'package:tenpai/yaku/yaku_repository.dart';

/// Remote-backed [YakuRepository]. Caches the in-flight `Future` so
/// concurrent callers share one request, and drops it on failure so
/// « Réessayer » can actually retry (same lesson as `LessonRepositoryImpl`).
class YakuRepositoryImpl implements YakuRepository {
  /// Takes the source rather than a `Dio` so tests can fake at either level.
  YakuRepositoryImpl(this._source);
  final YakuRemoteSource _source;
  Future<List<Yaku>>? _catalog;

  @override
  Future<List<Yaku>> catalog() async {
    try {
      return await (_catalog ??= _load());
    } catch (_) {
      _catalog = null;
      rethrow;
    }
  }

  /// Parses, then validates every tile code here rather than in `build`: the
  /// catalog is untrusted input, and a throw inside the cached future becomes
  /// the retry state instead of a red screen on the Yakus tab.
  Future<List<Yaku>> _load() async {
    final yakus = (await _source.fetchYakus()).map(Yaku.fromJson).toList();
    // AI-GENERATED (Claude) BEGIN — tile validation, milestone 2 review
    for (final yaku in yakus) {
      yaku.tiles.forEach(Tile.parse);
    }
    // AI-GENERATED (Claude) END
    return yakus;
  }
}
