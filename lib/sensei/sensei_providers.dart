import 'dart:io';

import 'package:firebase_ai/firebase_ai.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tenpai/app/app_config.dart';
import 'package:tenpai/sensei/firebase_sensei_repository.dart';
import 'package:tenpai/sensei/sensei_repository.dart';
import 'package:tenpai/sensei/sensei_request.dart';
import 'package:tenpai/sensei/sensei_state.dart';

const _system =
    'Tu es un sensei de riichi mahjong, patient et précis. '
    'Tu réponds en français, en trois phrases au plus, sans markdown, '
    'sans emoji, sans salutation.';

/// One text model per app run, system instruction baked in; App Check is
/// picked up by `FirebaseAI.googleAI()` itself. Never overridden in tests:
/// they replace [senseiRepositoryProvider] instead.
final senseiModelProvider = Provider<GenerativeModel>(
  (_) => FirebaseAI.googleAI().generativeModel(
    model: AppConfig.senseiModel,
    systemInstruction: Content.system(_system),
  ),
);

/// Second instance without the system instruction: the identifier's JSON
/// schema is its whole contract and the three-sentence rule would fight it.
final identifierModelProvider = Provider<GenerativeModel>(
  (_) => FirebaseAI.googleAI().generativeModel(model: AppConfig.senseiModel),
);

/// Swap point: tests override with a scripted fake, no network.
final senseiRepositoryProvider = Provider<SenseiRepository>(
  (ref) => FirebaseSenseiRepository(ref.watch(senseiModelProvider)),
);

/// One answer per request. Keyed by the freezed [SenseiRequest] so the same
/// quiz miss shares a member and the next block gets a fresh one;
/// auto-disposed with its widget, which also cancels a running stream.
final senseiProvider =
    NotifierProvider.family<SenseiNotifier, SenseiState, SenseiRequest>(
      SenseiNotifier.new,
      isAutoDispose: true,
    );

/// Owns one explanation stream. Public only as the provider's type argument.
class SenseiNotifier extends Notifier<SenseiState> {
  /// The family argument; the prompt is built from it by the repository.
  SenseiNotifier(this._request);
  final SenseiRequest _request;
  @override
  SenseiState build() => const SenseiState.idle();

  /// Starts (or restarts after a failure) the stream. A tap while loading or
  /// streaming is ignored. Chunks accumulate here, not in the widget; an empty
  /// stream is a failure, a `SocketException` is offline, anything else failed.
  /// `ref.onDispose` cancels the subscription when the panel leaves the tree.
  void ask() {
    if (state is SenseiLoading || state is SenseiStreaming) return;
    state = const SenseiState.loading();
    var text = '';
    final sub = ref
        .read(senseiRepositoryProvider)
        .explain(_request)
        .listen(
          (chunk) => state = SenseiState.streaming(text += chunk),
          onDone: () => state = text.isEmpty
              ? const SenseiState.failed()
              : SenseiState.done(text),
          onError: (Object e, StackTrace s) {
            debugPrint('sensei failed: $e\n$s');
            state = e is SocketException
                ? const SenseiState.offline()
                : const SenseiState.failed();
          },
          cancelOnError: true,
        );
    ref.onDispose(sub.cancel);
  }
}
