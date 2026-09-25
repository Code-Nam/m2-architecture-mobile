// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_record.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSettingsRecordCollection on Isar {
  IsarCollection<SettingsRecord> get settingsRecords => this.collection();
}

const SettingsRecordSchema = CollectionSchema(
  name: r'SettingsRecord',
  id: -4061629773282228682,
  properties: {
    r'themeMode': PropertySchema(
      id: 0,
      name: r'themeMode',
      type: IsarType.byte,
      enumMap: _SettingsRecordthemeModeEnumValueMap,
    ),
  },

  estimateSize: _settingsRecordEstimateSize,
  serialize: _settingsRecordSerialize,
  deserialize: _settingsRecordDeserialize,
  deserializeProp: _settingsRecordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _settingsRecordGetId,
  getLinks: _settingsRecordGetLinks,
  attach: _settingsRecordAttach,
  version: '3.3.2',
);

int _settingsRecordEstimateSize(
  SettingsRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _settingsRecordSerialize(
  SettingsRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByte(offsets[0], object.themeMode.index);
}

SettingsRecord _settingsRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SettingsRecord();
  object.id = id;
  object.themeMode =
      _SettingsRecordthemeModeValueEnumMap[reader.readByteOrNull(offsets[0])] ??
      ThemeMode.system;
  return object;
}

P _settingsRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_SettingsRecordthemeModeValueEnumMap[reader.readByteOrNull(
                offset,
              )] ??
              ThemeMode.system)
          as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _SettingsRecordthemeModeEnumValueMap = {
  'system': 0,
  'light': 1,
  'dark': 2,
};
const _SettingsRecordthemeModeValueEnumMap = {
  0: ThemeMode.system,
  1: ThemeMode.light,
  2: ThemeMode.dark,
};

Id _settingsRecordGetId(SettingsRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _settingsRecordGetLinks(SettingsRecord object) {
  return [];
}

void _settingsRecordAttach(
  IsarCollection<dynamic> col,
  Id id,
  SettingsRecord object,
) {
  object.id = id;
}

extension SettingsRecordQueryWhereSort
    on QueryBuilder<SettingsRecord, SettingsRecord, QWhere> {
  QueryBuilder<SettingsRecord, SettingsRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SettingsRecordQueryWhere
    on QueryBuilder<SettingsRecord, SettingsRecord, QWhereClause> {
  QueryBuilder<SettingsRecord, SettingsRecord, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<SettingsRecord, SettingsRecord, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
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

  QueryBuilder<SettingsRecord, SettingsRecord, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SettingsRecord, SettingsRecord, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SettingsRecord, SettingsRecord, QAfterWhereClause> idBetween(
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
}

extension SettingsRecordQueryFilter
    on QueryBuilder<SettingsRecord, SettingsRecord, QFilterCondition> {
  QueryBuilder<SettingsRecord, SettingsRecord, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<SettingsRecord, SettingsRecord, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
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

  QueryBuilder<SettingsRecord, SettingsRecord, QAfterFilterCondition>
  idLessThan(Id value, {bool include = false}) {
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

  QueryBuilder<SettingsRecord, SettingsRecord, QAfterFilterCondition> idBetween(
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

  QueryBuilder<SettingsRecord, SettingsRecord, QAfterFilterCondition>
  themeModeEqualTo(ThemeMode value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'themeMode', value: value),
      );
    });
  }

  QueryBuilder<SettingsRecord, SettingsRecord, QAfterFilterCondition>
  themeModeGreaterThan(ThemeMode value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'themeMode',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsRecord, SettingsRecord, QAfterFilterCondition>
  themeModeLessThan(ThemeMode value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'themeMode',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsRecord, SettingsRecord, QAfterFilterCondition>
  themeModeBetween(
    ThemeMode lower,
    ThemeMode upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'themeMode',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension SettingsRecordQueryObject
    on QueryBuilder<SettingsRecord, SettingsRecord, QFilterCondition> {}

extension SettingsRecordQueryLinks
    on QueryBuilder<SettingsRecord, SettingsRecord, QFilterCondition> {}

extension SettingsRecordQuerySortBy
    on QueryBuilder<SettingsRecord, SettingsRecord, QSortBy> {
  QueryBuilder<SettingsRecord, SettingsRecord, QAfterSortBy> sortByThemeMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeMode', Sort.asc);
    });
  }

  QueryBuilder<SettingsRecord, SettingsRecord, QAfterSortBy>
  sortByThemeModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeMode', Sort.desc);
    });
  }
}

extension SettingsRecordQuerySortThenBy
    on QueryBuilder<SettingsRecord, SettingsRecord, QSortThenBy> {
  QueryBuilder<SettingsRecord, SettingsRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SettingsRecord, SettingsRecord, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SettingsRecord, SettingsRecord, QAfterSortBy> thenByThemeMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeMode', Sort.asc);
    });
  }

  QueryBuilder<SettingsRecord, SettingsRecord, QAfterSortBy>
  thenByThemeModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeMode', Sort.desc);
    });
  }
}

extension SettingsRecordQueryWhereDistinct
    on QueryBuilder<SettingsRecord, SettingsRecord, QDistinct> {
  QueryBuilder<SettingsRecord, SettingsRecord, QDistinct>
  distinctByThemeMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'themeMode');
    });
  }
}

extension SettingsRecordQueryProperty
    on QueryBuilder<SettingsRecord, SettingsRecord, QQueryProperty> {
  QueryBuilder<SettingsRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SettingsRecord, ThemeMode, QQueryOperations>
  themeModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'themeMode');
    });
  }
}
