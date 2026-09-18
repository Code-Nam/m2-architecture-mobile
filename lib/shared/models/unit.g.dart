// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Unit _$UnitFromJson(Map<String, dynamic> json) => _Unit(
  id: json['id'] as String,
  title: json['title'] as String,
  lessons: (json['lessons'] as List<dynamic>)
      .map((e) => Lesson.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UnitToJson(_Unit instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'lessons': instance.lessons,
};
