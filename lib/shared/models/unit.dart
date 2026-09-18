import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tenpai/shared/models/lesson.dart';
part 'unit.freezed.dart';
part 'unit.g.dart';

/// One unit of the learning path: a title and its lessons in order
@freezed
abstract class Unit with _$Unit {
  /// Creates a unit.
  const factory Unit({
    required String id,
    required String title,
    required List<Lesson> lessons,
  }) = _Unit;

  /// Reads a unit from a JSON file.
  factory Unit.fromJson(Map<String, Object?> json) => _$UnitFromJson(json);
}
