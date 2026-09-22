import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tenpai/learning/lesson_providers.dart';
import 'package:tenpai/learning/lesson_session.dart';
import 'package:tenpai/progress/progress_providers.dart';
import 'package:tenpai/shared/models/lesson.dart';
import 'package:tenpai/shared/models/lesson_block.dart';
import 'package:tenpai/shared/models/tile.dart';
import 'package:tenpai/shared/theme/app_colors.dart';
import 'package:tenpai/shared/theme/app_tokens.dart';
import 'package:tenpai/shared/widgets/retry_widget.dart';
import 'package:tenpai/shared/widgets/tile_state.dart';
import 'package:tenpai/shared/widgets/tile_widget.dart';

/// Full-screen lesson player, pushed over the tab shell from the path.
///
/// Draws nothing while the lesson loads: no spinner by design, and the
/// asset read is near-instant. The lesson and its session providers are
/// auto-disposed with this screen, so reopening a lesson restarts at block 0.
class LessonScreen extends ConsumerWidget {
  /// [lessonId] comes from the `/lesson/:id` path parameter.
  const LessonScreen({super.key, required this.lessonId});

  /// Family key for `lessonProvider` and `currentLessonProvider`.
  final String lessonId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncLesson = ref.watch(lessonProvider(lessonId));
    return Scaffold(
      body: switch (asyncLesson) {
        AsyncData(value: final lesson) => _LessonBody(lesson: lesson),
        AsyncError() => RetryWidget(
          message: 'Impossible de charger la leçon',
          onRetry: () => ref.invalidate(lessonProvider(lessonId)),
        ),
        _ => const SizedBox.shrink(),
      },
    );
  }
}

/// Owns the session watch so [LessonScreen] rebuilds only when the lesson
/// itself changes; block changes stay below this widget.
class _LessonBody extends ConsumerWidget {
  const _LessonBody({required this.lesson});
  final Lesson lesson;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(currentLessonProvider(lesson.id));
    Future<void> onContinue() => _continue(context, ref, session);
    return Column(
      children: [
        _TopBar(progress: (session.blockIndex + 1) / lesson.blocks.length),
        Expanded(
          child: switch (lesson.blocks[session.blockIndex]) {
            final ExplanationBlock block => _ExplanationBlockView(
              block: block,
              onContinue: onContinue,
            ),
            final QuizBlock block => _QuizBlockView(
              block: block,
              session: session,
              onContinue: onContinue,
            ),
            DrillBlock() ||
            InteractiveBlock() => _SoonBlockView(onContinue: onContinue),
          },
        ),
      ],
    );
  }

  /// Advances, or on the last block records the completion and pops. The
  /// bound check comes first: `next()` past the end would make `build` index
  /// out of range. `context.mounted` guards the pop across the await.
  Future<void> _continue(
    BuildContext context,
    WidgetRef ref,
    LessonSession session,
  ) async {
    if (session.blockIndex < lesson.blocks.length - 1) {
      ref.read(currentLessonProvider(lesson.id).notifier).next();
      return;
    }
    await ref.read(userProgressProvider.notifier).completeLesson(lesson);
    if (context.mounted) context.pop();
  }
}

/// Close × and the thin lesson progress bar (handoff: 6 px, track / bamboo).
/// Takes a plain fraction so it knows nothing about blocks or sessions.
class _TopBar extends StatelessWidget {
  const _TopBar({required this.progress});
  final double progress;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final colors = theme.extension<AppColors>()!;
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppTokens.space2),
        child: Row(
          children: [
            IconButton(onPressed: context.pop, icon: const Icon(Icons.close)),
            const SizedBox(width: AppTokens.space1),
            Expanded(
              child: LinearProgressIndicator(
                value: progress,
                minHeight: AppTokens.progressHeight,
                color: scheme.primary,
                backgroundColor: colors.track,
                borderRadius: AppTokens.radiusProgress,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Drill and interactive blocks are not authored before milestone 6; this
/// keeps the sealed switch exhaustive and the lesson walkable meanwhile.
class _SoonBlockView extends StatelessWidget {
  const _SoonBlockView({required this.onContinue});
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) => Center(
    child: FilledButton(onPressed: onContinue, child: const Text('Continuer')),
  );
}

/// Handoff screen 6: two [Spacer]s centre the tile group in the free height
/// and pin the CTA to the bottom without measuring anything.
class _ExplanationBlockView extends StatelessWidget {
  const _ExplanationBlockView({required this.block, required this.onContinue});
  final ExplanationBlock block;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppTokens.sideMargin),
      child: Column(
        children: [
          const Spacer(),
          TileWidget(tile: Tile.parse(block.tile), size: .demo),
          const SizedBox(height: AppTokens.space4),
          Text(
            block.title,
            style: theme.textTheme.headlineSmall,
            textAlign: .center,
          ),
          const SizedBox(height: AppTokens.space2),
          Text(
            block.body,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: scheme.onSurfaceVariant,
            ),
            textAlign: .center,
          ),
          const Spacer(),
          SafeArea(
            top: false,
            child: _PrimaryButton(label: 'Continuer', onPressed: onContinue),
          ),
        ],
      ),
    );
  }
}

/// The one full-width CTA of every lesson screen (handoff: one primary action
/// per screen). `Size.fromHeight` already means infinite width, and the
/// explicit shape is needed because a FilledButton defaults to a stadium.
class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({required this.label, this.onPressed, this.color});

  /// French, verbatim from the handoff (« Continuer », « Vérifier »).
  final String label;

  /// Null renders the disabled style: « Vérifier » before an option is picked.
  final VoidCallback? onPressed;

  /// Null keeps the theme primary; the error sheet passes `scheme.error`.
  final Color? color;

  @override
  Widget build(BuildContext context) => FilledButton(
    onPressed: onPressed,
    style: FilledButton.styleFrom(
      backgroundColor: color,
      minimumSize: const Size.fromHeight(AppTokens.buttonHeight),
      shape: const RoundedRectangleBorder(borderRadius: AppTokens.radiusCard),
    ),
    child: Text(label),
  );
}

/// Handoff screens 7–8. Reads [session] only; every change goes through the
/// notifier so the option state and the feedback sheet cannot disagree.
class _QuizBlockView extends ConsumerWidget {
  const _QuizBlockView({
    required this.block,
    required this.session,
    required this.onContinue,
  });
  final QuizBlock block;
  final LessonSession session;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(currentLessonProvider(session.lessonId).notifier);
    final theme = Theme.of(context);
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppTokens.sideMargin),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(block.question, style: theme.textTheme.headlineSmall),
              const SizedBox(height: AppTokens.space3),
              _HandRow(hand: block.hand),
              const SizedBox(height: AppTokens.space3),
              _OptionGrid(
                block: block,
                session: session,
                onSelect: session.isAnswered ? null : notifier.select,
              ),
              const Spacer(),
              SafeArea(
                top: false,
                child: _PrimaryButton(
                  label: 'Vérifier',
                  onPressed: session.selectedOption == null
                      ? null
                      : notifier.check,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: AnimatedSlide(
            offset: session.isAnswered ? Offset.zero : const Offset(0, 1),
            duration: AppTokens.duration,
            curve: AppTokens.curve,
            child: _FeedbackSheet(
              isCorrect: session.selectedOption == block.correctIndex,
              feedback: block.feedback,
              onContinue: onContinue,
            ),
          ),
        ),
      ],
    );
  }
}

/// Bottom sheet of handoff screens 7–8; the « Continuer » CTA lives in it.
/// Always in the tree, slid off-screen by the parent until the block is
/// answered, so opening animates instead of popping in. Sized to content
/// (`mainAxisSize: .min`), never to the screen.
class _FeedbackSheet extends StatelessWidget {
  const _FeedbackSheet({
    required this.isCorrect,
    required this.feedback,
    required this.onContinue,
  });
  
  /// Picks tint, title and CTA colour; the parent derives it from the session
  /// so the sheet never re-checks the answer itself.
  final bool isCorrect;

  /// The authored line, shown only on a hit; a miss shows the fixed sentence
  /// pointing at the highlighted card. The « Pourquoi ? » link comes later.
  final String feedback;

  /// The same callback as the block's own « Continuer »: advances or, on the
  /// last block, completes the lesson.
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final colors = theme.extension<AppColors>()!;
    final (bg, fg, title, line) = isCorrect
        ? (colors.successTint, colors.bambooText, 'Bien joué !', feedback)
        : (
            colors.errorPanel,
            colors.vermillionText,
            'Pas tout à fait',
            'La bonne réponse était la tuile entourée de vert',
          );

    return DecoratedBox(
      decoration: BoxDecoration(color: bg, borderRadius: AppTokens.radiusSheet),
      child: Padding(
        padding: const EdgeInsets.all(AppTokens.sideMargin),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .start,
            children: [
              Text(
                title,
                style: theme.textTheme.titleLarge?.copyWith(color: fg),
              ),
              const SizedBox(height: AppTokens.space1),
              Text(line, style: theme.textTheme.bodyMedium),
              const SizedBox(height: AppTokens.space2),
              _PrimaryButton(
                label: 'Continuer',
                onPressed: onContinue,
                color: isCorrect ? null : scheme.error,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// The 13-tile hand of a quiz in one line. Sized to fit 350 dp (390 minus
/// margins): 13 × 24 plus the gaps, so the gap cannot grow past 2.
class _HandRow extends StatelessWidget {
  const _HandRow({required this.hand});
  final List<String> hand;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: .center,
    spacing: AppTokens.handGap,
    children: [
      for (final code in hand) TileWidget(tile: Tile.parse(code), size: .small),
    ],
  );
}

/// The 2×2 option cards. Riverpod-free: selection goes out through
/// [onSelect], so this widget can be tested with a plain [LessonSession].
class _OptionGrid extends StatelessWidget {
  const _OptionGrid({
    required this.block,
    required this.session,
    this.onSelect,
  });
  final QuizBlock block;
  final LessonSession session;

  /// Null once answered: cards stop reacting to taps.
  final ValueChanged<int>? onSelect;

  @override
  Widget build(BuildContext context) => Column(
    spacing: AppTokens.space2,
    children: [
      for (final row in [(0, 1), (2, 3)])
        Row(
          spacing: AppTokens.space2,
          children: [
            for (final i in [row.$1, row.$2])
              Expanded(
                child: _OptionCard(
                  tile: Tile.parse(block.options[i]),
                  state: _stateOf(i),
                  onTap: onSelect == null ? null : () => onSelect!(i),
                ),
              ),
          ],
        ),
    ],
  );

  /// Before checking only the pick shows; after, the pick turns correct or
  /// incorrect and, on a miss, the right answer is highlighted as well.
  TileState _stateOf(int i) => switch ((
    session.isAnswered,
    session.selectedOption == i,
    i == block.correctIndex,
  )) {
    (false, true, _) => .selected,
    (true, true, true) => .correct,
    (true, true, false) => .incorrect,
    (true, false, true) => .highlighted,
    _ => .normal,
  };
}

/// One option card (handoff screens 7–8). The ring is always drawn,
/// transparent when idle, so a card never shifts by its width on select.
class _OptionCard extends StatelessWidget {
  const _OptionCard({
    required this.tile,
    required this.state,
    required this.onTap,
  });

  /// The option itself; options are tile codes, never text.
  final Tile tile;

  /// Shared with the inner [TileWidget]: the card picks tint and ring from
  /// it, the tile draws its own ring and badge, so both always agree.
  final TileState state;

  /// Null once the block is answered, so the card stops reacting.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final colors = theme.extension<AppColors>()!;
    final (bg, ring) = switch (state) {
      .correct => (colors.successTint, scheme.primary),
      .incorrect => (colors.errorCard, scheme.error),
      .selected || .highlighted => (scheme.surfaceContainer, scheme.primary),
      .normal || .faceDown => (scheme.surfaceContainer, Colors.transparent),
    };
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: bg,
          boxShadow: AppTokens.shadowSurface,
          borderRadius: AppTokens.radiusCard,
          border: Border.all(color: ring, width: AppTokens.ringWidth),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppTokens.space2),
          child: Center(
            child: TileWidget(tile: tile, state: state, size: .option),
          ),
        ),
      ),
    );
  }
}
