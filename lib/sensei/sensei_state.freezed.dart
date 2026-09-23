// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sensei_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SenseiState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SenseiState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SenseiState()';
}


}

/// @nodoc
class $SenseiStateCopyWith<$Res>  {
$SenseiStateCopyWith(SenseiState _, $Res Function(SenseiState) __);
}


/// Adds pattern-matching-related methods to [SenseiState].
extension SenseiStatePatterns on SenseiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SenseiIdle value)?  idle,TResult Function( SenseiLoading value)?  loading,TResult Function( SenseiStreaming value)?  streaming,TResult Function( SenseiDone value)?  done,TResult Function( SenseiFailed value)?  failed,TResult Function( SenseiOffline value)?  offline,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SenseiIdle() when idle != null:
return idle(_that);case SenseiLoading() when loading != null:
return loading(_that);case SenseiStreaming() when streaming != null:
return streaming(_that);case SenseiDone() when done != null:
return done(_that);case SenseiFailed() when failed != null:
return failed(_that);case SenseiOffline() when offline != null:
return offline(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SenseiIdle value)  idle,required TResult Function( SenseiLoading value)  loading,required TResult Function( SenseiStreaming value)  streaming,required TResult Function( SenseiDone value)  done,required TResult Function( SenseiFailed value)  failed,required TResult Function( SenseiOffline value)  offline,}){
final _that = this;
switch (_that) {
case SenseiIdle():
return idle(_that);case SenseiLoading():
return loading(_that);case SenseiStreaming():
return streaming(_that);case SenseiDone():
return done(_that);case SenseiFailed():
return failed(_that);case SenseiOffline():
return offline(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SenseiIdle value)?  idle,TResult? Function( SenseiLoading value)?  loading,TResult? Function( SenseiStreaming value)?  streaming,TResult? Function( SenseiDone value)?  done,TResult? Function( SenseiFailed value)?  failed,TResult? Function( SenseiOffline value)?  offline,}){
final _that = this;
switch (_that) {
case SenseiIdle() when idle != null:
return idle(_that);case SenseiLoading() when loading != null:
return loading(_that);case SenseiStreaming() when streaming != null:
return streaming(_that);case SenseiDone() when done != null:
return done(_that);case SenseiFailed() when failed != null:
return failed(_that);case SenseiOffline() when offline != null:
return offline(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  loading,TResult Function( String text)?  streaming,TResult Function( String text)?  done,TResult Function()?  failed,TResult Function()?  offline,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SenseiIdle() when idle != null:
return idle();case SenseiLoading() when loading != null:
return loading();case SenseiStreaming() when streaming != null:
return streaming(_that.text);case SenseiDone() when done != null:
return done(_that.text);case SenseiFailed() when failed != null:
return failed();case SenseiOffline() when offline != null:
return offline();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  loading,required TResult Function( String text)  streaming,required TResult Function( String text)  done,required TResult Function()  failed,required TResult Function()  offline,}) {final _that = this;
switch (_that) {
case SenseiIdle():
return idle();case SenseiLoading():
return loading();case SenseiStreaming():
return streaming(_that.text);case SenseiDone():
return done(_that.text);case SenseiFailed():
return failed();case SenseiOffline():
return offline();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  loading,TResult? Function( String text)?  streaming,TResult? Function( String text)?  done,TResult? Function()?  failed,TResult? Function()?  offline,}) {final _that = this;
switch (_that) {
case SenseiIdle() when idle != null:
return idle();case SenseiLoading() when loading != null:
return loading();case SenseiStreaming() when streaming != null:
return streaming(_that.text);case SenseiDone() when done != null:
return done(_that.text);case SenseiFailed() when failed != null:
return failed();case SenseiOffline() when offline != null:
return offline();case _:
  return null;

}
}

}

/// @nodoc


class SenseiIdle implements SenseiState {
  const SenseiIdle();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SenseiIdle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SenseiState.idle()';
}


}




/// @nodoc


class SenseiLoading implements SenseiState {
  const SenseiLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SenseiLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SenseiState.loading()';
}


}




/// @nodoc


class SenseiStreaming implements SenseiState {
  const SenseiStreaming(this.text);
  

 final  String text;

/// Create a copy of SenseiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SenseiStreamingCopyWith<SenseiStreaming> get copyWith => _$SenseiStreamingCopyWithImpl<SenseiStreaming>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SenseiStreaming&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode {
    return Object.hash(runtimeType,text);
}

@override
String toString() {
    return 'SenseiState.streaming(text: $text)';
}


}

/// @nodoc
abstract mixin class $SenseiStreamingCopyWith<$Res> implements $SenseiStateCopyWith<$Res> {
  factory $SenseiStreamingCopyWith(SenseiStreaming value, $Res Function(SenseiStreaming) _then) = _$SenseiStreamingCopyWithImpl;
@useResult
$Res call({
 String text
});




}
/// @nodoc
class _$SenseiStreamingCopyWithImpl<$Res>
    implements $SenseiStreamingCopyWith<$Res> {
  _$SenseiStreamingCopyWithImpl(this._self, this._then);

  final SenseiStreaming _self;
  final $Res Function(SenseiStreaming) _then;

/// Create a copy of SenseiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(SenseiStreaming(
null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SenseiDone implements SenseiState {
  const SenseiDone(this.text);
  

 final  String text;

/// Create a copy of SenseiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SenseiDoneCopyWith<SenseiDone> get copyWith => _$SenseiDoneCopyWithImpl<SenseiDone>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SenseiDone&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode {
    return Object.hash(runtimeType,text);
}

@override
String toString() {
    return 'SenseiState.done(text: $text)';
}


}

/// @nodoc
abstract mixin class $SenseiDoneCopyWith<$Res> implements $SenseiStateCopyWith<$Res> {
  factory $SenseiDoneCopyWith(SenseiDone value, $Res Function(SenseiDone) _then) = _$SenseiDoneCopyWithImpl;
@useResult
$Res call({
 String text
});




}
/// @nodoc
class _$SenseiDoneCopyWithImpl<$Res>
    implements $SenseiDoneCopyWith<$Res> {
  _$SenseiDoneCopyWithImpl(this._self, this._then);

  final SenseiDone _self;
  final $Res Function(SenseiDone) _then;

/// Create a copy of SenseiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(SenseiDone(
null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SenseiFailed implements SenseiState {
  const SenseiFailed();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SenseiFailed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SenseiState.failed()';
}


}




/// @nodoc


class SenseiOffline implements SenseiState {
  const SenseiOffline();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SenseiOffline);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SenseiState.offline()';
}


}




// dart format on
