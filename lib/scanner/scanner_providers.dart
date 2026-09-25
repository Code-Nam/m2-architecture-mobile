import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tenpai/local/isar_providers.dart';
import 'package:tenpai/scanner/firebase_tile_identifier.dart';
import 'package:tenpai/scanner/isar_scan_history_repository.dart';
import 'package:tenpai/scanner/scan_history_repository.dart';
import 'package:tenpai/scanner/scan_record.dart';
import 'package:tenpai/scanner/scan_state.dart';
import 'package:tenpai/scanner/tile_identifier.dart';
import 'package:tenpai/scanner/tile_photo_source.dart';
import 'package:tenpai/scanner/tile_photo_source_impl.dart';
import 'package:tenpai/sensei/sensei_providers.dart';

/// Gemini behind the M3 interface; the model instance comes from the sensei
/// providers so both features share one backend. Tests override this with
/// the scripted fake in `test/fakes/`.
final tileIdentifierProvider = Provider<TileIdentifier>(
  (ref) => FirebaseTileIdentifier(ref.watch(identifierModelProvider)),
);

/// Swap point: tests override with a scripted fake.
final tilePhotoSourceProvider = Provider<TilePhotoSource>(
  (_) => TilePhotoSourceImpl(ImagePicker()),
);

/// Not auto-dispose: the result sheet survives a tab switch.
final scanProvider = NotifierProvider<ScanNotifier, ScanState>(
  ScanNotifier.new,
);

/// Swap point: tests override with a recording fake, never Isar.
final scanHistoryRepositoryProvider = Provider<ScanHistoryRepository>(
  (ref) => IsarScanHistoryRepository(ref.watch(isarProvider)),
);

/// Live history, newest first; never invalidated by hand, Isar re-emits
/// after every `add`.
final scanHistoryProvider = StreamProvider<List<ScanRecord>>(
  (ref) => ref.watch(scanHistoryRepositoryProvider).watch(),
);

/// Distinct tile codes ever scanned (Profil « Tuiles maîtrisées »); a red
/// five counts apart from its plain five, by design. 0 before the first
/// emission; after a stream error it keeps the last count, since
/// `AsyncValue.value` holds the previous data. Never an error of its own.
final masteredTilesProvider = Provider<int>(
  (ref) =>
      {...?ref.watch(scanHistoryProvider).value?.map((r) => r.code)}.length,
);

/// Owns the scan flow. Public only as the provider's type argument.
class ScanNotifier extends Notifier<ScanState> {
  @override
  ScanState build() => const ScanState.idle();

  /// One shutter press: camera → identifier → sheet. Any [Exception] from
  /// the camera or the identifier lands on the failure sheet with
  /// « Réessayer »; an [Error] is a bug and stays loud. A press while a
  /// scan is open is ignored: image_picker refuses a second camera session.
  Future<void> scan() async {
    if (state is ScanAnalysing) return;
    state = const ScanState.analysing();

    try {
      final bytes = await ref.read(tilePhotoSourceProvider).capture();
      if (bytes == null) {
        state = const ScanState.idle();
        return;
      }
      final tile = await ref.read(tileIdentifierProvider).identify(bytes);
      if (tile == null) {
        state = const ScanState.notFound();
        return;
      }
      state = ScanState.found(tile);
      try {
        await ref.read(scanHistoryRepositoryProvider).add(tile);
      } on Object catch (e, s) {
        debugPrint('scan history write failed: $e\n$s');
      }
    } on Exception catch (e, s) {
      debugPrint('scan failed: $e\n$s');
      state = const ScanState.notFound();
    }
  }
}
