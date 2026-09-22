import 'package:tenpai/shared/models/lesson.dart';
import 'package:tenpai/shared/models/unit.dart';

/// A repository of lessons
abstract interface class LessonRepository {
  /// Returns the list of units
  Future<List<Unit>> units();

  /// Returns the lesson with the given [id]
  Future<Lesson> lessonById(String id);
}
