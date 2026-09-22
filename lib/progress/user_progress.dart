import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tenpai/shared/models/unit.dart';

part 'user_progress.freezed.dart';

/// Represents the progress of a user through the lessons
@freezed
abstract class UserProgress with _$UserProgress {
  const UserProgress._();

  /// Creates a new [UserProgress] with the given [completedLessonIds] and [xp]
  const factory UserProgress({
    required Set<String> completedLessonIds,
    required int xp,
  }) = _UserProgress;

  /// Returns true if the lesson with the given [lessonId] is completed
  bool isCompleted(String lessonId) => completedLessonIds.contains(lessonId);
}

/// An enum representing the status of a lesson for a user
enum LessonStatus {
  /// Completed lessons
  completed,

  /// Next playable lesson, not started
  current,

  /// Locked lessons
  locked,
}

/// Status of the lesson at [lessonIndex] in [unit] for [progress].
///
/// `completed` when the lesson id is in [progress]; `current` when it is the
/// first lesson or the previous one is completed; `locked` otherwise.
/// Unit-level gating is not this function's job (see [isUnitPlayable]).
LessonStatus statusOf(Unit unit, int lessonIndex, UserProgress progress) {
  final lesson = unit.lessons[lessonIndex];
  if (progress.isCompleted(lesson.id)) return .completed;
  final unlocked =
      lessonIndex == 0 ||
      progress.isCompleted(unit.lessons[lessonIndex - 1].id);
  return unlocked ? .current : .locked;
}

/// Whether the unit at [unitIndex] in [units] can be opened for [progress].
///
/// A unit with no lessons is never playable. The first unit is playable;
/// any other unit needs the previous unit's last lesson completed.
bool isUnitPlayable(List<Unit> units, int unitIndex, UserProgress progress) {
  if (units[unitIndex].lessons.isEmpty) return false;
  if (unitIndex == 0) return true;
  final previous = units[unitIndex - 1].lessons;
  return previous.isNotEmpty && progress.isCompleted(previous.last.id);
}
