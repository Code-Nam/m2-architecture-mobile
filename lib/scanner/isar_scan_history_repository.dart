import 'package:isar_community/isar.dart';
import 'package:tenpai/scanner/scan_history_repository.dart';
import 'package:tenpai/scanner/scan_record.dart';
import 'package:tenpai/shared/models/tile.dart';

/// History in `scanRecords`; the watch query walks the `scannedAt` index.
class IsarScanHistoryRepository implements ScanHistoryRepository {
  /// [_isar] comes from `isarProvider`, opened in `main`.
  const IsarScanHistoryRepository(this._isar);
  final Isar _isar;

  @override
  Future<void> add(Tile tile) => _isar.writeTxn(
    () => _isar.scanRecords.put(
      ScanRecord()
        ..code = tile.code
        ..scannedAt = DateTime.now(),
    ),
  );

  @override
  Stream<List<ScanRecord>> watch() => _isar.scanRecords
      .where()
      .sortByScannedAtDesc()
      .watch(fireImmediately: true);
}
