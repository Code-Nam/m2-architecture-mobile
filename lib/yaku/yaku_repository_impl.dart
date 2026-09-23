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

  Future<List<Yaku>> _load() async =>
      (await _source.fetchYakus()).map(Yaku.fromJson).toList();
}
