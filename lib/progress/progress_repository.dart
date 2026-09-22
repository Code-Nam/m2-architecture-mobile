import 'package:tenpai/progress/user_progress.dart';
import 'package:tenpai/shared/models/lesson.dart';

/// Read and write side of progress.
///
/// In memory during milestone 1, Firestore later; the interface is the swap
/// point, so it takes whole [Lesson]s and returns whole [UserProgress]
/// values rather than exposing storage details.
abstract interface class ProgressRepository {
  /// Current progress; empty (no ids, zero XP) for a new user.
  Future<UserProgress> load();

  /// Marks [lesson] completed and adds its XP at most once, returning the new
  /// progress. Takes the lesson, not an id, so XP comes from content.
  Future<UserProgress> completeLesson(Lesson lesson);
}
