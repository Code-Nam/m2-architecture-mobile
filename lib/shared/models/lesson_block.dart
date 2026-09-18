import 'package:freezed_annotation/freezed_annotation.dart';
part 'lesson_block.freezed.dart';
part 'lesson_block.g.dart';

/// Represents a block of content in a lesson. Can be an explanation, drill, quiz, or interactive block.
@Freezed(unionKey: 'type')
sealed class LessonBlock with _$LessonBlock {
  /// Explanation block with a title, a tile code in [Tile.parse] and a body text.
  const factory LessonBlock.explanation({
    required String tile,
    required String title,
    required String body,
  }) = ExplanationBlock;

  /// Placeholder
  const factory LessonBlock.drill() = DrillBlock;

  /// Multiple-choice question over a 13-tile hand. `options` has 4 entries.
  const factory LessonBlock.quiz({
    required String question,
    required List<String> hand,
    required List<String> options,
    required int correctIndex,
    required String feedback,
  }) = QuizBlock;

  /// Placeholder
  const factory LessonBlock.interactive() = InteractiveBlock;

  factory LessonBlock.fromJson(Map<String, Object?> json) =>
      _$LessonBlockFromJson(json);
}
