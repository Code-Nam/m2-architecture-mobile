import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tenpai/shared/models/unit.dart';

part 'user_progress.freezed.dart';

/// What the user has achieved: completed lesson ids and total XP.
///
/// Immutable; the repository returns a new instance on every change.
@freezed
abstract class UserProgress with _$UserProgress {
  const UserProgress._();

  /// freezed stores [completedLessonIds] unmodifiable; build a new set to
  /// add to it (see the repository implementations).
  const factory UserProgress({
    required Set<String> completedLessonIds,
    required int xp,
  }) = _UserProgress;

  /// Source of truth for [statusOf] and [isUnitPlayable].
  bool isCompleted(String lessonId) => completedLessonIds.contains(lessonId);
}

/// How a lesson shows on the path screen.
enum LessonStatus {
  /// Done; stays replayable.
  completed,

  /// Next playable lesson, not started.
  current,

  /// Not reachable until the previous lesson is completed.
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
