import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tenpai/shared/models/tile.dart';

part 'scan_state.freezed.dart';

/// Where the scanner is: the four states of handoff screens 14–17. Sealed so
/// the screen switches exhaustively; the Sensei states (M5) will be added as
/// variants here, not as flags.
@freezed
sealed class ScanState with _$ScanState {
  /// Viewfinder shown, shutter armed. Also the state after a cancelled camera.
  const factory ScanState.idle() = ScanIdle;

  /// Camera open or identifier running; the shutter is disabled meanwhile.
  const factory ScanState.analysing() = ScanAnalysing;

  /// Result sheet: [tile] is the identified tile, shown big with its name.
  const factory ScanState.found(Tile tile) = ScanFound;

  /// Failure sheet: nothing identified, or the picker threw.
  const factory ScanState.notFound() = ScanNotFound;
}
