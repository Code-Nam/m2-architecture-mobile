// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yaku_record.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetYakuRecordCollection on Isar {
  IsarCollection<YakuRecord> get yakuRecords => this.collection();
}

const YakuRecordSchema = CollectionSchema(
  name: r'YakuRecord',
  id: 3234155307150619035,
  properties: {
    r'description': PropertySchema(
      id: 0,
      name: r'description',
      type: IsarType.string,
    ),
    r'han': PropertySchema(id: 1, name: r'han', type: IsarType.long),
    r'hanOpen': PropertySchema(id: 2, name: r'hanOpen', type: IsarType.long),
    r'kanji': PropertySchema(id: 3, name: r'kanji', type: IsarType.string),
    r'name': PropertySchema(id: 4, name: r'name', type: IsarType.string),
    r'nickname': PropertySchema(
      id: 5,
      name: r'nickname',
      type: IsarType.string,
    ),
    r'summary': PropertySchema(id: 6, name: r'summary', type: IsarType.string),
    r'tier': PropertySchema(
      id: 7,
      name: r'tier',
      type: IsarType.string,
      enumMap: _YakuRecordtierEnumValueMap,
    ),
    r'tiles': PropertySchema(id: 8, name: r'tiles', type: IsarType.stringList),
    r'unlockUnit': PropertySchema(
      id: 9,
      name: r'unlockUnit',
      type: IsarType.string,
    ),
    r'yakuId': PropertySchema(id: 10, name: r'yakuId', type: IsarType.string),
  },

  estimateSize: _yakuRecordEstimateSize,
  serialize: _yakuRecordSerialize,
  deserialize: _yakuRecordDeserialize,
  deserializeProp: _yakuRecordDeserializeProp,
  idName: r'id',
  indexes: {
    r'yakuId': IndexSchema(
      id: -7330170829173428077,
      name: r'yakuId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'yakuId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _yakuRecordGetId,
  getLinks: _yakuRecordGetLinks,
  attach: _yakuRecordAttach,
  version: '3.3.2',
);

int _yakuRecordEstimateSize(
  YakuRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.kanji.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.nickname.length * 3;
  bytesCount += 3 + object.summary.length * 3;
  bytesCount += 3 + object.tier.name.length * 3;
  bytesCount += 3 + object.tiles.length * 3;
  {
    for (var i = 0; i < object.tiles.length; i++) {
      final value = object.tiles[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.unlockUnit;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.yakuId.length * 3;
  return bytesCount;
}

void _yakuRecordSerialize(
  YakuRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.description);
  writer.writeLong(offsets[1], object.han);
  writer.writeLong(offsets[2], object.hanOpen);
  writer.writeString(offsets[3], object.kanji);
  writer.writeString(offsets[4], object.name);
  writer.writeString(offsets[5], object.nickname);
  writer.writeString(offsets[6], object.summary);
  writer.writeString(offsets[7], object.tier.name);
  writer.writeStringList(offsets[8], object.tiles);
  writer.writeString(offsets[9], object.unlockUnit);
  writer.writeString(offsets[10], object.yakuId);
}

YakuRecord _yakuRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = YakuRecord();
  object.description = reader.readString(offsets[0]);
  object.han = reader.readLong(offsets[1]);
  object.hanOpen = reader.readLongOrNull(offsets[2]);
  object.id = id;
  object.kanji = reader.readString(offsets[3]);
  object.name = reader.readString(offsets[4]);
  object.nickname = reader.readString(offsets[5]);
  object.summary = reader.readString(offsets[6]);
  object.tier =
      _YakuRecordtierValueEnumMap[reader.readStringOrNull(offsets[7])] ??
      YakuTier.essential;
  object.tiles = reader.readStringList(offsets[8]) ?? [];
  object.unlockUnit = reader.readStringOrNull(offsets[9]);
  object.yakuId = reader.readString(offsets[10]);
  return object;
}

P _yakuRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (_YakuRecordtierValueEnumMap[reader.readStringOrNull(offset)] ??
              YakuTier.essential)
          as P;
    case 8:
      return (reader.readStringList(offset) ?? []) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _YakuRecordtierEnumValueMap = {
  r'essential': r'essential',
  r'common': r'common',
  r'rare': r'rare',
};
const _YakuRecordtierValueEnumMap = {
  r'essential': YakuTier.essential,
  r'common': YakuTier.common,
  r'rare': YakuTier.rare,
};

Id _yakuRecordGetId(YakuRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _yakuRecordGetLinks(YakuRecord object) {
  return [];
}

void _yakuRecordAttach(IsarCollection<dynamic> col, Id id, YakuRecord object) {
  object.id = id;
}

extension YakuRecordByIndex on IsarCollection<YakuRecord> {
  Future<YakuRecord?> getByYakuId(String yakuId) {
    return getByIndex(r'yakuId', [yakuId]);
  }

  YakuRecord? getByYakuIdSync(String yakuId) {
    return getByIndexSync(r'yakuId', [yakuId]);
  }

  Future<bool> deleteByYakuId(String yakuId) {
    return deleteByIndex(r'yakuId', [yakuId]);
  }

  bool deleteByYakuIdSync(String yakuId) {
    return deleteByIndexSync(r'yakuId', [yakuId]);
  }

  Future<List<YakuRecord?>> getAllByYakuId(List<String> yakuIdValues) {
    final values = yakuIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'yakuId', values);
  }

  List<YakuRecord?> getAllByYakuIdSync(List<String> yakuIdValues) {
    final values = yakuIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'yakuId', values);
  }

  Future<int> deleteAllByYakuId(List<String> yakuIdValues) {
    final values = yakuIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'yakuId', values);
  }

  int deleteAllByYakuIdSync(List<String> yakuIdValues) {
    final values = yakuIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'yakuId', values);
  }

  Future<Id> putByYakuId(YakuRecord object) {
    return putByIndex(r'yakuId', object);
  }

  Id putByYakuIdSync(YakuRecord object, {bool saveLinks = true}) {
    return putByIndexSync(r'yakuId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByYakuId(List<YakuRecord> objects) {
    return putAllByIndex(r'yakuId', objects);
  }

  List<Id> putAllByYakuIdSync(
    List<YakuRecord> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'yakuId', objects, saveLinks: saveLinks);
  }
}

extension YakuRecordQueryWhereSort
    on QueryBuilder<YakuRecord, YakuRecord, QWhere> {
  QueryBuilder<YakuRecord, YakuRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension YakuRecordQueryWhere
    on QueryBuilder<YakuRecord, YakuRecord, QWhereClause> {
  QueryBuilder<YakuRecord, YakuRecord, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterWhereClause> yakuIdEqualTo(
    String yakuId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'yakuId', value: [yakuId]),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterWhereClause> yakuIdNotEqualTo(
    String yakuId,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'yakuId',
                lower: [],
                upper: [yakuId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'yakuId',
                lower: [yakuId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'yakuId',
                lower: [yakuId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'yakuId',
                lower: [],
                upper: [yakuId],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension YakuRecordQueryFilter
    on QueryBuilder<YakuRecord, YakuRecord, QFilterCondition> {
  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  descriptionEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'description',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  descriptionStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  descriptionEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'description',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> hanEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'han', value: value),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> hanGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'han',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> hanLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'han',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> hanBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'han',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> hanOpenIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'hanOpen'),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  hanOpenIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'hanOpen'),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> hanOpenEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'hanOpen', value: value),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  hanOpenGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'hanOpen',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> hanOpenLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'hanOpen',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> hanOpenBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'hanOpen',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> kanjiEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'kanji',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> kanjiGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'kanji',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> kanjiLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'kanji',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> kanjiBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'kanji',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> kanjiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'kanji',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> kanjiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'kanji',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> kanjiContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'kanji',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> kanjiMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'kanji',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> kanjiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'kanji', value: ''),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  kanjiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'kanji', value: ''),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'name',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> nameContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> nameMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'name',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> nicknameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'nickname',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  nicknameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'nickname',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> nicknameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'nickname',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> nicknameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'nickname',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  nicknameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'nickname',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> nicknameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'nickname',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> nicknameContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'nickname',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> nicknameMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'nickname',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  nicknameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'nickname', value: ''),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  nicknameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'nickname', value: ''),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> summaryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'summary',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  summaryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'summary',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> summaryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'summary',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> summaryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'summary',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> summaryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'summary',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> summaryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'summary',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> summaryContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'summary',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> summaryMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'summary',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> summaryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'summary', value: ''),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  summaryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'summary', value: ''),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> tierEqualTo(
    YakuTier value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'tier',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> tierGreaterThan(
    YakuTier value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'tier',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> tierLessThan(
    YakuTier value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'tier',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> tierBetween(
    YakuTier lower,
    YakuTier upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'tier',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> tierStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'tier',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> tierEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'tier',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> tierContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'tier',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> tierMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'tier',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> tierIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'tier', value: ''),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> tierIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'tier', value: ''),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  tilesElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'tiles',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  tilesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'tiles',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  tilesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'tiles',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  tilesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'tiles',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  tilesElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'tiles',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  tilesElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'tiles',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  tilesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'tiles',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  tilesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'tiles',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  tilesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'tiles', value: ''),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  tilesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'tiles', value: ''),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  tilesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'tiles', length, true, length, true);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> tilesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'tiles', 0, true, 0, true);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  tilesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'tiles', 0, false, 999999, true);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  tilesLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'tiles', 0, true, length, include);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  tilesLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'tiles', length, include, 999999, true);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  tilesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tiles',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  unlockUnitIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'unlockUnit'),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  unlockUnitIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'unlockUnit'),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> unlockUnitEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'unlockUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  unlockUnitGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'unlockUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  unlockUnitLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'unlockUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> unlockUnitBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'unlockUnit',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  unlockUnitStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'unlockUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  unlockUnitEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'unlockUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  unlockUnitContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'unlockUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> unlockUnitMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'unlockUnit',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  unlockUnitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'unlockUnit', value: ''),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  unlockUnitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'unlockUnit', value: ''),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> yakuIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'yakuId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> yakuIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'yakuId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> yakuIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'yakuId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> yakuIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'yakuId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> yakuIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'yakuId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> yakuIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'yakuId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> yakuIdContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'yakuId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> yakuIdMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'yakuId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition> yakuIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'yakuId', value: ''),
      );
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterFilterCondition>
  yakuIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'yakuId', value: ''),
      );
    });
  }
}

extension YakuRecordQueryObject
    on QueryBuilder<YakuRecord, YakuRecord, QFilterCondition> {}

extension YakuRecordQueryLinks
    on QueryBuilder<YakuRecord, YakuRecord, QFilterCondition> {}

extension YakuRecordQuerySortBy
    on QueryBuilder<YakuRecord, YakuRecord, QSortBy> {
  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> sortByHan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'han', Sort.asc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> sortByHanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'han', Sort.desc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> sortByHanOpen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hanOpen', Sort.asc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> sortByHanOpenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hanOpen', Sort.desc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> sortByKanji() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kanji', Sort.asc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> sortByKanjiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kanji', Sort.desc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> sortByNickname() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nickname', Sort.asc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> sortByNicknameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nickname', Sort.desc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> sortBySummary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summary', Sort.asc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> sortBySummaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summary', Sort.desc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> sortByTier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tier', Sort.asc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> sortByTierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tier', Sort.desc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> sortByUnlockUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockUnit', Sort.asc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> sortByUnlockUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockUnit', Sort.desc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> sortByYakuId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yakuId', Sort.asc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> sortByYakuIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yakuId', Sort.desc);
    });
  }
}

extension YakuRecordQuerySortThenBy
    on QueryBuilder<YakuRecord, YakuRecord, QSortThenBy> {
  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> thenByHan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'han', Sort.asc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> thenByHanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'han', Sort.desc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> thenByHanOpen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hanOpen', Sort.asc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> thenByHanOpenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hanOpen', Sort.desc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> thenByKanji() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kanji', Sort.asc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> thenByKanjiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kanji', Sort.desc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> thenByNickname() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nickname', Sort.asc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> thenByNicknameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nickname', Sort.desc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> thenBySummary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summary', Sort.asc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> thenBySummaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summary', Sort.desc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> thenByTier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tier', Sort.asc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> thenByTierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tier', Sort.desc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> thenByUnlockUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockUnit', Sort.asc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> thenByUnlockUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockUnit', Sort.desc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> thenByYakuId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yakuId', Sort.asc);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QAfterSortBy> thenByYakuIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yakuId', Sort.desc);
    });
  }
}

extension YakuRecordQueryWhereDistinct
    on QueryBuilder<YakuRecord, YakuRecord, QDistinct> {
  QueryBuilder<YakuRecord, YakuRecord, QDistinct> distinctByDescription({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QDistinct> distinctByHan() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'han');
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QDistinct> distinctByHanOpen() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hanOpen');
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QDistinct> distinctByKanji({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'kanji', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QDistinct> distinctByName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QDistinct> distinctByNickname({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nickname', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QDistinct> distinctBySummary({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'summary', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QDistinct> distinctByTier({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tier', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QDistinct> distinctByTiles() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tiles');
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QDistinct> distinctByUnlockUnit({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unlockUnit', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<YakuRecord, YakuRecord, QDistinct> distinctByYakuId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'yakuId', caseSensitive: caseSensitive);
    });
  }
}

extension YakuRecordQueryProperty
    on QueryBuilder<YakuRecord, YakuRecord, QQueryProperty> {
  QueryBuilder<YakuRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<YakuRecord, String, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<YakuRecord, int, QQueryOperations> hanProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'han');
    });
  }

  QueryBuilder<YakuRecord, int?, QQueryOperations> hanOpenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hanOpen');
    });
  }

  QueryBuilder<YakuRecord, String, QQueryOperations> kanjiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'kanji');
    });
  }

  QueryBuilder<YakuRecord, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<YakuRecord, String, QQueryOperations> nicknameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nickname');
    });
  }

  QueryBuilder<YakuRecord, String, QQueryOperations> summaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'summary');
    });
  }

  QueryBuilder<YakuRecord, YakuTier, QQueryOperations> tierProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tier');
    });
  }

  QueryBuilder<YakuRecord, List<String>, QQueryOperations> tilesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tiles');
    });
  }

  QueryBuilder<YakuRecord, String?, QQueryOperations> unlockUnitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unlockUnit');
    });
  }

  QueryBuilder<YakuRecord, String, QQueryOperations> yakuIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'yakuId');
    });
  }
}
