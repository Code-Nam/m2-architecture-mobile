import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tenpai/shared/models/tile.dart';

part 'sensei_request.freezed.dart';

/// What the Sensei is asked about. A freezed value on purpose: it keys the
/// `senseiProvider` family, so two requests built from the same quiz (deep
/// list equality included) share one answer, and a new block gets a new one.
/// The prompt wording lives in the repository, not here.
@freezed
sealed class SenseiRequest with _$SenseiRequest {
  // AI-GENERATED (Claude) BEGIN — no answer in the request, Task 12 review
  /// Built by the lesson screen on a miss; [chosenIndex] points into
  /// [options] so the prompt can quote the pick. Carries neither the right
  /// index nor the authored feedback (it names the answer): the model cannot
  /// reveal what it is never given.
  const factory SenseiRequest.quizMiss({
    required String question,
    required List<String> hand,
    required List<String> options,
    required int chosenIndex,
  }) = QuizMissRequest;
  // AI-GENERATED (Claude) END

  /// Built by the scanner result sheet once a tile is identified.
  const factory SenseiRequest.tileContext(Tile tile) = TileContextRequest;

  // AI-GENERATED (Claude) BEGIN — no feedback in the request, Task 12 review
  /// Built by the drill on a miss. [picked] and [answers] are indices into
  /// [hand]; the caller sorts [picked] so two identical misses share one
  /// provider key. [answers] only lets the prompt count forgotten tiles; the
  /// prompt never names them.
  const factory SenseiRequest.drillMiss({
    required String prompt,
    required List<String> hand,
    required List<int> picked,
    required List<int> answers,
  }) = DrillMissRequest;
  // AI-GENERATED (Claude) END
}
