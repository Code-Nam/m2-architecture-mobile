// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScanState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ScanState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ScanState()';
}


}

/// @nodoc
class $ScanStateCopyWith<$Res>  {
$ScanStateCopyWith(ScanState _, $Res Function(ScanState) __);
}


/// Adds pattern-matching-related methods to [ScanState].
extension ScanStatePatterns on ScanState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ScanIdle value)?  idle,TResult Function( ScanAnalysing value)?  analysing,TResult Function( ScanFound value)?  found,TResult Function( ScanNotFound value)?  notFound,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ScanIdle() when idle != null:
return idle(_that);case ScanAnalysing() when analysing != null:
return analysing(_that);case ScanFound() when found != null:
return found(_that);case ScanNotFound() when notFound != null:
return notFound(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ScanIdle value)  idle,required TResult Function( ScanAnalysing value)  analysing,required TResult Function( ScanFound value)  found,required TResult Function( ScanNotFound value)  notFound,}){
final _that = this;
switch (_that) {
case ScanIdle():
return idle(_that);case ScanAnalysing():
return analysing(_that);case ScanFound():
return found(_that);case ScanNotFound():
return notFound(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ScanIdle value)?  idle,TResult? Function( ScanAnalysing value)?  analysing,TResult? Function( ScanFound value)?  found,TResult? Function( ScanNotFound value)?  notFound,}){
final _that = this;
switch (_that) {
case ScanIdle() when idle != null:
return idle(_that);case ScanAnalysing() when analysing != null:
return analysing(_that);case ScanFound() when found != null:
return found(_that);case ScanNotFound() when notFound != null:
return notFound(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  analysing,TResult Function( Tile tile)?  found,TResult Function()?  notFound,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ScanIdle() when idle != null:
return idle();case ScanAnalysing() when analysing != null:
return analysing();case ScanFound() when found != null:
return found(_that.tile);case ScanNotFound() when notFound != null:
return notFound();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  analysing,required TResult Function( Tile tile)  found,required TResult Function()  notFound,}) {final _that = this;
switch (_that) {
case ScanIdle():
return idle();case ScanAnalysing():
return analysing();case ScanFound():
return found(_that.tile);case ScanNotFound():
return notFound();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  analysing,TResult? Function( Tile tile)?  found,TResult? Function()?  notFound,}) {final _that = this;
switch (_that) {
case ScanIdle() when idle != null:
return idle();case ScanAnalysing() when analysing != null:
return analysing();case ScanFound() when found != null:
return found(_that.tile);case ScanNotFound() when notFound != null:
return notFound();case _:
  return null;

}
}

}

/// @nodoc


class ScanIdle implements ScanState {
  const ScanIdle();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ScanIdle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ScanState.idle()';
}


}




/// @nodoc


class ScanAnalysing implements ScanState {
  const ScanAnalysing();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ScanAnalysing);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ScanState.analysing()';
}


}




/// @nodoc


class ScanFound implements ScanState {
  const ScanFound(this.tile);
  

 final  Tile tile;

/// Create a copy of ScanState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScanFoundCopyWith<ScanFound> get copyWith => _$ScanFoundCopyWithImpl<ScanFound>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ScanFound&&(identical(other.tile, tile) || other.tile == tile));
}


@override
int get hashCode {
    return Object.hash(runtimeType,tile);
}

@override
String toString() {
    return 'ScanState.found(tile: $tile)';
}


}

/// @nodoc
abstract mixin class $ScanFoundCopyWith<$Res> implements $ScanStateCopyWith<$Res> {
  factory $ScanFoundCopyWith(ScanFound value, $Res Function(ScanFound) _then) = _$ScanFoundCopyWithImpl;
@useResult
$Res call({
 Tile tile
});


$TileCopyWith<$Res> get tile;

}
/// @nodoc
class _$ScanFoundCopyWithImpl<$Res>
    implements $ScanFoundCopyWith<$Res> {
  _$ScanFoundCopyWithImpl(this._self, this._then);

  final ScanFound _self;
  final $Res Function(ScanFound) _then;

/// Create a copy of ScanState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tile = null,}) {
  return _then(ScanFound(
null == tile ? _self.tile : tile // ignore: cast_nullable_to_non_nullable
as Tile,
  ));
}

/// Create a copy of ScanState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TileCopyWith<$Res> get tile {
  
  return $TileCopyWith<$Res>(_self.tile, (value) {
    return _then(_self.copyWith(tile: value));
  });
}
}

/// @nodoc


class ScanNotFound implements ScanState {
  const ScanNotFound();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ScanNotFound);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ScanState.notFound()';
}


}




// dart format on
