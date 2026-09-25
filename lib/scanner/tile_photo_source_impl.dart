import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:tenpai/scanner/tile_photo_source.dart';

/// Only file that knows image_picker. Camera only (school requirement:
/// single-shot photo); bytes capped so M5 sends a small image to the model.
class TilePhotoSourceImpl implements TilePhotoSource {
  /// [_picker] is injected so tests never touch the platform channel.
  TilePhotoSourceImpl(this._picker);
  final ImagePicker _picker;

  /// Downscaled at capture: a tile fills the frame, so 1024 px keeps every
  /// detail while the M5 upload stays small. The fake ignores pixels anyway.
  static const _maxWidth = 1024.0;
  static const _quality = 85;

  // AI-GENERATED (Claude) BEGIN — gallery option, grading fixes Task 2
  /// Same downscale for both sources, so a large gallery photo uploads as
  /// small as a camera shot.
  @override
  Future<Uint8List?> capture({bool fromGallery = false}) async {
    final file = await _picker.pickImage(
      source: fromGallery ? ImageSource.gallery : ImageSource.camera,
      // AI-GENERATED (Claude) END
      maxWidth: _maxWidth,
      imageQuality: _quality,
    );
    return file?.readAsBytes();
  }
}
