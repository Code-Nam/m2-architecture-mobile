// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yaku.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Yaku _$YakuFromJson(Map<String, dynamic> json) => _Yaku(
  id: json['id'] as String,
  name: json['name'] as String,
  kanji: json['kanji'] as String,
  nickname: json['nickname'] as String,
  summary: json['summary'] as String,
  description: json['description'] as String,
  han: (json['han'] as num).toInt(),
  hanOpen: (json['hanOpen'] as num?)?.toInt(),
  tier: $enumDecode(_$YakuTierEnumMap, json['tier']),
  tiles: (json['tiles'] as List<dynamic>).map((e) => e as String).toList(),
  unlockUnit: json['unlockUnit'] as String?,
);

Map<String, dynamic> _$YakuToJson(_Yaku instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'kanji': instance.kanji,
  'nickname': instance.nickname,
  'summary': instance.summary,
  'description': instance.description,
  'han': instance.han,
  'hanOpen': instance.hanOpen,
  'tier': _$YakuTierEnumMap[instance.tier]!,
  'tiles': instance.tiles,
  'unlockUnit': instance.unlockUnit,
};

const _$YakuTierEnumMap = {
  YakuTier.essential: 'essential',
  YakuTier.common: 'common',
  YakuTier.rare: 'rare',
};
