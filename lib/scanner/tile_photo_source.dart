import 'dart:typed_data';

/// Seam between the scanner and the camera: notifier and tests never see
/// image_picker. Null means the user backed out, not a failure.
abstract interface class TilePhotoSource {
  /// Opens the camera and waits for one shot. Null when the user cancels;
  /// a platform failure throws and the caller decides what to show.
  Future<Uint8List?> capture();
}
