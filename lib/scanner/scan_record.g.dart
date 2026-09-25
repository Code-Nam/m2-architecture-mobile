// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_record.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetScanRecordCollection on Isar {
  IsarCollection<ScanRecord> get scanRecords => this.collection();
}

const ScanRecordSchema = CollectionSchema(
  name: r'ScanRecord',
  id: -2239514724671306450,
  properties: {
    r'code': PropertySchema(id: 0, name: r'code', type: IsarType.string),
    r'scannedAt': PropertySchema(
      id: 1,
      name: r'scannedAt',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _scanRecordEstimateSize,
  serialize: _scanRecordSerialize,
  deserialize: _scanRecordDeserialize,
  deserializeProp: _scanRecordDeserializeProp,
  idName: r'id',
  indexes: {
    r'scannedAt': IndexSchema(
      id: 5186314067332975445,
      name: r'scannedAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'scannedAt',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _scanRecordGetId,
  getLinks: _scanRecordGetLinks,
  attach: _scanRecordAttach,
  version: '3.3.2',
);

int _scanRecordEstimateSize(
  ScanRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.code.length * 3;
  return bytesCount;
}

void _scanRecordSerialize(
  ScanRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.code);
  writer.writeDateTime(offsets[1], object.scannedAt);
}

ScanRecord _scanRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ScanRecord();
  object.code = reader.readString(offsets[0]);
  object.id = id;
  object.scannedAt = reader.readDateTime(offsets[1]);
  return object;
}

P _scanRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _scanRecordGetId(ScanRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _scanRecordGetLinks(ScanRecord object) {
  return [];
}

void _scanRecordAttach(IsarCollection<dynamic> col, Id id, ScanRecord object) {
  object.id = id;
}

extension ScanRecordQueryWhereSort
    on QueryBuilder<ScanRecord, ScanRecord, QWhere> {
  QueryBuilder<ScanRecord, ScanRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ScanRecord, ScanRecord, QAfterWhere> anyScannedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'scannedAt'),
      );
    });
  }
}

extension ScanRecordQueryWhere
    on QueryBuilder<ScanRecord, ScanRecord, QWhereClause> {
  QueryBuilder<ScanRecord, ScanRecord, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<ScanRecord, ScanRecord, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<ScanRecord, ScanRecord, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ScanRecord, ScanRecord, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ScanRecord, ScanRecord, QAfterWhereClause> idBetween(
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

  QueryBuilder<ScanRecord, ScanRecord, QAfterWhereClause> scannedAtEqualTo(
    DateTime scannedAt,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'scannedAt', value: [scannedAt]),
      );
    });
  }

  QueryBuilder<ScanRecord, ScanRecord, QAfterWhereClause> scannedAtNotEqualTo(
    DateTime scannedAt,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'scannedAt',
                lower: [],
                upper: [scannedAt],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'scannedAt',
                lower: [scannedAt],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'scannedAt',
                lower: [scannedAt],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'scannedAt',
                lower: [],
                upper: [scannedAt],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<ScanRecord, ScanRecord, QAfterWhereClause> scannedAtGreaterThan(
    DateTime scannedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'scannedAt',
          lower: [scannedAt],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<ScanRecord, ScanRecord, QAfterWhereClause> scannedAtLessThan(
    DateTime scannedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'scannedAt',
          lower: [],
          upper: [scannedAt],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<ScanRecord, ScanRecord, QAfterWhereClause> scannedAtBetween(
    DateTime lowerScannedAt,
    DateTime upperScannedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'scannedAt',
          lower: [lowerScannedAt],
          includeLower: includeLower,
          upper: [upperScannedAt],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension ScanRecordQueryFilter
    on QueryBuilder<ScanRecord, ScanRecord, QFilterCondition> {
  QueryBuilder<ScanRecord, ScanRecord, QAfterFilterCondition> codeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'code',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ScanRecord, ScanRecord, QAfterFilterCondition> codeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'code',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ScanRecord, ScanRecord, QAfterFilterCondition> codeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'code',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ScanRecord, ScanRecord, QAfterFilterCondition> codeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'code',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ScanRecord, ScanRecord, QAfterFilterCondition> codeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'code',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ScanRecord, ScanRecord, QAfterFilterCondition> codeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'code',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ScanRecord, ScanRecord, QAfterFilterCondition> codeContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'code',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ScanRecord, ScanRecord, QAfterFilterCondition> codeMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'code',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ScanRecord, ScanRecord, QAfterFilterCondition> codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'code', value: ''),
      );
    });
  }

  QueryBuilder<ScanRecord, ScanRecord, QAfterFilterCondition> codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'code', value: ''),
      );
    });
  }

  QueryBuilder<ScanRecord, ScanRecord, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<ScanRecord, ScanRecord, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ScanRecord, ScanRecord, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ScanRecord, ScanRecord, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ScanRecord, ScanRecord, QAfterFilterCondition> scannedAtEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'scannedAt', value: value),
      );
    });
  }

  QueryBuilder<ScanRecord, ScanRecord, QAfterFilterCondition>
  scannedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'scannedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ScanRecord, ScanRecord, QAfterFilterCondition> scannedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'scannedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ScanRecord, ScanRecord, QAfterFilterCondition> scannedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'scannedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension ScanRecordQueryObject
    on QueryBuilder<ScanRecord, ScanRecord, QFilterCondition> {}

extension ScanRecordQueryLinks
    on QueryBuilder<ScanRecord, ScanRecord, QFilterCondition> {}

extension ScanRecordQuerySortBy
    on QueryBuilder<ScanRecord, ScanRecord, QSortBy> {
  QueryBuilder<ScanRecord, ScanRecord, QAfterSortBy> sortByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<ScanRecord, ScanRecord, QAfterSortBy> sortByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<ScanRecord, ScanRecord, QAfterSortBy> sortByScannedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scannedAt', Sort.asc);
    });
  }

  QueryBuilder<ScanRecord, ScanRecord, QAfterSortBy> sortByScannedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scannedAt', Sort.desc);
    });
  }
}

extension ScanRecordQuerySortThenBy
    on QueryBuilder<ScanRecord, ScanRecord, QSortThenBy> {
  QueryBuilder<ScanRecord, ScanRecord, QAfterSortBy> thenByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<ScanRecord, ScanRecord, QAfterSortBy> thenByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<ScanRecord, ScanRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ScanRecord, ScanRecord, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ScanRecord, ScanRecord, QAfterSortBy> thenByScannedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scannedAt', Sort.asc);
    });
  }

  QueryBuilder<ScanRecord, ScanRecord, QAfterSortBy> thenByScannedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scannedAt', Sort.desc);
    });
  }
}

extension ScanRecordQueryWhereDistinct
    on QueryBuilder<ScanRecord, ScanRecord, QDistinct> {
  QueryBuilder<ScanRecord, ScanRecord, QDistinct> distinctByCode({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'code', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ScanRecord, ScanRecord, QDistinct> distinctByScannedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scannedAt');
    });
  }
}

extension ScanRecordQueryProperty
    on QueryBuilder<ScanRecord, ScanRecord, QQueryProperty> {
  QueryBuilder<ScanRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ScanRecord, String, QQueryOperations> codeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'code');
    });
  }

  QueryBuilder<ScanRecord, DateTime, QQueryOperations> scannedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scannedAt');
    });
  }
}
