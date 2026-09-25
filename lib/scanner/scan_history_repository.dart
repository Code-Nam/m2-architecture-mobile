import 'package:tenpai/scanner/scan_record.dart';
import 'package:tenpai/shared/models/tile.dart';

/// Every tile the scanner identified, kept on the device only.
abstract interface class ScanHistoryRepository {
  /// Appends one entry stamped with the current time; duplicates are kept
  /// (the history is a log, the « maîtrisées » count de-duplicates).
  Future<void> add(Tile tile);

  /// Newest first, re-emitting on every change and once immediately, so a
  /// `StreamProvider` over it never needs invalidating after `add`.
  Stream<List<ScanRecord>> watch();
}
