import 'dart:typed_data';

/// Seam between the scanner and the camera: notifier and tests never see
/// image_picker. Null means the user backed out, not a failure.
abstract interface class TilePhotoSource {
  // AI-GENERATED (Claude) BEGIN — gallery option, grading fixes Task 2
  /// Opens the camera, or the photo gallery when [fromGallery], and waits
  /// for one image. Null when the user cancels; a platform failure throws
  /// and the caller decides what to show.
  Future<Uint8List?> capture({bool fromGallery = false});
  // AI-GENERATED (Claude) END
}
