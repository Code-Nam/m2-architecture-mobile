import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tenpai/progress/in_memory_progress_repository.dart';
import 'package:tenpai/progress/progress_repository.dart';
import 'package:tenpai/progress/user_progress.dart';
import 'package:tenpai/shared/models/lesson.dart';

/// Swap point for the progress store: in memory now, Firestore at milestone
/// 4, a fake in tests.
final progressRepositoryProvider = Provider<ProgressRepository>(
  (_) => InMemoryProgressRepository(),
);

/// The user's progress, loaded once from the repository. Screens watch it;
/// the only write path is [UserProgressNotifier.completeLesson].
final userProgressProvider =
    AsyncNotifierProvider<UserProgressNotifier, UserProgress>(
      UserProgressNotifier.new,
    );

/// Owns the loaded progress and is its only writer.
class UserProgressNotifier extends AsyncNotifier<UserProgress> {
  @override
  Future<UserProgress> build() => ref.watch(progressRepositoryProvider).load();

  /// Replaces the state with the repository's answer. Idempotency (XP added
  /// once per lesson) is the repository's guarantee, not re-checked here.
  Future<void> completeLesson(Lesson lesson) async {
    final repository = ref.read(progressRepositoryProvider);
    state = AsyncData(await repository.completeLesson(lesson));
  }
}
