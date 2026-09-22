import 'package:tenpai/learning/lesson_asset_source.dart';
import 'package:tenpai/learning/lesson_repository.dart';
import 'package:tenpai/shared/models/lesson.dart';
import 'package:tenpai/shared/models/unit.dart';

/// Loads every unit once from [LessonAssetSource], then serves from memory.
class LessonRepositoryImpl implements LessonRepository {
  /// The source is injected, not built here, so providers own the wiring and
  /// tests can feed JSON through a fake bundle.
  LessonRepositoryImpl(this._source);
  final LessonAssetSource _source;

  /// Cached as a `Future`, not a list: concurrent first calls share one
  /// asset read instead of each starting their own.
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
