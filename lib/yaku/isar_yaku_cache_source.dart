import 'package:isar_community/isar.dart';
import 'package:tenpai/yaku/yaku.dart';
import 'package:tenpai/yaku/yaku_cache_source.dart';
import 'package:tenpai/yaku/yaku_record.dart';

/// Cache in `yakuRecords`; `replace` clears and refills in one transaction.
class IsarYakuCacheSource implements YakuCacheSource {
  /// [_isar] comes from `isarProvider`, opened in `main`.
  const IsarYakuCacheSource(this._isar);
  final Isar _isar;

  @override
  Future<List<Yaku>> read() async => (await _isar.yakuRecords.where().findAll())
      .map((r) => r.toYaku())
      .toList();

  @override
  Future<void> replace(List<Yaku> yakus) => _isar.writeTxn(() async {
    await _isar.yakuRecords.clear();
    await _isar.yakuRecords.putAll(yakus.map(yakuRecordOf).toList());
  });
}
