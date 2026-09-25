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

  /// « Find in the hand »: the learner taps every tile [prompt] asks for.
  /// [answers] are hand indices chosen by the author (no evaluation engine);
  /// their range is checked by the content test, not here, since an
  /// `@Assert` cannot loop. Not `const`: the asserts read the lists.
  @Assert('hand.length == 13', 'a drill hand has 13 tiles')
  @Assert('answers.length > 0', 'a drill needs at least one answer')
  factory LessonBlock.drill({
    required String prompt,
    required List<String> hand,
    required List<int> answers,
    required String feedback,
  }) = DrillBlock;

  /// Multiple-choice question over a 13-tile hand. [options] has exactly 4
  /// entries (2×2 grid); [feedback] is the one line shown after checking.
  /// Not `const`, unlike its siblings: the asserts read the list.
  // AI-GENERATED (Claude) BEGIN — content invariant, review finding 2026-09-23
  @Assert('options.length == 4', 'a quiz has exactly four options')
  @Assert(
    'correctIndex >= 0 && correctIndex < 4',
    'correctIndex must point at one of the four options',
  )
  // AI-GENERATED (Claude) END
  factory LessonBlock.quiz({
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
