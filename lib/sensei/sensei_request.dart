import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tenpai/shared/models/tile.dart';

part 'sensei_request.freezed.dart';

/// What the Sensei is asked about. A freezed value on purpose: it keys the
/// `senseiProvider` family, so two requests built from the same quiz (deep
/// list equality included) share one answer, and a new block gets a new one.
/// The prompt wording lives in the repository, not here.
@freezed
sealed class SenseiRequest with _$SenseiRequest {
  /// Built by the lesson screen on a miss; [chosenIndex] and [correctIndex]
  /// point into [options] so the prompt can quote both answers.
  const factory SenseiRequest.quizMiss({
    required String question,
    required List<String> hand,
    required List<String> options,
    required int chosenIndex,
    required int correctIndex,
    required String feedback,
  }) = QuizMissRequest;

  /// Built by the scanner result sheet once a tile is identified.
  const factory SenseiRequest.tileContext(Tile tile) = TileContextRequest;

  /// Built by the drill on a miss. [picked] and [answers] are indices into
  /// [hand], sorted so two identical misses share one provider key.
  const factory SenseiRequest.drillMiss({
    required String prompt,
    required List<String> hand,
    required List<int> picked,
    required List<int> answers,
    required String feedback,
  }) = DrillMissRequest;
}
