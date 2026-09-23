import 'package:tenpai/sensei/sensei_request.dart';

/// What the two Sensei surfaces ask of any explainer; the Firebase
/// implementation and the test fake sit behind it so no screen or notifier
/// imports `firebase_ai`.
abstract interface class SenseiRepository {
  /// Emits text *chunks*, not the cumulative text: the notifier appends.
  /// Errors travel on the stream's error path (network → offline, anything
  /// else → failed, decided by the caller); an empty stream is legal and the
  /// caller treats it as a failure.
  Stream<String> explain(SenseiRequest request);
}
