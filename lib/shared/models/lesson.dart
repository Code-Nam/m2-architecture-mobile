import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tenpai/shared/models/lesson_block.dart';
part 'lesson.freezed.dart';
part 'lesson.g.dart';

/// One playable lesson: an ordered list of blocks worth `xp` when completed.
@freezed
abstract class Lesson with _$Lesson {
  /// Creates a lesson. `xp` comes from the content, no engine computes it.
  const factory Lesson({
    required String id,
    required String title,
    required int xp,
    required List<LessonBlock> blocks,
  }) = _Lesson;

  /// Reads a lesson from one entry of a unit JSON file.
  factory Lesson.fromJson(Map<String, Object?> json) => _$LessonFromJson(json);
}
