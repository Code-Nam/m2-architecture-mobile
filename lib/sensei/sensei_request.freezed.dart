// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sensei_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SenseiRequest {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SenseiRequest);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SenseiRequest()';
}


}

/// @nodoc
class $SenseiRequestCopyWith<$Res>  {
$SenseiRequestCopyWith(SenseiRequest _, $Res Function(SenseiRequest) __);
}


/// Adds pattern-matching-related methods to [SenseiRequest].
extension SenseiRequestPatterns on SenseiRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( QuizMissRequest value)?  quizMiss,TResult Function( TileContextRequest value)?  tileContext,required TResult orElse(),}){
final _that = this;
switch (_that) {
case QuizMissRequest() when quizMiss != null:
return quizMiss(_that);case TileContextRequest() when tileContext != null:
return tileContext(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( QuizMissRequest value)  quizMiss,required TResult Function( TileContextRequest value)  tileContext,}){
final _that = this;
switch (_that) {
case QuizMissRequest():
return quizMiss(_that);case TileContextRequest():
return tileContext(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( QuizMissRequest value)?  quizMiss,TResult? Function( TileContextRequest value)?  tileContext,}){
final _that = this;
switch (_that) {
case QuizMissRequest() when quizMiss != null:
return quizMiss(_that);case TileContextRequest() when tileContext != null:
return tileContext(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String question,  List<String> hand,  List<String> options,  int chosenIndex,  int correctIndex,  String feedback)?  quizMiss,TResult Function( Tile tile)?  tileContext,required TResult orElse(),}) {final _that = this;
switch (_that) {
case QuizMissRequest() when quizMiss != null:
return quizMiss(_that.question,_that.hand,_that.options,_that.chosenIndex,_that.correctIndex,_that.feedback);case TileContextRequest() when tileContext != null:
return tileContext(_that.tile);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String question,  List<String> hand,  List<String> options,  int chosenIndex,  int correctIndex,  String feedback)  quizMiss,required TResult Function( Tile tile)  tileContext,}) {final _that = this;
switch (_that) {
case QuizMissRequest():
return quizMiss(_that.question,_that.hand,_that.options,_that.chosenIndex,_that.correctIndex,_that.feedback);case TileContextRequest():
return tileContext(_that.tile);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String question,  List<String> hand,  List<String> options,  int chosenIndex,  int correctIndex,  String feedback)?  quizMiss,TResult? Function( Tile tile)?  tileContext,}) {final _that = this;
switch (_that) {
case QuizMissRequest() when quizMiss != null:
return quizMiss(_that.question,_that.hand,_that.options,_that.chosenIndex,_that.correctIndex,_that.feedback);case TileContextRequest() when tileContext != null:
return tileContext(_that.tile);case _:
  return null;

}
}

}

/// @nodoc


class QuizMissRequest implements SenseiRequest {
  const QuizMissRequest({required this.question, required  List<String> hand, required  List<String> options, required this.chosenIndex, required this.correctIndex, required this.feedback}): _hand = hand,_options = options;
  

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

 final  int chosenIndex;
 final  int correctIndex;
 final  String feedback;

/// Create a copy of SenseiRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizMissRequestCopyWith<QuizMissRequest> get copyWith => _$QuizMissRequestCopyWithImpl<QuizMissRequest>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizMissRequest&&(identical(other.question, question) || other.question == question)&&const DeepCollectionEquality().equals(other.hand, _hand)&&const DeepCollectionEquality().equals(other.options, _options)&&(identical(other.chosenIndex, chosenIndex) || other.chosenIndex == chosenIndex)&&(identical(other.correctIndex, correctIndex) || other.correctIndex == correctIndex)&&(identical(other.feedback, feedback) || other.feedback == feedback));
}


@override
int get hashCode {
    return Object.hash(runtimeType,question,const DeepCollectionEquality().hash(_hand),const DeepCollectionEquality().hash(_options),chosenIndex,correctIndex,feedback);
}

@override
String toString() {
    return 'SenseiRequest.quizMiss(question: $question, hand: $hand, options: $options, chosenIndex: $chosenIndex, correctIndex: $correctIndex, feedback: $feedback)';
}


}

/// @nodoc
abstract mixin class $QuizMissRequestCopyWith<$Res> implements $SenseiRequestCopyWith<$Res> {
  factory $QuizMissRequestCopyWith(QuizMissRequest value, $Res Function(QuizMissRequest) _then) = _$QuizMissRequestCopyWithImpl;
@useResult
$Res call({
 String question, List<String> hand, List<String> options, int chosenIndex, int correctIndex, String feedback
});




}
/// @nodoc
class _$QuizMissRequestCopyWithImpl<$Res>
    implements $QuizMissRequestCopyWith<$Res> {
  _$QuizMissRequestCopyWithImpl(this._self, this._then);

  final QuizMissRequest _self;
  final $Res Function(QuizMissRequest) _then;

/// Create a copy of SenseiRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? question = null,Object? hand = null,Object? options = null,Object? chosenIndex = null,Object? correctIndex = null,Object? feedback = null,}) {
  return _then(QuizMissRequest(
question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,hand: null == hand ? _self._hand : hand // ignore: cast_nullable_to_non_nullable
as List<String>,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<String>,chosenIndex: null == chosenIndex ? _self.chosenIndex : chosenIndex // ignore: cast_nullable_to_non_nullable
as int,correctIndex: null == correctIndex ? _self.correctIndex : correctIndex // ignore: cast_nullable_to_non_nullable
as int,feedback: null == feedback ? _self.feedback : feedback // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TileContextRequest implements SenseiRequest {
  const TileContextRequest(this.tile);
  

 final  Tile tile;

/// Create a copy of SenseiRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TileContextRequestCopyWith<TileContextRequest> get copyWith => _$TileContextRequestCopyWithImpl<TileContextRequest>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TileContextRequest&&(identical(other.tile, tile) || other.tile == tile));
}


@override
int get hashCode {
    return Object.hash(runtimeType,tile);
}

@override
String toString() {
    return 'SenseiRequest.tileContext(tile: $tile)';
}


}

/// @nodoc
abstract mixin class $TileContextRequestCopyWith<$Res> implements $SenseiRequestCopyWith<$Res> {
  factory $TileContextRequestCopyWith(TileContextRequest value, $Res Function(TileContextRequest) _then) = _$TileContextRequestCopyWithImpl;
@useResult
$Res call({
 Tile tile
});


$TileCopyWith<$Res> get tile;

}
/// @nodoc
class _$TileContextRequestCopyWithImpl<$Res>
    implements $TileContextRequestCopyWith<$Res> {
  _$TileContextRequestCopyWithImpl(this._self, this._then);

  final TileContextRequest _self;
  final $Res Function(TileContextRequest) _then;

/// Create a copy of SenseiRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tile = null,}) {
  return _then(TileContextRequest(
null == tile ? _self.tile : tile // ignore: cast_nullable_to_non_nullable
as Tile,
  ));
}

/// Create a copy of SenseiRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TileCopyWith<$Res> get tile {
  
  return $TileCopyWith<$Res>(_self.tile, (value) {
    return _then(_self.copyWith(tile: value));
  });
}
}

// dart format on
