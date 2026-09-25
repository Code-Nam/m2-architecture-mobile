import 'package:freezed_annotation/freezed_annotation.dart';

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
  const factory LessonSession({
    required String lessonId,
    required int blockIndex,
    int? selectedOption,
    required bool isAnswered,
    @Default(<int>{}) Set<int> picked,
  }) = _LessonSession;
}
