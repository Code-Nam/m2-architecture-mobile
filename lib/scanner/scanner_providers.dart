import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tenpai/scanner/fake_tile_identifier.dart';
import 'package:tenpai/scanner/scan_state.dart';
import 'package:tenpai/scanner/tile_identifier.dart';
import 'package:tenpai/scanner/tile_photo_source.dart';
import 'package:tenpai/scanner/tile_photo_source_impl.dart';

/// Swap point: tests override with a scripted fake.
final tilePhotoSourceProvider = Provider<TilePhotoSource>(
  (_) => TilePhotoSourceImpl(ImagePicker()),
);

/// Fake until M5 swaps in firebase_ai behind the same interface.
final tileIdentifierProvider = Provider<TileIdentifier>(
  (_) => FakeTileIdentifier(),
);

/// Not auto-dispose: the result sheet survives a tab switch.
final scanProvider = NotifierProvider<ScanNotifier, ScanState>(
  ScanNotifier.new,
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
      state = tile == null ? const ScanState.notFound() : ScanState.found(tile);
    } on Exception catch (e, s) {
      debugPrint('scan failed: $e\n$s');
      state = const ScanState.notFound();
    }
  }
}
