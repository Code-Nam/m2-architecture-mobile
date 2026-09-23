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

  /// One shutter press: camera → identifier → sheet. Every failure lands on
  /// the failure sheet with « Réessayer », never a red screen.
  Future<void> scan() async {
    state = const ScanState.analysing();
    try {
      final bytes = await ref.read(tilePhotoSourceProvider).capture();
      if (bytes == null) {
        state = const ScanState.idle();
        return;
      }
      final tile = await ref.read(tileIdentifierProvider).identify(bytes);
      state = tile == null ? const ScanState.notFound() : ScanState.found(tile);
    } on Exception {
      state = const ScanState.notFound();
    }
  }
}
