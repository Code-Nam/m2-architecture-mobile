import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_session.freezed.dart';

/// Where the user is inside one lesson: the block shown, the option picked,
/// and whether it has been checked.
///
/// Replaced wholesale on every change by the notifier; never mutated.
@freezed
abstract class LessonSession with _$LessonSession {
  /// [selectedOption] stays null until the user taps an option.
  const factory LessonSession({
    required String lessonId,
    required int blockIndex,
    int? selectedOption,
    required bool isAnswered,
  }) = _LessonSession;
}
