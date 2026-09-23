import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tenpai/app/app_config.dart';
import 'package:tenpai/learning/lesson_providers.dart';
import 'package:tenpai/progress/progress_providers.dart';
import 'package:tenpai/progress/user_progress.dart';
import 'package:tenpai/shared/models/unit.dart';
import 'package:tenpai/shared/theme/app_tokens.dart';
import 'package:tenpai/yaku/yaku.dart';
import 'package:tenpai/yaku/yaku_remote_source.dart';
import 'package:tenpai/yaku/yaku_repository.dart';
import 'package:tenpai/yaku/yaku_repository_impl.dart';

/// The one HTTP client. Base URL from build config. Private: only the
/// repository provider below consumes it; tests fake at the repository (or
/// `HttpClientAdapter`) level, never by swapping the client.
final _dioProvider = Provider<Dio>(
  (_) => Dio(
    BaseOptions(
      // ignore: avoid_redundant_argument_values, the analyzer has no --dart-define
      baseUrl: AppConfig.yakuBaseUrl,
      connectTimeout: AppTokens.networkTimeout,
      receiveTimeout: AppTokens.networkTimeout,
    ),
  ),
);

/// Swap point for the catalog: override with a fake in tests, with the
/// Isar-cached implementation at M4.
final yakuRepositoryProvider = Provider<YakuRepository>(
  (ref) => YakuRepositoryImpl(YakuRemoteSource(ref.watch(_dioProvider))),
);

/// The whole catalog, fetched once per app run and kept while the user
/// switches tabs (not auto-dispose). Invalidate to retry after a failure.
final yakuCatalogProvider = FutureProvider<List<Yaku>>(
  (ref) => ref.watch(yakuRepositoryProvider).catalog(),
);

/// Search text of the Yaku Dex; empty means no filtering.
final yakuQueryProvider = NotifierProvider<YakuQueryNotifier, String>(
  YakuQueryNotifier.new,
);

/// Holds the search text. Public only as the provider's type argument.
class YakuQueryNotifier extends Notifier<String> {
  @override
  String build() => '';

  /// Raw text from the field; folding and trimming happen at match time.
  set query(String value) => state = value;
}

/// Active tier chip; `null` is « Tous ».
final yakuTierFilterProvider =
    NotifierProvider<YakuTierFilterNotifier, YakuTier?>(
      YakuTierFilterNotifier.new,
    );

/// Holds the active tier chip. Public only as the provider's type argument.
class YakuTierFilterNotifier extends Notifier<YakuTier?> {
  @override
  YakuTier? build() => null;

  /// `null` clears the filter (« Tous »).
  set tier(YakuTier? value) => state = value;
}

/// One list row: the yaku and whether the player has unlocked it yet.
typedef YakuCard = ({Yaku yaku, bool unlocked});

/// What the Dex renders: catalog filtered by chip then by query, each row
/// tagged unlocked or not. A catalog error is the retry state; units or
/// progress still loading (or failing, already shown on the path tab) reads
/// as loading here so the two tabs never show two retry buttons.
///
/// The error check comes before the switch on purpose: while Riverpod
/// auto-retries a failed provider its state is `AsyncLoading` *carrying* the
/// error (element.dart, `retrying: true`), never `AsyncError`, so matching
/// on type alone would hide « Réessayer » for the whole retry minute.
final yakuCardsProvider = Provider<AsyncValue<List<YakuCard>>>((ref) {
  final query = ref.watch(yakuQueryProvider);
  final tier = ref.watch(yakuTierFilterProvider);
  final catalog = ref.watch(yakuCatalogProvider);
  if (catalog case AsyncValue(
    hasError: true,
    :final error?,
    :final stackTrace?,
  )) {
    return AsyncError(error, stackTrace);
  }
  return switch ((
    catalog,
    ref.watch(unitsProvider),
    ref.watch(userProgressProvider),
  )) {
    (
      AsyncData(value: final yakus),
      AsyncData(value: final units),
      AsyncData(value: final progress),
    ) =>
      AsyncData([
        for (final y in yakus)
          if ((tier == null || y.tier == tier) && _matches(y, query))
            (yaku: y, unlocked: _isUnlocked(y, units, progress)),
      ]),
    _ => const AsyncLoading(),
  };
});
bool _isUnlocked(Yaku y, List<Unit> units, UserProgress progress) {
  final unit = y.unlockUnit;
  if (unit == null) return true;
  final i = units.indexWhere((u) => u.id == unit);
  return i != -1 && unitStatusOf(units, i, progress) == .completed;
}

bool _matches(Yaku y, String query) {
  final q = _fold(query.trim());
  if (q.isEmpty) return true;
  return [y.name, y.nickname, y.kanji].any((s) => _fold(s).contains(q));
}

const _accents = {
  'é': 'e',
  'è': 'e',
  'ê': 'e',
  'à': 'a',
  'â': 'a',
  'ù': 'u',
  'û': 'u',
  'ô': 'o',
  'î': 'i',
  'ï': 'i',
  'ç': 'c',
};
String _fold(String s) =>
    s.toLowerCase().split('').map((c) => _accents[c] ?? c).join();
