import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tenpai/app/router.dart';
import 'package:tenpai/learning/lesson_providers.dart';
import 'package:tenpai/progress/progress_providers.dart';
import 'package:tenpai/progress/user_progress.dart';
import 'package:tenpai/shared/models/tile.dart';
import 'package:tenpai/shared/models/unit.dart';
import 'package:tenpai/shared/theme/app_colors.dart';
import 'package:tenpai/shared/theme/app_tokens.dart';
import 'package:tenpai/shared/widgets/retry_widget.dart';
import 'package:tenpai/shared/widgets/tile_widget.dart';

/// Apprendre tab: one node per unit, bottom-up, as in handoff screen 5.
///
/// Waits for both units and progress before drawing anything: no spinner by
/// design, and half a path (nodes without status) would flash.
class LessonPathScreen extends ConsumerWidget {
  /// No parameters: units and progress come from providers.
  const LessonPathScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final units = ref.watch(unitsProvider);
    final progress = ref.watch(userProgressProvider);
    // AI-GENERATED (Claude) BEGIN — hasError guard, milestone 2 review
    // `hasError` rather than `AsyncError` arms: during Riverpod's auto-retry
    // the state is `AsyncLoading` carrying the error, which a type match
    // would read as loading and hide « Réessayer ».
    if (units.hasError || progress.hasError) {
      return Scaffold(
        body: RetryWidget(
          message: 'Impossible de charger le parcours',
          onRetry: () {
            ref.invalidate(unitsProvider);
            ref.invalidate(userProgressProvider);
          },
        ),
      );
    }
    // AI-GENERATED (Claude) END
    return Scaffold(
      body: switch ((units, progress)) {
        (AsyncData(value: final units), AsyncData(value: final progress)) =>
          _Path(units: units, progress: progress),
        _ => const SizedBox.shrink(),
      },
    );
  }
}

class _Path extends StatelessWidget {
  const _Path({required this.units, required this.progress});
  final List<Unit> units;
  final UserProgress progress;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      _PathHeader(xp: progress.xp),
      Expanded(
        child: ListView.builder(
          reverse: true,
          padding: const EdgeInsets.symmetric(vertical: AppTokens.space4),
          itemCount: units.length,
          itemBuilder: (context, i) =>
              _UnitRow(units: units, index: i, progress: progress),
        ),
      ),
    ],
  );
}

/// Streak, XP and settings row. Streak stays `0` with a placeholder glyph
/// (no streak computation yet); the gear pushes `/settings` over the tabs.
class _PathHeader extends StatelessWidget {
  const _PathHeader({required this.xp});
  final int xp;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final colors = theme.extension<AppColors>()!;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppTokens.sideMargin,
          vertical: AppTokens.space2,
        ),
        child: Row(
          children: [
            _Chip(
              child: Row(
                mainAxisSize: .min,
                children: [
                  _streakGlyph(colors),
                  const SizedBox(width: AppTokens.space1),
                  Text('0', style: theme.textTheme.headlineSmall),
                ],
              ),
            ),
            const SizedBox(width: AppTokens.space2),
            _Chip(
              child: Row(
                mainAxisSize: .min,
                crossAxisAlignment: .baseline,
                textBaseline: .alphabetic,
                children: [
                  Text(
                    '$xp',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: scheme.primary,
                    ),
                  ),
                  const SizedBox(width: AppTokens.space1),
                  Text(
                    'XP',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: colors.mutedStrong,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            IconButton(
              tooltip: 'Réglages',
              onPressed: () => context.push(AppRoutes.settings),
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }

  Widget _streakGlyph(AppColors colors) => SizedBox(
    width: AppTokens.space2,
    height: AppTokens.space3,
    child: DecoratedBox(
      decoration: BoxDecoration(
        color: colors.vermillionText,
        borderRadius: AppTokens.radiusSeal,
      ),
    ),
  );
}

/// Header pill: surface container, sub-panel radius, surface shadow. One
/// place for the chip look so streak and XP cannot drift apart.
class _Chip extends StatelessWidget {
  const _Chip({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surfaceContainer,
      borderRadius: AppTokens.radiusSubPanel,
      boxShadow: AppTokens.shadowSurface,
    ),
    child: Padding(
      padding: const EdgeInsets.all(AppTokens.space1),
      child: child,
    ),
  );
}

/// One list item: computes the unit's status and counter, alternates the
/// zigzag by index parity, and routes a tap to the unit's current lesson.
/// Locked units get no tap handler at all rather than a no-op.
class _UnitRow extends StatelessWidget {
  const _UnitRow({
    required this.units,
    required this.index,
    required this.progress,
  });
  final List<Unit> units;
  final int index;
  final UserProgress progress;

  @override
  Widget build(BuildContext context) {
    final unit = units[index];
    final status = unitStatusOf(units, index, progress);
    final x = index.isEven ? -AppTokens.pathZigzag : AppTokens.pathZigzag;
    return Padding(
      padding: const EdgeInsets.only(bottom: AppTokens.space3),
      child: Align(
        alignment: Alignment(x, 0),
        child: _PathNode(
          status: status,
          title: unit.title,
          completed: completedCount(unit, progress),
          total: unit.lessons.length,
          onTap: status == .locked
              ? null
              : () => context.push(
                  AppRoutes.lesson(lessonToOpen(unit, progress).id),
                ),
        ),
      ),
    );
  }
}

/// Circle + title for one unit. Fill and size follow [status]; the ring and
/// « n / total » pill exist only on the current node, the check badge only on
/// a completed one. Tile art is a face-down placeholder until SVG lands.
class _PathNode extends StatelessWidget {
  const _PathNode({
    required this.status,
    required this.title,
    required this.completed,
    required this.total,
    this.onTap,
  });
  final LessonStatus status;
  final String title;
  final int completed;
  final int total;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final colors = theme.extension<AppColors>()!;
    final (fill, size) = switch (status) {
      .completed => (scheme.primary, AppTokens.pathNodeSize),
      .current => (colors.tileFaceTop, AppTokens.pathNodeSizeCurrent),
      .locked => (colors.track, AppTokens.pathNodeSize),
    };

    final circle = SizedBox.square(
      dimension: size,
      child: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: .circle,
                color: fill,
                boxShadow: AppTokens.shadowSurface,
              ),
              child: Center(child: _glyph(colors)),
            ),
          ),
          if (status == .current) Positioned.fill(child: _ring(scheme, colors)),
          if (status == .completed)
            Positioned(bottom: 0, right: 0, child: _check(scheme)),
        ],
      ),
    );

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: .min,
        children: [
          circle,
          const SizedBox(height: AppTokens.space1),
          if (status == .current) _counter(theme, scheme),
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              color: status == .locked ? colors.mutedStrong : scheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  Widget _glyph(AppColors colors) => status == .locked
      ? Icon(Icons.lock, color: colors.iconInactive)
      : const TileWidget(
          tile: Tile(suit: .man, number: 1),
          state: .faceDown,
          size: .small,
        );

  Widget _ring(ColorScheme scheme, AppColors colors) =>
      CircularProgressIndicator(
        value: total == 0 ? 0 : completed / total,
        strokeWidth: AppTokens.pathRingWidth,
        color: scheme.primary,
        backgroundColor: colors.trackDeep,
        strokeCap: .round,
      );

  Widget _check(ColorScheme scheme) => SizedBox.square(
    dimension: AppTokens.badgeSize,
    child: DecoratedBox(
      decoration: BoxDecoration(
        shape: .circle,
        color: scheme.primary,
        boxShadow: AppTokens.shadowBadge,
      ),
      child: Icon(
        Icons.check,
        size: AppTokens.badgeIconSize,
        color: scheme.onPrimary,
      ),
    ),
  );

  Widget _counter(ThemeData theme, ColorScheme scheme) => DecoratedBox(
    decoration: BoxDecoration(
      color: scheme.primary,
      borderRadius: AppTokens.radiusSeal,
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppTokens.space1),
      child: Text(
        '$completed / $total',
        style: theme.textTheme.labelMedium?.copyWith(color: scheme.onPrimary),
      ),
    ),
  );
}
