import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_session.freezed.dart';

/// Represents the state of a lesson session
@freezed
abstract class LessonSession with _$LessonSession {
  /// Creates a new [LessonSession] with the given
  /// [lessonId], [blockIndex], [selectedOption], and [isAnswered]
  const factory LessonSession({
    required String lessonId,
    required int blockIndex,
    int? selectedOption,
    required bool isAnswered,
  }) = _LessonSession;
}
