// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_block.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExplanationBlock _$ExplanationBlockFromJson(Map<String, dynamic> json) =>
    ExplanationBlock(
      tile: json['tile'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$ExplanationBlockToJson(ExplanationBlock instance) =>
    <String, dynamic>{
      'tile': instance.tile,
      'title': instance.title,
      'body': instance.body,
      'type': instance.$type,
    };

DrillBlock _$DrillBlockFromJson(Map<String, dynamic> json) =>
    DrillBlock($type: json['type'] as String?);

Map<String, dynamic> _$DrillBlockToJson(DrillBlock instance) =>
    <String, dynamic>{'type': instance.$type};

QuizBlock _$QuizBlockFromJson(Map<String, dynamic> json) => QuizBlock(
  question: json['question'] as String,
  hand: (json['hand'] as List<dynamic>).map((e) => e as String).toList(),
  options: (json['options'] as List<dynamic>).map((e) => e as String).toList(),
  correctIndex: (json['correctIndex'] as num).toInt(),
  feedback: json['feedback'] as String,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$QuizBlockToJson(QuizBlock instance) => <String, dynamic>{
  'question': instance.question,
  'hand': instance.hand,
  'options': instance.options,
  'correctIndex': instance.correctIndex,
  'feedback': instance.feedback,
  'type': instance.$type,
};

InteractiveBlock _$InteractiveBlockFromJson(Map<String, dynamic> json) =>
    InteractiveBlock($type: json['type'] as String?);

Map<String, dynamic> _$InteractiveBlockToJson(InteractiveBlock instance) =>
    <String, dynamic>{'type': instance.$type};
