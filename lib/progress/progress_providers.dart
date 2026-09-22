import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tenpai/progress/in_memory_progress_repository.dart';
import 'package:tenpai/progress/progress_repository.dart';
import 'package:tenpai/progress/user_progress.dart';
import 'package:tenpai/shared/models/lesson.dart';

/// A provider for the [ProgressRepository]
final progressRepositoryProvider = Provider<ProgressRepository>(
  (_) => InMemoryProgressRepository(),
);

/// The user's progress as an [AsyncValue]
/// call [UserProgressNotifier.completeLesson] on its notifier
final userProgressProvider =
    AsyncNotifierProvider<UserProgressNotifier, UserProgress>(
      UserProgressNotifier.new,
    );

/// A notifier for the [UserProgress]
class UserProgressNotifier extends AsyncNotifier<UserProgress> {
  @override
  Future<UserProgress> build() => ref.watch(progressRepositoryProvider).load();

  /// Marks [lesson] completed, adds its XP once, returns the new progress
  Future<void> completeLesson(Lesson lesson) async {
    final repository = ref.read(progressRepositoryProvider);
    state = AsyncData(await repository.completeLesson(lesson));
  }
}
