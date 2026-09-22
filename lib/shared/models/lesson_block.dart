import 'package:freezed_annotation/freezed_annotation.dart';
part 'lesson_block.freezed.dart';
part 'lesson_block.g.dart';

/// One step of a lesson. Sealed so the renderer switches exhaustively;
/// adding a block type is a compile error everywhere it is not handled.
@Freezed(unionKey: 'type')
sealed class LessonBlock with _$LessonBlock {
  /// Text with one big demo tile. [tile] is a code in `Tile.parse` format;
  /// it is parsed at render time so content errors surface on screen.
  const factory LessonBlock.explanation({
    required String tile,
    required String title,
    required String body,
  }) = ExplanationBlock;

  /// Not authored before milestone 6; parses so content can declare it early.
  const factory LessonBlock.drill() = DrillBlock;

  /// Multiple-choice question over a 13-tile hand. [options] has exactly 4
  /// entries (2×2 grid); [feedback] is the one line shown after checking.
  const factory LessonBlock.quiz({
    required String question,
    required List<String> hand,
    required List<String> options,
    required int correctIndex,
    required String feedback,
  }) = QuizBlock;

  /// Not authored before milestone 6; parses so content can declare it early.
  const factory LessonBlock.interactive() = InteractiveBlock;

  /// Dispatches on the `type` key, the freezed `unionKey`.
  factory LessonBlock.fromJson(Map<String, Object?> json) =>
      _$LessonBlockFromJson(json);
}
