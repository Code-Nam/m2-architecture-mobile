// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Lesson _$LessonFromJson(Map<String, dynamic> json) => _Lesson(
  id: json['id'] as String,
  title: json['title'] as String,
  xp: (json['xp'] as num).toInt(),
  blocks: (json['blocks'] as List<dynamic>)
      .map((e) => LessonBlock.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$LessonToJson(_Lesson instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'xp': instance.xp,
  'blocks': instance.blocks,
};
