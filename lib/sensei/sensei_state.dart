import 'package:freezed_annotation/freezed_annotation.dart';

part 'sensei_state.freezed.dart';

/// Where one Sensei answer is, per request (handoff « états obligatoires »).
/// Carries the *cumulative* text: the repository streams chunks, the notifier
/// concatenates, the panel only renders. Sealed so the panel switches
/// exhaustively; the offline case is a variant, not a flag on `failed`,
/// because it has different copy and no « Réessayer ».
@freezed
sealed class SenseiState with _$SenseiState {
  /// Nothing asked yet. The lesson sheet shows « Pourquoi ? » in this state.
  const factory SenseiState.idle() = SenseiIdle;
  /// Request sent, no chunk received: three pulsing tiles, never a spinner.
  const factory SenseiState.loading() = SenseiLoading;
  /// At least one chunk in; [text] grows until the stream closes.
  const factory SenseiState.streaming(String text) = SenseiStreaming;
  /// Stream closed with text; the cursor disappears.
  const factory SenseiState.done(String text) = SenseiDone;
  /// Any non-network error, or an empty stream: honest message + « Réessayer ».
  const factory SenseiState.failed() = SenseiFailed;
  /// `SocketException` on the way out: note only, retry comes with the network.
  const factory SenseiState.offline() = SenseiOffline;
}
