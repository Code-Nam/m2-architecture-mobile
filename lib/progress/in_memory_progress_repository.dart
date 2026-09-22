import 'package:tenpai/progress/progress_repository.dart';
import 'package:tenpai/progress/user_progress.dart';
import 'package:tenpai/shared/models/lesson.dart';

/// Milestone 1 progress store: lives as long as the app process, nothing is
/// persisted. Firestore replaces it at milestone 4 behind the same interface.
class InMemoryProgressRepository implements ProgressRepository {
  UserProgress _progress = const UserProgress(completedLessonIds: {}, xp: 0);

  @override
  Future<UserProgress> load() async => _progress;

  @override
  Future<UserProgress> completeLesson(Lesson lesson) async {
    if (_progress.isCompleted(lesson.id)) return _progress;
    return _progress = _progress.copyWith(
      completedLessonIds: {..._progress.completedLessonIds, lesson.id},
      xp: _progress.xp + lesson.xp,
    );
  }
}
