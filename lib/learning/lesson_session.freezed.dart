// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LessonSession {

 String get lessonId; int get blockIndex; int? get selectedOption; bool get isAnswered; Set<int> get picked;
/// Create a copy of LessonSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LessonSessionCopyWith<LessonSession> get copyWith => _$LessonSessionCopyWithImpl<LessonSession>(this as LessonSession, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as LessonSession;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LessonSession&&(identical(other.lessonId, _this.lessonId) || other.lessonId == _this.lessonId)&&(identical(other.blockIndex, _this.blockIndex) || other.blockIndex == _this.blockIndex)&&(identical(other.selectedOption, _this.selectedOption) || other.selectedOption == _this.selectedOption)&&(identical(other.isAnswered, _this.isAnswered) || other.isAnswered == _this.isAnswered)&&const DeepCollectionEquality().equals(other.picked, _this.picked));
}


@override
int get hashCode {
  final _this = this as LessonSession;
  return Object.hash(runtimeType,_this.lessonId,_this.blockIndex,_this.selectedOption,_this.isAnswered,const DeepCollectionEquality().hash(_this.picked));
}

@override
String toString() {
  final _this = this as LessonSession;
  return 'LessonSession(lessonId: ${_this.lessonId}, blockIndex: ${_this.blockIndex}, selectedOption: ${_this.selectedOption}, isAnswered: ${_this.isAnswered}, picked: ${_this.picked})';
}


}

/// @nodoc
abstract mixin class $LessonSessionCopyWith<$Res>  {
  factory $LessonSessionCopyWith(LessonSession value, $Res Function(LessonSession) _then) = _$LessonSessionCopyWithImpl;
@useResult
$Res call({
 String lessonId, int blockIndex, int? selectedOption, bool isAnswered, Set<int> picked
});




}
/// @nodoc
class _$LessonSessionCopyWithImpl<$Res>
    implements $LessonSessionCopyWith<$Res> {
  _$LessonSessionCopyWithImpl(this._self, this._then);

  final LessonSession _self;
  final $Res Function(LessonSession) _then;

/// Create a copy of LessonSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lessonId = null,Object? blockIndex = null,Object? selectedOption = freezed,Object? isAnswered = null,Object? picked = null,}) {
  return _then(LessonSession(
lessonId: null == lessonId ? _self.lessonId : lessonId // ignore: cast_nullable_to_non_nullable
as String,blockIndex: null == blockIndex ? _self.blockIndex : blockIndex // ignore: cast_nullable_to_non_nullable
as int,selectedOption: freezed == selectedOption ? _self.selectedOption : selectedOption // ignore: cast_nullable_to_non_nullable
as int?,isAnswered: null == isAnswered ? _self.isAnswered : isAnswered // ignore: cast_nullable_to_non_nullable
as bool,picked: null == picked ? _self.picked : picked // ignore: cast_nullable_to_non_nullable
as Set<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [LessonSession].
extension LessonSessionPatterns on LessonSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LessonSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LessonSession() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LessonSession value)  $default,){
final _that = this;
switch (_that) {
case _LessonSession():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LessonSession value)?  $default,){
final _that = this;
switch (_that) {
case _LessonSession() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String lessonId,  int blockIndex,  int? selectedOption,  bool isAnswered,  Set<int> picked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LessonSession() when $default != null:
return $default(_that.lessonId,_that.blockIndex,_that.selectedOption,_that.isAnswered,_that.picked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String lessonId,  int blockIndex,  int? selectedOption,  bool isAnswered,  Set<int> picked)  $default,) {final _that = this;
switch (_that) {
case _LessonSession():
return $default(_that.lessonId,_that.blockIndex,_that.selectedOption,_that.isAnswered,_that.picked);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String lessonId,  int blockIndex,  int? selectedOption,  bool isAnswered,  Set<int> picked)?  $default,) {final _that = this;
switch (_that) {
case _LessonSession() when $default != null:
return $default(_that.lessonId,_that.blockIndex,_that.selectedOption,_that.isAnswered,_that.picked);case _:
  return null;

}
}

}

/// @nodoc


class _LessonSession implements LessonSession {
  const _LessonSession({required this.lessonId, required this.blockIndex, this.selectedOption, required this.isAnswered,  Set<int> picked = const <int>{}}): _picked = picked;
  

@override final  String lessonId;
@override final  int blockIndex;
@override final  int? selectedOption;
@override final  bool isAnswered;
 final  Set<int> _picked;
@override@JsonKey() Set<int> get picked {
  if (_picked is EqualUnmodifiableSetView) return _picked;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_picked);
}


/// Create a copy of LessonSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LessonSessionCopyWith<_LessonSession> get copyWith => __$LessonSessionCopyWithImpl<_LessonSession>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LessonSession&&(identical(other.lessonId, lessonId) || other.lessonId == lessonId)&&(identical(other.blockIndex, blockIndex) || other.blockIndex == blockIndex)&&(identical(other.selectedOption, selectedOption) || other.selectedOption == selectedOption)&&(identical(other.isAnswered, isAnswered) || other.isAnswered == isAnswered)&&const DeepCollectionEquality().equals(other.picked, _picked));
}


@override
int get hashCode {
    return Object.hash(runtimeType,lessonId,blockIndex,selectedOption,isAnswered,const DeepCollectionEquality().hash(_picked));
}

@override
String toString() {
    return 'LessonSession(lessonId: $lessonId, blockIndex: $blockIndex, selectedOption: $selectedOption, isAnswered: $isAnswered, picked: $picked)';
}


}

/// @nodoc
abstract mixin class _$LessonSessionCopyWith<$Res> implements $LessonSessionCopyWith<$Res> {
  factory _$LessonSessionCopyWith(_LessonSession value, $Res Function(_LessonSession) _then) = __$LessonSessionCopyWithImpl;
@override @useResult
$Res call({
 String lessonId, int blockIndex, int? selectedOption, bool isAnswered, Set<int> picked
});




}
/// @nodoc
class __$LessonSessionCopyWithImpl<$Res>
    implements _$LessonSessionCopyWith<$Res> {
  __$LessonSessionCopyWithImpl(this._self, this._then);

  final _LessonSession _self;
  final $Res Function(_LessonSession) _then;

/// Create a copy of LessonSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lessonId = null,Object? blockIndex = null,Object? selectedOption = freezed,Object? isAnswered = null,Object? picked = null,}) {
  return _then(_LessonSession(
lessonId: null == lessonId ? _self.lessonId : lessonId // ignore: cast_nullable_to_non_nullable
as String,blockIndex: null == blockIndex ? _self.blockIndex : blockIndex // ignore: cast_nullable_to_non_nullable
as int,selectedOption: freezed == selectedOption ? _self.selectedOption : selectedOption // ignore: cast_nullable_to_non_nullable
as int?,isAnswered: null == isAnswered ? _self.isAnswered : isAnswered // ignore: cast_nullable_to_non_nullable
as bool,picked: null == picked ? _self._picked : picked // ignore: cast_nullable_to_non_nullable
as Set<int>,
  ));
}


}

// dart format on
