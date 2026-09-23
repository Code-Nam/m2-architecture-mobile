import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tenpai/shared/models/tile.dart';
import 'package:tenpai/shared/theme/app_colors.dart';
import 'package:tenpai/shared/theme/app_tokens.dart';
import 'package:tenpai/shared/widgets/retry_widget.dart';
import 'package:tenpai/shared/widgets/tile_widget.dart';
import 'package:tenpai/yaku/yaku.dart';
import 'package:tenpai/yaku/yaku_providers.dart';

/// Yakus tab, handoff screen 13. Header, search and chips never rebuild;
/// only the list below watches [yakuCardsProvider]. Loading shows the chrome
/// with an empty list (no spinner by design); a catalog error shows the
/// retry, which refetches by invalidating the catalog.
class YakuScreen extends ConsumerWidget {
  /// No parameters: everything comes from providers.
  const YakuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cards = ref.watch(yakuCardsProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: .start,
          spacing: AppTokens.space2,
          children: [
            const _DexHeader(),
            const _SearchField(),
            const _TierChips(),
            Expanded(
              child: switch (cards) {
                AsyncData(value: final rows) => _YakuList(rows: rows),
                AsyncError() => RetryWidget(
                  message: 'Impossible de charger les yakus',
                  onRetry: () => ref.invalidate(yakuCatalogProvider),
                ),
                AsyncLoading() => const SizedBox.shrink(),
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _DexHeader extends StatelessWidget {
  const _DexHeader();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTokens.sideMargin,
        vertical: AppTokens.space2,
      ),
      child: Column(
        crossAxisAlignment: .start,
        spacing: AppTokens.space1,
        children: [
          Text('Yakus', style: theme.textTheme.headlineLarge),
          Text(
            'Les combinaisons qui font gagner. Débloquées au fil des chapitres.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchField extends ConsumerWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final colors = theme.extension<AppColors>()!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppTokens.sideMargin),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          borderRadius: AppTokens.radiusCard,
          boxShadow: AppTokens.shadowSurface,
        ),
        child: TextField(
          onChanged: (text) =>
              ref.read(yakuQueryProvider.notifier).query = text,
          decoration: InputDecoration(
            hintText: 'Rechercher un yaku',
            hintStyle: theme.textTheme.bodyMedium?.copyWith(
              color: colors.mutedStrong,
            ),
            prefixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: scheme.surfaceContainer,
            border: const OutlineInputBorder(
              borderRadius: AppTokens.radiusCard,
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}

class _TierChips extends ConsumerWidget {
  const _TierChips();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final active = ref.watch(yakuTierFilterProvider);
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return SingleChildScrollView(
      scrollDirection: .horizontal,
      padding: const EdgeInsets.symmetric(horizontal: AppTokens.sideMargin),
      child: Row(
        spacing: AppTokens.space1,
        children: [
          for (final tier in [null, ...YakuTier.values])
            ChoiceChip(
              label: Text(_label(tier)),
              selected: active == tier,
              onSelected: (_) =>
                  ref.read(yakuTierFilterProvider.notifier).tier = tier,
              showCheckmark: false,
              shape: const StadiumBorder(),
              side: BorderSide.none,
              selectedColor: scheme.primary,
              backgroundColor: scheme.surfaceContainer,
              labelStyle: theme.textTheme.labelLarge?.copyWith(
                color: active == tier ? scheme.onPrimary : scheme.onSurface,
              ),
              elevation: AppTokens.chipElevation,
            ),
        ],
      ),
    );
  }

  String _label(YakuTier? tier) => switch (tier) {
    null => 'Tous',
    .essential => 'Essentiels',
    .common => 'Courants',
    .rare => 'Rares',
  };
}

class _YakuList extends StatelessWidget {
  const _YakuList({required this.rows});
  final List<YakuCard> rows;

  @override
  Widget build(BuildContext context) => ListView.separated(
    padding: const EdgeInsets.symmetric(
      horizontal: AppTokens.sideMargin,
      vertical: AppTokens.space2,
    ),
    itemCount: rows.length,
    separatorBuilder: (_, _) => const SizedBox(height: AppTokens.space2),
    itemBuilder: (_, i) => _YakuCard(row: rows[i]),
  );
}

class _YakuCard extends StatelessWidget {
  const _YakuCard({required this.row});
  final YakuCard row;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final colors = theme.extension<AppColors>()!;
    final yaku = row.yaku;
    return Opacity(
      opacity: row.unlocked ? 1 : AppTokens.lockedOpacity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: scheme.surfaceContainer,
          borderRadius: AppTokens.radiusCard,
          boxShadow: AppTokens.shadowSurface,
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppTokens.space2),
          child: Column(
            crossAxisAlignment: .start,
            spacing: AppTokens.space1,
            children: [
              Row(
                crossAxisAlignment: .baseline,
                textBaseline: .alphabetic,
                spacing: AppTokens.space1,
                children: [
                  Text(yaku.name, style: theme.textTheme.titleMedium),
                  Expanded(
                    child: Text(
                      yaku.nickname,
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: colors.mutedStrong,
                      ),
                      overflow: .ellipsis,
                    ),
                  ),
                  if (row.unlocked)
                    _HanBadge(han: yaku.han)
                  else
                    Icon(Icons.lock, color: colors.iconInactive),
                ],
              ),
              Row(
                spacing: AppTokens.handGap,
                children: [
                  for (final code in yaku.tiles)
                    TileWidget(
                      tile: Tile.parse(code),
                      size: .small,
                      state: row.unlocked ? .normal : .faceDown,
                    ),
                ],
              ),
              Text(yaku.summary, style: theme.textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}

class _HanBadge extends StatelessWidget {
  const _HanBadge({required this.han});
  final int han;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppColors>()!;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.successPanel,
        borderRadius: AppTokens.radiusSeal,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppTokens.space1),
        child: Text(
          '$han han',
          style: theme.textTheme.labelMedium?.copyWith(
            color: colors.bambooText,
          ),
        ),
      ),
    );
  }
}
