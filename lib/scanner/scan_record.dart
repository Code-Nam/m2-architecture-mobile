import 'package:isar_community/isar.dart';

part 'scan_record.g.dart';

/// One identified tile, appended by `ScanNotifier` on `found`. Holds the
/// tile *code* rather than a `Tile`: Isar stores scalars and embedded
/// classes only, and a freezed value cannot be embedded; readers rebuild
/// it with `Tile.parse`. Mutable public fields are the generator's
/// requirement, the one place the privacy rule bends.
@collection
class ScanRecord {
  /// Assigned by Isar on `put`; never set by hand.
  Id id = Isar.autoIncrement;

  /// `Tile.code` (`5pr`, `1z`, …); `late` because Isar fills fields after
  /// the no-arg constructor.
  late String code;

  /// Indexed so the newest-first history query walks the index, no sort.
  @Index()
  late DateTime scannedAt;
}
