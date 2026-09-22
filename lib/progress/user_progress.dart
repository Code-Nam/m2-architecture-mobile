import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tenpai/shared/models/lesson.dart';
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

/// Status of one path node. The handoff shows one node per unit, so this is
/// what the path screen renders; [statusOf] then picks the lesson inside.
///
/// `completed` needs every lesson done (an empty unit never completes);
/// otherwise `current` when [isUnitPlayable], else `locked`.
LessonStatus unitStatusOf(
  List<Unit> units,
  int unitIndex,
  UserProgress progress,
) {
  final lessons = units[unitIndex].lessons;
  if (lessons.isNotEmpty &&
      lessons.every((lesson) => progress.isCompleted(lesson.id))) {
    return .completed;
  }
  return isUnitPlayable(units, unitIndex, progress) ? .current : .locked;
}

/// Numerator of the « 3 / 6 » counter on a current node.
int completedCount(Unit unit, UserProgress progress) =>
    unit.lessons.where((lesson) => progress.isCompleted(lesson.id)).length;

/// The lesson a tap on a playable unit node opens: the first `current` one,
/// or the first lesson when the unit is fully completed (replay). Callers
/// guard with [unitStatusOf] != `locked`, so [unit] is never empty here.
Lesson lessonToOpen(Unit unit, UserProgress progress) {
  for (var i = 0; i < unit.lessons.length; i++) {
    if (statusOf(unit, i, progress) == .current) {
      return unit.lessons[i];
    }
  }
  return unit.lessons.first;
}
