import 'package:tenpai/progress/progress_repository.dart';
import 'package:tenpai/progress/user_progress.dart';
import 'package:tenpai/shared/models/lesson.dart';

/// An in-memory implementation of [ProgressRepository] until Firestore is implemented
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
