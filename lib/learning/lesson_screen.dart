import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tenpai/learning/lesson_providers.dart';
import 'package:tenpai/learning/lesson_session.dart';
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

class _ExplanationBlockView extends StatelessWidget {
  const _ExplanationBlockView({required this.block, required this.onContinue});
  final ExplanationBlock block;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) => Center(
    child: FilledButton(onPressed: onContinue, child: const Text('Continuer')),
  );
}

class _QuizBlockView extends StatelessWidget {
  const _QuizBlockView({
    required this.block,
    required this.session,
    required this.onContinue,
  });
  final QuizBlock block;
  final LessonSession session;
  final VoidCallback onContinue;
  
  @override
  Widget build(BuildContext context) => Center(
    child: FilledButton(onPressed: onContinue, child: const Text('Continuer')),
  );
}
