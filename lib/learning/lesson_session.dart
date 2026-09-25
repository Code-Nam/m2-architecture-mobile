import 'package:freezed_annotation/freezed_annotation.dart';
// AI-GENERATED (Claude) BEGIN — verdict import, grading fixes Task 1
import 'package:tenpai/sensei/sensei_request.dart';
// AI-GENERATED (Claude) END

part 'lesson_session.freezed.dart';

/// Where the user is inside one lesson: the block shown, the option picked,
/// and whether it has been checked.
///
/// Replaced wholesale on every change by the notifier; never mutated.
@freezed
abstract class LessonSession with _$LessonSession {
  /// [selectedOption] stays null until the user taps an option (quiz,
  /// interactive); [picked] holds the toggled hand indices of a drill and
  /// defaults to empty, so every other block ignores it.
  // AI-GENERATED (Claude) BEGIN — verdict fields, grading fixes Task 1
  /// [isCorrect] and [whyRequest] are set by `check()` only: null before
  /// checking, so widgets read a verdict instead of computing one.
  /// [whyRequest] is non-null only on a quiz or drill miss.
  const factory LessonSession({
    required String lessonId,
    required int blockIndex,
    int? selectedOption,
    required bool isAnswered,
    @Default(<int>{}) Set<int> picked,
    bool? isCorrect,
    SenseiRequest? whyRequest,
  }) = _LessonSession;
  // AI-GENERATED (Claude) END
}
