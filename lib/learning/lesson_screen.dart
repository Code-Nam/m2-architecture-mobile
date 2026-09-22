import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tenpai/learning/lesson_providers.dart';
import 'package:tenpai/shared/models/lesson.dart';
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

class _LessonBody extends StatelessWidget {
  const _LessonBody({required this.lesson});
  final Lesson lesson;

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}
