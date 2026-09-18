// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Tile {

 TileSuit get suit; int get number; bool get isRed;
/// Create a copy of Tile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TileCopyWith<Tile> get copyWith => _$TileCopyWithImpl<Tile>(this as Tile, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Tile;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Tile&&(identical(other.suit, _this.suit) || other.suit == _this.suit)&&(identical(other.number, _this.number) || other.number == _this.number)&&(identical(other.isRed, _this.isRed) || other.isRed == _this.isRed));
}


@override
int get hashCode {
  final _this = this as Tile;
  return Object.hash(runtimeType,_this.suit,_this.number,_this.isRed);
}

@override
String toString() {
  final _this = this as Tile;
  return 'Tile(suit: ${_this.suit}, number: ${_this.number}, isRed: ${_this.isRed})';
}


}

/// @nodoc
abstract mixin class $TileCopyWith<$Res>  {
  factory $TileCopyWith(Tile value, $Res Function(Tile) _then) = _$TileCopyWithImpl;
@useResult
$Res call({
 TileSuit suit, int number, bool isRed
});




}
/// @nodoc
class _$TileCopyWithImpl<$Res>
    implements $TileCopyWith<$Res> {
  _$TileCopyWithImpl(this._self, this._then);

  final Tile _self;
  final $Res Function(Tile) _then;

/// Create a copy of Tile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? suit = null,Object? number = null,Object? isRed = null,}) {
  return _then(Tile(
suit: null == suit ? _self.suit : suit // ignore: cast_nullable_to_non_nullable
as TileSuit,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,isRed: null == isRed ? _self.isRed : isRed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Tile].
extension TilePatterns on Tile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Tile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Tile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Tile value)  $default,){
final _that = this;
switch (_that) {
case _Tile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Tile value)?  $default,){
final _that = this;
switch (_that) {
case _Tile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TileSuit suit,  int number,  bool isRed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Tile() when $default != null:
return $default(_that.suit,_that.number,_that.isRed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TileSuit suit,  int number,  bool isRed)  $default,) {final _that = this;
switch (_that) {
case _Tile():
return $default(_that.suit,_that.number,_that.isRed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TileSuit suit,  int number,  bool isRed)?  $default,) {final _that = this;
switch (_that) {
case _Tile() when $default != null:
return $default(_that.suit,_that.number,_that.isRed);case _:
  return null;

}
}

}

/// @nodoc


class _Tile extends Tile {
  const _Tile({required this.suit, required this.number, this.isRed = false}): assert(number >= 1 && number <= (suit == TileSuit.honor ? 7 : 9)),super._();
  

@override final  TileSuit suit;
@override final  int number;
@override@JsonKey() final  bool isRed;

/// Create a copy of Tile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TileCopyWith<_Tile> get copyWith => __$TileCopyWithImpl<_Tile>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Tile&&(identical(other.suit, suit) || other.suit == suit)&&(identical(other.number, number) || other.number == number)&&(identical(other.isRed, isRed) || other.isRed == isRed));
}


@override
int get hashCode {
    return Object.hash(runtimeType,suit,number,isRed);
}

@override
String toString() {
    return 'Tile(suit: $suit, number: $number, isRed: $isRed)';
}


}

/// @nodoc
abstract mixin class _$TileCopyWith<$Res> implements $TileCopyWith<$Res> {
  factory _$TileCopyWith(_Tile value, $Res Function(_Tile) _then) = __$TileCopyWithImpl;
@override @useResult
$Res call({
 TileSuit suit, int number, bool isRed
});




}
/// @nodoc
class __$TileCopyWithImpl<$Res>
    implements _$TileCopyWith<$Res> {
  __$TileCopyWithImpl(this._self, this._then);

  final _Tile _self;
  final $Res Function(_Tile) _then;

/// Create a copy of Tile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? suit = null,Object? number = null,Object? isRed = null,}) {
  return _then(_Tile(
suit: null == suit ? _self.suit : suit // ignore: cast_nullable_to_non_nullable
as TileSuit,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,isRed: null == isRed ? _self.isRed : isRed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
