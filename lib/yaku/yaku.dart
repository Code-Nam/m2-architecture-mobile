import 'package:freezed_annotation/freezed_annotation.dart';

part 'yaku.freezed.dart';
part 'yaku.g.dart';

/// Chip groups of the Yaku Dex. Wire names pinned so a Dart rename cannot
/// silently change the catalog contract.
enum YakuTier {
  /// Chip « Essentiels »: the handful every beginner needs first.
  @JsonValue('essential')
  essential,

  /// Chip « Courants »: seen in most games once the basics are in.
  @JsonValue('common')
  common,

  /// Chip « Rares »: yakuman and the seldom-seen rest.
  @JsonValue('rare')
  rare,
}

/// One catalog entry, shape frozen by `tenpai-api` `yaku/v1`. Field order
/// follows the JSON so the two read side by side; `hanOpen` null means the
/// yaku needs a closed hand, `unlockUnit` null means always unlocked.
@freezed
abstract class Yaku with _$Yaku {
  /// `tiles` holds 4–5 codes in `Tile.parse` format for the card preview.
  const factory Yaku({
    required String id,
    required String name,
    required String kanji,
    required String nickname,
    required String summary,
    required String description,
    required int han,
    int? hanOpen,
    required YakuTier tier,
    required List<String> tiles,
    String? unlockUnit,
  }) = _Yaku;

  /// Reads one entry of the catalog's `yakus` list; an unknown `tier`
  /// throws `ArgumentError` from the generated enum decode.
  factory Yaku.fromJson(Map<String, Object?> json) => _$YakuFromJson(json);
}
