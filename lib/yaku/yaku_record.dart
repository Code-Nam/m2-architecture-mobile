import 'package:isar_community/isar.dart';
import 'package:tenpai/yaku/yaku.dart';

part 'yaku_record.g.dart';

/// Offline copy of one catalog entry, written only by the yaku cache source
/// and never seen above it (the app reads [Yaku]). Mutable public fields are
/// the generator's requirement, the one place the privacy rule bends.
@collection
class YakuRecord {
  /// Isar's own key; the catalog id lives in [yakuId].
  Id id = Isar.autoIncrement;

  /// Catalog id; unique so a re-cache cannot duplicate an entry.
  @Index(unique: true)
  late String yakuId;

  /// Mirrors [Yaku.name].
  late String name;

  /// Mirrors [Yaku.kanji].
  late String kanji;

  /// Mirrors [Yaku.nickname].
  late String nickname;

  /// Mirrors [Yaku.summary].
  late String summary;

  /// Mirrors [Yaku.description].
  late String description;

  /// Mirrors [Yaku.han] (closed hand).
  late int han;

  /// Mirrors [Yaku.hanOpen]; null when the yaku requires a closed hand.
  int? hanOpen;

  /// Stored by ordinal; the `@JsonValue` strings only matter for the API.
  @enumerated
  late YakuTier tier;

  /// Tile codes for the card preview, `Tile.parse` format.
  late List<String> tiles;

  /// Mirrors [Yaku.unlockUnit]; null means always unlocked.
  String? unlockUnit;

  /// Back to the app's value type; the only way a record leaves the cache.
  Yaku toYaku() => Yaku(
    id: yakuId,
    name: name,
    kanji: kanji,
    nickname: nickname,
    summary: summary,
    description: description,
    han: han,
    hanOpen: hanOpen,
    tier: tier,
    tiles: tiles,
    unlockUnit: unlockUnit,
  );
}

/// Record for [yaku], ready for `putAll`. Top-level so the collection class
/// stays fields plus one getter.
YakuRecord yakuRecordOf(Yaku yaku) => YakuRecord()
  ..yakuId = yaku.id
  ..name = yaku.name
  ..kanji = yaku.kanji
  ..nickname = yaku.nickname
  ..summary = yaku.summary
  ..description = yaku.description
  ..han = yaku.han
  ..hanOpen = yaku.hanOpen
  ..tier = yaku.tier
  ..tiles = List<String>.of(yaku.tiles)
  ..unlockUnit = yaku.unlockUnit;
