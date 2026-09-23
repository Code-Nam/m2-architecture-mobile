import 'package:dio/dio.dart';

/// The only place that knows the catalog is fetched over HTTP. Returns raw
/// maps so the repository owns the domain mapping, like `LessonAssetSource`.
class YakuRemoteSource {
  /// [_dio] carries the base URL; the path here is relative to it.
  YakuRemoteSource(this._dio);
  final Dio _dio;

  static const _path = 'yaku/v1/catalog.json';

  /// GETs the catalog and unwraps its `yakus` list. dio already decoded the
  /// JSON (Pages serves `application/json`) and already threw for non-2xx;
  /// a body of the wrong shape fails at the casts, which the repository
  /// surfaces as the retry state.
  Future<List<Map<String, Object?>>> fetchYakus() async {
    final response = await _dio.get<Map<String, Object?>>(_path);
    final yakus = response.data!['yakus']! as List<Object?>;
    return yakus.cast<Map<String, Object?>>();
  }
}
