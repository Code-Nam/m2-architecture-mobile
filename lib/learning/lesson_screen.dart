import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tenpai/learning/lesson_providers.dart';
import 'package:tenpai/learning/lesson_session.dart';
import 'package:tenpai/progress/progress_providers.dart';
import 'package:tenpai/sensei/sensei_panel_widget.dart';
import 'package:tenpai/sensei/sensei_providers.dart';
import 'package:tenpai/sensei/sensei_request.dart';
import 'package:tenpai/sensei/sensei_state.dart';
import 'package:tenpai/shared/models/lesson.dart';
import 'package:tenpai/shared/models/lesson_block.dart';
import 'package:tenpai/shared/models/tile.dart';
import 'package:tenpai/shared/theme/app_colors.dart';
import 'package:tenpai/shared/theme/app_tokens.dart';
import 'package:tenpai/shared/widgets/primary_button_widget.dart';
import 'package:tenpai/shared/widgets/retry_widget.dart';
import 'package:tenpai/shared/widgets/tile_size.dart';
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
    // AI-GENERATED (Claude) BEGIN — hasError guard, milestone 2 review
    // `hasError` rather than an `AsyncError` arm: while Riverpod auto-retries
    // a failed provider the state is `AsyncLoading` carrying the error, and a
    // type match would hide « Réessayer » for the whole retry window.
    if (asyncLesson.hasError) {
      return Scaffold(
        body: RetryWidget(
          message: 'Impossible de charger la leçon',
          onRetry: () => ref.invalidate(lessonProvider(lessonId)),
        ),
      );
    }
    // AI-GENERATED (Claude) END
    return Scaffold(
      body: switch (asyncLesson) {
        AsyncData(value: final lesson) => _LessonBody(lesson: lesson),
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
            final DrillBlock block => _DrillBlockView(
              block: block,
              session: session,
              onContinue: onContinue,
            ),
            final InteractiveBlock block => _InteractiveBlockView(
              block: block,
              session: session,
              onContinue: onContinue,
            ),
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
            child: PrimaryButtonWidget(
              label: 'Continuer',
              onPressed: onContinue,
            ),
          ),
        ],
      ),
    );
  }
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
    final chosen = session.selectedOption;
    final whyRequest =
        session.isAnswered && chosen != null && chosen != block.correctIndex
        ? SenseiRequest.quizMiss(
            question: block.question,
            hand: block.hand,
            options: block.options,
            chosenIndex: chosen,
            correctIndex: block.correctIndex,
            feedback: block.feedback,
          )
        : null;

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
                child: PrimaryButtonWidget(
                  label: 'Vérifier',
                  onPressed:
                      session.selectedOption == null || session.isAnswered
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
              whyRequest: whyRequest,
            ),
          ),
        ),
      ],
    );
  }
}

/// « Complete the group »: one pick from the rack, checked like a quiz
/// (`selectedOption` against `correctIndex`); once answered the pick fills
/// the empty slot. Same sheet, no « Pourquoi ? ».
class _InteractiveBlockView extends ConsumerWidget {
  const _InteractiveBlockView({
    required this.block,
    required this.session,
    required this.onContinue,
  });
  final InteractiveBlock block;
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
              Text(block.prompt, style: theme.textTheme.headlineSmall),
              const SizedBox(height: AppTokens.space3),
              _GroupRow(
                group: block.group,
                slot: block.slot,
                filled: session.isAnswered
                    ? Tile.parse(block.rack[session.selectedOption!])
                    : null,
                filledState: session.selectedOption == block.correctIndex
                    ? .correct
                    : .incorrect,
              ),
              const SizedBox(height: AppTokens.space4),
              _Rack(
                rack: block.rack,
                correctIndex: block.correctIndex,
                selected: session.selectedOption,
                isAnswered: session.isAnswered,
                onSelect: session.isAnswered ? null : notifier.select,
              ),
              const Spacer(),
              SafeArea(
                top: false,
                child: PrimaryButtonWidget(
                  label: 'Vérifier',
                  onPressed:
                      session.selectedOption == null || session.isAnswered
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
              missLine: 'La bonne tuile est entourée de vert.',
              onContinue: onContinue,
            ),
          ),
        ),
      ],
    );
  }
}

/// The partial group with the slot inserted at its position; [filled] is
/// null until the block is answered, then shows the pick in [filledState].
class _GroupRow extends StatelessWidget {
  const _GroupRow({
    required this.group,
    required this.slot,
    required this.filled,
    required this.filledState,
  });
  final List<String> group;
  final int slot;
  final Tile? filled;
  final TileState filledState;
  @override
  Widget build(BuildContext context) {
    final tiles = <Widget>[
      for (final code in group)
        TileWidget(tile: Tile.parse(code), size: .option),
    ];
    tiles.insert(slot, switch (filled) {
      final tile? => TileWidget(tile: tile, size: .option, state: filledState),
      null => const _EmptySlot(),
    });
    return Row(
      mainAxisAlignment: .center,
      spacing: AppTokens.space1,
      children: tiles,
    );
  }
}

/// Tile-sized outline marking the missing tile. Solid, not dashed as in the
/// handoff: Flutter has no dashed border built in.
class _EmptySlot extends StatelessWidget {
  const _EmptySlot();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return SizedBox(
      width: TileSize.option.width,
      height: TileSize.option.height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TileSize.option.radius),
          border: Border.all(
            color: colors.track,
            width: AppTokens.backFrameWidth,
          ),
        ),
      ),
    );
  }
}

/// Up to six option-size tiles on one line (6 × 48 + 5 × 8 = 328 dp); after
/// checking, the right one is highlighted when the pick was wrong.
class _Rack extends StatelessWidget {
  const _Rack({
    required this.rack,
    required this.correctIndex,
    required this.selected,
    required this.isAnswered,
    this.onSelect,
  });
  final List<String> rack;
  final int correctIndex;
  final int? selected;
  final bool isAnswered;
  final ValueChanged<int>? onSelect;
  @override
  Widget build(BuildContext context) => Wrap(
    alignment: .center,
    spacing: AppTokens.space1,
    runSpacing: AppTokens.space2,
    children: [
      for (var i = 0; i < rack.length; i++)
        GestureDetector(
          onTap: onSelect == null ? null : () => onSelect!(i),
          child: TileWidget(
            tile: Tile.parse(rack[i]),
            size: .option,
            state: _stateOf(i),
          ),
        ),
    ],
  );
  TileState _stateOf(int i) =>
      switch ((isAnswered, selected == i, i == correctIndex)) {
        (false, true, _) => .selected,
        (false, false, _) => .normal,
        (true, true, true) => .correct,
        (true, true, false) => .incorrect,
        (true, false, true) => .highlighted,
        (true, false, false) => .normal,
      };
}

/// « Find in the hand »: same layout and sheet as the quiz, but the pick is
/// a set of hand indices, right only when it equals the authored answers
/// exactly (order-free, `setEquals`). No « Pourquoi ? »: the Sensei request
/// is quiz-shaped.
class _DrillBlockView extends ConsumerWidget {
  const _DrillBlockView({
    required this.block,
    required this.session,
    required this.onContinue,
  });
  final DrillBlock block;
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
              Text(block.prompt, style: theme.textTheme.headlineSmall),
              const SizedBox(height: AppTokens.space3),
              _DrillHand(
                hand: block.hand,
                answers: block.answers,
                isAnswered: session.isAnswered,
                onToggle: session.isAnswered ? null : notifier.toggle,
                picked: session.picked,
              ),
              const Spacer(),
              SafeArea(
                top: false,
                child: PrimaryButtonWidget(
                  label: 'Vérifier',
                  onPressed: session.picked.isEmpty || session.isAnswered
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
              isCorrect: setEquals(session.picked, block.answers.toSet()),
              feedback: block.feedback,
              missLine: 'Les tuiles attendues sont entourées de vert.',
              onContinue: onContinue,
            ),
          ),
        ),
      ],
    );
  }
}

/// The 13 tiles at option size (48×66, tappable, unlike the 24 px quiz
/// hand) wrapped 7 + 6: 7 × 48 + 6 × 2 = 348 fits the 350 dp column. Row
/// spacing exceeds the selected lift so a raised tile clears the row above.
class _DrillHand extends StatelessWidget {
  const _DrillHand({
    required this.hand,
    required this.answers,
    required this.picked,
    required this.isAnswered,
    this.onToggle,
  });
  final List<String> hand;
  final List<int> answers;
  final Set<int> picked;
  final bool isAnswered;
  final ValueChanged<int>? onToggle;

  @override
  Widget build(BuildContext context) => Wrap(
    alignment: .center,
    spacing: AppTokens.drillGap,
    runSpacing: AppTokens.space2,
    children: [
      for (var i = 0; i < hand.length; i++)
        GestureDetector(
          onTap: onToggle == null ? null : () => onToggle!(i),
          child: TileWidget(
            tile: Tile.parse(hand[i]),
            size: .hand,
            state: _stateOf(i),
          ),
        ),
    ],
  );

  /// Before checking only the picks show; after, a right pick is correct,
  /// a wrong pick incorrect, and a missed answer highlighted.
  TileState _stateOf(int i) =>
      switch ((isAnswered, picked.contains(i), answers.contains(i))) {
        (false, true, _) => .selected,
        (false, false, _) => .normal,
        (true, true, true) => .correct,
        (true, true, false) => .incorrect,
        (true, false, true) => .highlighted,
        (true, false, false) => .normal,
      };
}

/// Bottom sheet of handoff screens 7–8; the « Continuer » CTA lives in it.
/// Always in the tree, slid off-screen by the parent until the block is
/// answered, so opening animates instead of popping in. Sized to content
/// (`mainAxisSize: .min`), never to the screen.
class _FeedbackSheet extends ConsumerWidget {
  const _FeedbackSheet({
    required this.isCorrect,
    required this.feedback,
    required this.onContinue,
    this.whyRequest,
    this.missLine = 'La bonne réponse était la tuile entourée de vert.',
  });

  /// Picks tint, title and CTA colour; the parent derives it from the session
  /// so the sheet never re-checks the answer itself.
  final bool isCorrect;

  /// The authored line, shown only on a hit; a miss shows the fixed sentence
  /// pointing at the highlighted card, then « Pourquoi ? » (see [whyRequest]).
  final String feedback;

  /// The same callback as the block's own « Continuer »: advances or, on the
  /// last block, completes the lesson.
  final VoidCallback onContinue;

  /// Non-null only on a checked miss: keys the Sensei provider the sheet
  /// watches, so « Pourquoi ? » shows while idle and the panel afterwards.
  /// Null before checking and on a hit, hence no request exists off-screen.
  final SenseiRequest? whyRequest;

  /// Second line on a miss; the quiz keeps the default, the drill passes its own.
  final String missLine;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final colors = theme.extension<AppColors>()!;
    final (bg, fg, title, line) = isCorrect
        ? (colors.successPanel, colors.bambooText, 'Bien joué !', feedback)
        : (
            colors.errorPanel,
            colors.vermillionText,
            'Pas tout à fait',
            missLine,
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
              if (whyRequest case final request?) ...[
                const SizedBox(height: AppTokens.space1),
                switch (ref.watch(senseiProvider(request))) {
                  SenseiIdle() => _WhyLink(
                    onTap: ref.read(senseiProvider(request).notifier).ask,
                  ),
                  _ => SenseiPanelWidget(request: request, autoStart: false),
                },
              ],
              const SizedBox(height: AppTokens.space2),
              PrimaryButtonWidget(
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
      .correct => (colors.successPanel, scheme.primary),
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

/// Handoff 08: discreet underlined link under the miss line. Tapping asks the
/// Sensei once; the sheet swaps it for the panel as soon as the state leaves
/// idle.
class _WhyLink extends StatelessWidget {
  const _WhyLink({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppColors>()!;
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      child: Text(
        'Pourquoi ?',
        style: theme.textTheme.bodyMedium?.copyWith(
          color: colors.mutedStrong,
          decoration: .underline,
        ),
      ),
    );
  }
}
