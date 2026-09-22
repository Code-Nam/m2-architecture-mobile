import 'package:tenpai/progress/user_progress.dart';
import 'package:tenpai/shared/models/lesson.dart';

/// A repository of user progress
abstract interface class ProgressRepository {
  /// Loads the user progress
  Future<UserProgress> load();

  /// Marks [lesson] completed, adds its XP once, returns the new progress
  Future<UserProgress> completeLesson(Lesson lesson);
}
