// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yaku.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Yaku {

 String get id; String get name; String get kanji; String get nickname; String get summary; String get description; int get han; int? get hanOpen; YakuTier get tier; List<String> get tiles; String? get unlockUnit;
/// Create a copy of Yaku
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$YakuCopyWith<Yaku> get copyWith => _$YakuCopyWithImpl<Yaku>(this as Yaku, _$identity);

  /// Serializes this Yaku to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Yaku;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Yaku&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.kanji, _this.kanji) || other.kanji == _this.kanji)&&(identical(other.nickname, _this.nickname) || other.nickname == _this.nickname)&&(identical(other.summary, _this.summary) || other.summary == _this.summary)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.han, _this.han) || other.han == _this.han)&&(identical(other.hanOpen, _this.hanOpen) || other.hanOpen == _this.hanOpen)&&(identical(other.tier, _this.tier) || other.tier == _this.tier)&&const DeepCollectionEquality().equals(other.tiles, _this.tiles)&&(identical(other.unlockUnit, _this.unlockUnit) || other.unlockUnit == _this.unlockUnit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Yaku;
  return Object.hash(runtimeType,_this.id,_this.name,_this.kanji,_this.nickname,_this.summary,_this.description,_this.han,_this.hanOpen,_this.tier,const DeepCollectionEquality().hash(_this.tiles),_this.unlockUnit);
}

@override
String toString() {
  final _this = this as Yaku;
  return 'Yaku(id: ${_this.id}, name: ${_this.name}, kanji: ${_this.kanji}, nickname: ${_this.nickname}, summary: ${_this.summary}, description: ${_this.description}, han: ${_this.han}, hanOpen: ${_this.hanOpen}, tier: ${_this.tier}, tiles: ${_this.tiles}, unlockUnit: ${_this.unlockUnit})';
}


}

/// @nodoc
abstract mixin class $YakuCopyWith<$Res>  {
  factory $YakuCopyWith(Yaku value, $Res Function(Yaku) _then) = _$YakuCopyWithImpl;
@useResult
$Res call({
 String id, String name, String kanji, String nickname, String summary, String description, int han, int? hanOpen, YakuTier tier, List<String> tiles, String? unlockUnit
});




}
/// @nodoc
class _$YakuCopyWithImpl<$Res>
    implements $YakuCopyWith<$Res> {
  _$YakuCopyWithImpl(this._self, this._then);

  final Yaku _self;
  final $Res Function(Yaku) _then;

/// Create a copy of Yaku
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? kanji = null,Object? nickname = null,Object? summary = null,Object? description = null,Object? han = null,Object? hanOpen = freezed,Object? tier = null,Object? tiles = null,Object? unlockUnit = freezed,}) {
  return _then(Yaku(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,kanji: null == kanji ? _self.kanji : kanji // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,han: null == han ? _self.han : han // ignore: cast_nullable_to_non_nullable
as int,hanOpen: freezed == hanOpen ? _self.hanOpen : hanOpen // ignore: cast_nullable_to_non_nullable
as int?,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as YakuTier,tiles: null == tiles ? _self.tiles : tiles // ignore: cast_nullable_to_non_nullable
as List<String>,unlockUnit: freezed == unlockUnit ? _self.unlockUnit : unlockUnit // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Yaku].
extension YakuPatterns on Yaku {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Yaku value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Yaku() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Yaku value)  $default,){
final _that = this;
switch (_that) {
case _Yaku():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Yaku value)?  $default,){
final _that = this;
switch (_that) {
case _Yaku() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String kanji,  String nickname,  String summary,  String description,  int han,  int? hanOpen,  YakuTier tier,  List<String> tiles,  String? unlockUnit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Yaku() when $default != null:
return $default(_that.id,_that.name,_that.kanji,_that.nickname,_that.summary,_that.description,_that.han,_that.hanOpen,_that.tier,_that.tiles,_that.unlockUnit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String kanji,  String nickname,  String summary,  String description,  int han,  int? hanOpen,  YakuTier tier,  List<String> tiles,  String? unlockUnit)  $default,) {final _that = this;
switch (_that) {
case _Yaku():
return $default(_that.id,_that.name,_that.kanji,_that.nickname,_that.summary,_that.description,_that.han,_that.hanOpen,_that.tier,_that.tiles,_that.unlockUnit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String kanji,  String nickname,  String summary,  String description,  int han,  int? hanOpen,  YakuTier tier,  List<String> tiles,  String? unlockUnit)?  $default,) {final _that = this;
switch (_that) {
case _Yaku() when $default != null:
return $default(_that.id,_that.name,_that.kanji,_that.nickname,_that.summary,_that.description,_that.han,_that.hanOpen,_that.tier,_that.tiles,_that.unlockUnit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Yaku implements Yaku {
  const _Yaku({required this.id, required this.name, required this.kanji, required this.nickname, required this.summary, required this.description, required this.han, this.hanOpen, required this.tier, required  List<String> tiles, this.unlockUnit}): _tiles = tiles;
  factory _Yaku.fromJson(Map<String, dynamic> json) => _$YakuFromJson(json);

@override final  String id;
@override final  String name;
@override final  String kanji;
@override final  String nickname;
@override final  String summary;
@override final  String description;
@override final  int han;
@override final  int? hanOpen;
@override final  YakuTier tier;
 final  List<String> _tiles;
@override List<String> get tiles {
  if (_tiles is EqualUnmodifiableListView) return _tiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tiles);
}

@override final  String? unlockUnit;

/// Create a copy of Yaku
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$YakuCopyWith<_Yaku> get copyWith => __$YakuCopyWithImpl<_Yaku>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$YakuToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Yaku&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.kanji, kanji) || other.kanji == kanji)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.description, description) || other.description == description)&&(identical(other.han, han) || other.han == han)&&(identical(other.hanOpen, hanOpen) || other.hanOpen == hanOpen)&&(identical(other.tier, tier) || other.tier == tier)&&const DeepCollectionEquality().equals(other.tiles, _tiles)&&(identical(other.unlockUnit, unlockUnit) || other.unlockUnit == unlockUnit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,kanji,nickname,summary,description,han,hanOpen,tier,const DeepCollectionEquality().hash(_tiles),unlockUnit);
}

@override
String toString() {
    return 'Yaku(id: $id, name: $name, kanji: $kanji, nickname: $nickname, summary: $summary, description: $description, han: $han, hanOpen: $hanOpen, tier: $tier, tiles: $tiles, unlockUnit: $unlockUnit)';
}


}

/// @nodoc
abstract mixin class _$YakuCopyWith<$Res> implements $YakuCopyWith<$Res> {
  factory _$YakuCopyWith(_Yaku value, $Res Function(_Yaku) _then) = __$YakuCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String kanji, String nickname, String summary, String description, int han, int? hanOpen, YakuTier tier, List<String> tiles, String? unlockUnit
});




}
/// @nodoc
class __$YakuCopyWithImpl<$Res>
    implements _$YakuCopyWith<$Res> {
  __$YakuCopyWithImpl(this._self, this._then);

  final _Yaku _self;
  final $Res Function(_Yaku) _then;

/// Create a copy of Yaku
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? kanji = null,Object? nickname = null,Object? summary = null,Object? description = null,Object? han = null,Object? hanOpen = freezed,Object? tier = null,Object? tiles = null,Object? unlockUnit = freezed,}) {
  return _then(_Yaku(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,kanji: null == kanji ? _self.kanji : kanji // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,han: null == han ? _self.han : han // ignore: cast_nullable_to_non_nullable
as int,hanOpen: freezed == hanOpen ? _self.hanOpen : hanOpen // ignore: cast_nullable_to_non_nullable
as int?,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as YakuTier,tiles: null == tiles ? _self._tiles : tiles // ignore: cast_nullable_to_non_nullable
as List<String>,unlockUnit: freezed == unlockUnit ? _self.unlockUnit : unlockUnit // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
