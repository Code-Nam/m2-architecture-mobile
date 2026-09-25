// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_block.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
LessonBlock _$LessonBlockFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'explanation':
          return ExplanationBlock.fromJson(
            json
          );
                case 'drill':
          return DrillBlock.fromJson(
            json
          );
                case 'quiz':
          return QuizBlock.fromJson(
            json
          );
                case 'interactive':
          return InteractiveBlock.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'LessonBlock',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$LessonBlock {



  /// Serializes this LessonBlock to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LessonBlock);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'LessonBlock()';
}


}

/// @nodoc
class $LessonBlockCopyWith<$Res>  {
$LessonBlockCopyWith(LessonBlock _, $Res Function(LessonBlock) __);
}


/// Adds pattern-matching-related methods to [LessonBlock].
extension LessonBlockPatterns on LessonBlock {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ExplanationBlock value)?  explanation,TResult Function( DrillBlock value)?  drill,TResult Function( QuizBlock value)?  quiz,TResult Function( InteractiveBlock value)?  interactive,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ExplanationBlock() when explanation != null:
return explanation(_that);case DrillBlock() when drill != null:
return drill(_that);case QuizBlock() when quiz != null:
return quiz(_that);case InteractiveBlock() when interactive != null:
return interactive(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ExplanationBlock value)  explanation,required TResult Function( DrillBlock value)  drill,required TResult Function( QuizBlock value)  quiz,required TResult Function( InteractiveBlock value)  interactive,}){
final _that = this;
switch (_that) {
case ExplanationBlock():
return explanation(_that);case DrillBlock():
return drill(_that);case QuizBlock():
return quiz(_that);case InteractiveBlock():
return interactive(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ExplanationBlock value)?  explanation,TResult? Function( DrillBlock value)?  drill,TResult? Function( QuizBlock value)?  quiz,TResult? Function( InteractiveBlock value)?  interactive,}){
final _that = this;
switch (_that) {
case ExplanationBlock() when explanation != null:
return explanation(_that);case DrillBlock() when drill != null:
return drill(_that);case QuizBlock() when quiz != null:
return quiz(_that);case InteractiveBlock() when interactive != null:
return interactive(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String tile,  String title,  String body)?  explanation,TResult Function( String prompt,  List<String> hand,  List<int> answers,  String feedback)?  drill,TResult Function( String question,  List<String> hand,  List<String> options,  int correctIndex,  String feedback)?  quiz,TResult Function()?  interactive,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ExplanationBlock() when explanation != null:
return explanation(_that.tile,_that.title,_that.body);case DrillBlock() when drill != null:
return drill(_that.prompt,_that.hand,_that.answers,_that.feedback);case QuizBlock() when quiz != null:
return quiz(_that.question,_that.hand,_that.options,_that.correctIndex,_that.feedback);case InteractiveBlock() when interactive != null:
return interactive();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String tile,  String title,  String body)  explanation,required TResult Function( String prompt,  List<String> hand,  List<int> answers,  String feedback)  drill,required TResult Function( String question,  List<String> hand,  List<String> options,  int correctIndex,  String feedback)  quiz,required TResult Function()  interactive,}) {final _that = this;
switch (_that) {
case ExplanationBlock():
return explanation(_that.tile,_that.title,_that.body);case DrillBlock():
return drill(_that.prompt,_that.hand,_that.answers,_that.feedback);case QuizBlock():
return quiz(_that.question,_that.hand,_that.options,_that.correctIndex,_that.feedback);case InteractiveBlock():
return interactive();}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String tile,  String title,  String body)?  explanation,TResult? Function( String prompt,  List<String> hand,  List<int> answers,  String feedback)?  drill,TResult? Function( String question,  List<String> hand,  List<String> options,  int correctIndex,  String feedback)?  quiz,TResult? Function()?  interactive,}) {final _that = this;
switch (_that) {
case ExplanationBlock() when explanation != null:
return explanation(_that.tile,_that.title,_that.body);case DrillBlock() when drill != null:
return drill(_that.prompt,_that.hand,_that.answers,_that.feedback);case QuizBlock() when quiz != null:
return quiz(_that.question,_that.hand,_that.options,_that.correctIndex,_that.feedback);case InteractiveBlock() when interactive != null:
return interactive();case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class ExplanationBlock implements LessonBlock {
  const ExplanationBlock({required this.tile, required this.title, required this.body,  String? $type}): $type = $type ?? 'explanation';
  factory ExplanationBlock.fromJson(Map<String, dynamic> json) => _$ExplanationBlockFromJson(json);

 final  String tile;
 final  String title;
 final  String body;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of LessonBlock
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExplanationBlockCopyWith<ExplanationBlock> get copyWith => _$ExplanationBlockCopyWithImpl<ExplanationBlock>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExplanationBlockToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ExplanationBlock&&(identical(other.tile, tile) || other.tile == tile)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,tile,title,body);
}

@override
String toString() {
    return 'LessonBlock.explanation(tile: $tile, title: $title, body: $body)';
}


}

/// @nodoc
abstract mixin class $ExplanationBlockCopyWith<$Res> implements $LessonBlockCopyWith<$Res> {
  factory $ExplanationBlockCopyWith(ExplanationBlock value, $Res Function(ExplanationBlock) _then) = _$ExplanationBlockCopyWithImpl;
@useResult
$Res call({
 String tile, String title, String body
});




}
/// @nodoc
class _$ExplanationBlockCopyWithImpl<$Res>
    implements $ExplanationBlockCopyWith<$Res> {
  _$ExplanationBlockCopyWithImpl(this._self, this._then);

  final ExplanationBlock _self;
  final $Res Function(ExplanationBlock) _then;

/// Create a copy of LessonBlock
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tile = null,Object? title = null,Object? body = null,}) {
  return _then(ExplanationBlock(
tile: null == tile ? _self.tile : tile // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class DrillBlock implements LessonBlock {
   DrillBlock({required this.prompt, required  List<String> hand, required  List<int> answers, required this.feedback,  String? $type}): assert(hand.length == 13, 'a drill hand has 13 tiles'),assert(answers.length > 0, 'a drill needs at least one answer'),_hand = hand,_answers = answers,$type = $type ?? 'drill';
  factory DrillBlock.fromJson(Map<String, dynamic> json) => _$DrillBlockFromJson(json);

 final  String prompt;
 final  List<String> _hand;
 List<String> get hand {
  if (_hand is EqualUnmodifiableListView) return _hand;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hand);
}

 final  List<int> _answers;
 List<int> get answers {
  if (_answers is EqualUnmodifiableListView) return _answers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_answers);
}

 final  String feedback;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of LessonBlock
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DrillBlockCopyWith<DrillBlock> get copyWith => _$DrillBlockCopyWithImpl<DrillBlock>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DrillBlockToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DrillBlock&&(identical(other.prompt, prompt) || other.prompt == prompt)&&const DeepCollectionEquality().equals(other.hand, _hand)&&const DeepCollectionEquality().equals(other.answers, _answers)&&(identical(other.feedback, feedback) || other.feedback == feedback));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,prompt,const DeepCollectionEquality().hash(_hand),const DeepCollectionEquality().hash(_answers),feedback);
}

@override
String toString() {
    return 'LessonBlock.drill(prompt: $prompt, hand: $hand, answers: $answers, feedback: $feedback)';
}


}

/// @nodoc
abstract mixin class $DrillBlockCopyWith<$Res> implements $LessonBlockCopyWith<$Res> {
  factory $DrillBlockCopyWith(DrillBlock value, $Res Function(DrillBlock) _then) = _$DrillBlockCopyWithImpl;
@useResult
$Res call({
 String prompt, List<String> hand, List<int> answers, String feedback
});




}
/// @nodoc
class _$DrillBlockCopyWithImpl<$Res>
    implements $DrillBlockCopyWith<$Res> {
  _$DrillBlockCopyWithImpl(this._self, this._then);

  final DrillBlock _self;
  final $Res Function(DrillBlock) _then;

/// Create a copy of LessonBlock
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? prompt = null,Object? hand = null,Object? answers = null,Object? feedback = null,}) {
  return _then(DrillBlock(
prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,hand: null == hand ? _self._hand : hand // ignore: cast_nullable_to_non_nullable
as List<String>,answers: null == answers ? _self._answers : answers // ignore: cast_nullable_to_non_nullable
as List<int>,feedback: null == feedback ? _self.feedback : feedback // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class QuizBlock implements LessonBlock {
   QuizBlock({required this.question, required  List<String> hand, required  List<String> options, required this.correctIndex, required this.feedback,  String? $type}): assert(options.length == 4, 'a quiz has exactly four options'),assert(correctIndex >= 0 && correctIndex < 4, 'correctIndex must point at one of the four options'),_hand = hand,_options = options,$type = $type ?? 'quiz';
  factory QuizBlock.fromJson(Map<String, dynamic> json) => _$QuizBlockFromJson(json);

 final  String question;
 final  List<String> _hand;
 List<String> get hand {
  if (_hand is EqualUnmodifiableListView) return _hand;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hand);
}

 final  List<String> _options;
 List<String> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

 final  int correctIndex;
 final  String feedback;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of LessonBlock
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizBlockCopyWith<QuizBlock> get copyWith => _$QuizBlockCopyWithImpl<QuizBlock>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizBlockToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizBlock&&(identical(other.question, question) || other.question == question)&&const DeepCollectionEquality().equals(other.hand, _hand)&&const DeepCollectionEquality().equals(other.options, _options)&&(identical(other.correctIndex, correctIndex) || other.correctIndex == correctIndex)&&(identical(other.feedback, feedback) || other.feedback == feedback));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,question,const DeepCollectionEquality().hash(_hand),const DeepCollectionEquality().hash(_options),correctIndex,feedback);
}

@override
String toString() {
    return 'LessonBlock.quiz(question: $question, hand: $hand, options: $options, correctIndex: $correctIndex, feedback: $feedback)';
}


}

/// @nodoc
abstract mixin class $QuizBlockCopyWith<$Res> implements $LessonBlockCopyWith<$Res> {
  factory $QuizBlockCopyWith(QuizBlock value, $Res Function(QuizBlock) _then) = _$QuizBlockCopyWithImpl;
@useResult
$Res call({
 String question, List<String> hand, List<String> options, int correctIndex, String feedback
});




}
/// @nodoc
class _$QuizBlockCopyWithImpl<$Res>
    implements $QuizBlockCopyWith<$Res> {
  _$QuizBlockCopyWithImpl(this._self, this._then);

  final QuizBlock _self;
  final $Res Function(QuizBlock) _then;

/// Create a copy of LessonBlock
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? question = null,Object? hand = null,Object? options = null,Object? correctIndex = null,Object? feedback = null,}) {
  return _then(QuizBlock(
question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,hand: null == hand ? _self._hand : hand // ignore: cast_nullable_to_non_nullable
as List<String>,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<String>,correctIndex: null == correctIndex ? _self.correctIndex : correctIndex // ignore: cast_nullable_to_non_nullable
as int,feedback: null == feedback ? _self.feedback : feedback // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class InteractiveBlock implements LessonBlock {
  const InteractiveBlock({ String? $type}): $type = $type ?? 'interactive';
  factory InteractiveBlock.fromJson(Map<String, dynamic> json) => _$InteractiveBlockFromJson(json);



@JsonKey(name: 'type')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$InteractiveBlockToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is InteractiveBlock);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'LessonBlock.interactive()';
}


}




// dart format on
