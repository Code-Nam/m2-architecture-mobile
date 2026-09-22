import 'package:tenpai/learning/lesson_asset_source.dart';
import 'package:tenpai/learning/lesson_repository.dart';
import 'package:tenpai/shared/models/lesson.dart';
import 'package:tenpai/shared/models/unit.dart';

/// An implementation of [LessonRepository] that loads lessons from assets
class LessonRepositoryImpl implements LessonRepository {
  /// Creates a new [LessonRepositoryImpl] with the given [source]
  LessonRepositoryImpl(this._source);
  final LessonAssetSource _source;

  /// cached Future of units so only one asset read even under concurrent calls
  Future<List<Unit>>? _units;

  @override
  Future<List<Unit>> units() => _units ??= _load();

  Future<List<Unit>> _load() async =>
      (await _source.loadUnits()).map(Unit.fromJson).toList();

  @override
  Future<Lesson> lessonById(String id) async {
    final allUnits = await units();
    return allUnits
        .expand((unit) => unit.lessons)
        .firstWhere(
          (lesson) => lesson.id == id,
          orElse: () =>
              throw ArgumentError.value(id, 'id', 'Unknown lesson ID'),
        );
  }
}
