import 'package:firebase_ai/firebase_ai.dart';
import 'package:tenpai/sensei/sensei_repository.dart';
import 'package:tenpai/sensei/sensei_request.dart';
import 'package:tenpai/shared/models/tile_labels.dart';

/// The one file that turns a [SenseiRequest] into words for the model. The
/// model is injected already configured (name, system instruction) so this
/// class never touches `FirebaseAI` and tests can hand it nothing at all:
/// they override the repository provider with a fake instead.
class FirebaseSenseiRepository implements SenseiRepository {
  /// [_model] comes from `senseiModelProvider`; one instance per app run.
  FirebaseSenseiRepository(this._model);
  final GenerativeModel _model;

  /// `generateContentStream` is obtained synchronously and yields one
  /// `GenerateContentResponse` per SSE chunk. `chunk.text` is null for
  /// chunks without a text part and *throws* `FirebaseAIException` when the
  /// prompt was blocked; the throw lands on this stream's error path, where
  /// the notifier already maps it to the failure state.
  @override
  Stream<String> explain(SenseiRequest request) => _model
      .generateContentStream([Content.text(_prompt(request))])
      .map((chunk) => chunk.text ?? '')
      .where((text) => text.isNotEmpty);
}

/// French, one paragraph, exhaustive over the sealed request. The tone and
/// length rules live in the system instruction (provider), not here.
String _prompt(SenseiRequest request) => switch (request) {
  QuizMissRequest(
    :final question,
    :final hand,
    :final options,
    :final chosenIndex,
    :final correctIndex,
    :final feedback,
  ) =>
    'Question : $question. '
        'Main : ${hand.join(' ')}. '
        'Propositions : ${options.join(' / ')}. '
        "L'élève a choisi « ${options[chosenIndex]} » ; "
        'la bonne réponse est « ${options[correctIndex]} ». '
        'Indice de la leçon : $feedback. '
        'Explique pourquoi son choix ne convient pas et pourquoi la bonne '
        'réponse est meilleure, en partant de SON raisonnement.',
  TileContextRequest(:final tile) =>
    'Tuile : ${tileName(tile)} (${tileFamily(tile)}). '
        "Donne en deux ou trois phrases ce qu'un débutant doit savoir sur "
        'cette tuile à la table (rôle, valeur, piège fréquent).',
};
