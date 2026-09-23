import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tenpai/auth/auth_providers.dart';
import 'package:tenpai/progress/firestore_progress_repository.dart';
import 'package:tenpai/progress/progress_repository.dart';
import 'package:tenpai/progress/user_progress.dart';
import 'package:tenpai/shared/models/lesson.dart';

/// Rebuilt on every auth change (same shape as the profile repository), so
/// a sign-out then sign-in never carries the previous user's progress.
/// Throws without a user; the router never opens a lesson before sign-in.
/// Tests override this with a fake.
final progressRepositoryProvider = Provider<ProgressRepository>((ref) {
  final user = ref.watch(authStateProvider).value;
  if (user == null) {
    throw StateError('ProgressRepository needs a signed-in user');
  }
  return FirestoreProgressRepository(FirebaseFirestore.instance, user.uid);
});

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
