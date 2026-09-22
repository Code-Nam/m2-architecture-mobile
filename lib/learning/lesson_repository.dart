import 'package:tenpai/shared/models/lesson.dart';
import 'package:tenpai/shared/models/unit.dart';

/// Read side of lesson content.
///
/// Screens and providers depend on this, never on where content comes from;
/// today that is bundled JSON, and tests substitute a fake.
abstract interface class LessonRepository {
  /// Every unit in path order, including units authored with no lessons yet.
  Future<List<Unit>> units();

  /// Throws [ArgumentError] for an unknown id. Ids come from content or from
  /// the route, so a miss is a bug, not a state to render.
  Future<Lesson> lessonById(String id);
}
