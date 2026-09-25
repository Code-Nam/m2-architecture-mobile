import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tenpai/learning/lesson_providers.dart';
import 'package:tenpai/learning/lesson_session.dart';
// AI-GENERATED (Claude) BEGIN — block widgets split out, Task 13
import 'package:tenpai/learning/widgets/drill_block_widget.dart';
import 'package:tenpai/learning/widgets/explanation_block_widget.dart';
import 'package:tenpai/learning/widgets/interactive_block_widget.dart';
import 'package:tenpai/learning/widgets/quiz_block_widget.dart';
// AI-GENERATED (Claude) END
import 'package:tenpai/progress/progress_providers.dart';
import 'package:tenpai/shared/models/lesson.dart';
import 'package:tenpai/shared/models/lesson_block.dart';
import 'package:tenpai/shared/theme/app_colors.dart';
import 'package:tenpai/shared/theme/app_tokens.dart';
import 'package:tenpai/shared/widgets/retry_widget.dart';

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
          // AI-GENERATED (Claude) BEGIN — arms point at the split widgets, Task 13
          child: switch (lesson.blocks[session.blockIndex]) {
            final ExplanationBlock block => ExplanationBlockWidget(
              block: block,
              onContinue: onContinue,
            ),
            final QuizBlock block => QuizBlockWidget(
              block: block,
              session: session,
              onContinue: onContinue,
            ),
            final DrillBlock block => DrillBlockWidget(
              block: block,
              session: session,
              onContinue: onContinue,
            ),
            final InteractiveBlock block => InteractiveBlockWidget(
              block: block,
              session: session,
              onContinue: onContinue,
            ),
          },
          // AI-GENERATED (Claude) END
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
