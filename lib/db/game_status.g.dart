// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_status.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGameStatusCollection on Isar {
  IsarCollection<GameStatus> get gameStatus => this.collection();
}

const GameStatusSchema = CollectionSchema(
  name: r'GameStatus',
  id: 6844732361368701430,
  properties: {
    r'code': PropertySchema(
      id: 0,
      name: r'code',
      type: IsarType.long,
    ),
    r'inComplete': PropertySchema(
      id: 1,
      name: r'inComplete',
      type: IsarType.string,
    ),
    r'isNight': PropertySchema(
      id: 2,
      name: r'isNight',
      type: IsarType.bool,
    ),
    r'night': PropertySchema(
      id: 3,
      name: r'night',
      type: IsarType.long,
    ),
    r'timePassed': PropertySchema(
      id: 4,
      name: r'timePassed',
      type: IsarType.long,
    )
  },
  estimateSize: _gameStatusEstimateSize,
  serialize: _gameStatusSerialize,
  deserialize: _gameStatusDeserialize,
  deserializeProp: _gameStatusDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _gameStatusGetId,
  getLinks: _gameStatusGetLinks,
  attach: _gameStatusAttach,
  version: '3.1.0+1',
);

int _gameStatusEstimateSize(
  GameStatus object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.inComplete;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _gameStatusSerialize(
  GameStatus object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.code);
  writer.writeString(offsets[1], object.inComplete);
  writer.writeBool(offsets[2], object.isNight);
  writer.writeLong(offsets[3], object.night);
  writer.writeLong(offsets[4], object.timePassed);
}

GameStatus _gameStatusDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GameStatus();
  object.code = reader.readLongOrNull(offsets[0]);
  object.id = id;
  object.inComplete = reader.readStringOrNull(offsets[1]);
  object.isNight = reader.readBool(offsets[2]);
  object.night = reader.readLong(offsets[3]);
  object.timePassed = reader.readLong(offsets[4]);
  return object;
}

P _gameStatusDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _gameStatusGetId(GameStatus object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _gameStatusGetLinks(GameStatus object) {
  return [];
}

void _gameStatusAttach(IsarCollection<dynamic> col, Id id, GameStatus object) {
  object.id = id;
}

extension GameStatusQueryWhereSort
    on QueryBuilder<GameStatus, GameStatus, QWhere> {
  QueryBuilder<GameStatus, GameStatus, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GameStatusQueryWhere
    on QueryBuilder<GameStatus, GameStatus, QWhereClause> {
  QueryBuilder<GameStatus, GameStatus, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<GameStatus, GameStatus, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension GameStatusQueryFilter
    on QueryBuilder<GameStatus, GameStatus, QFilterCondition> {
  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> codeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'code',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> codeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'code',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> codeEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> codeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'code',
        value: value,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> codeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'code',
        value: value,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> codeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'code',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      inCompleteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'inComplete',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      inCompleteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'inComplete',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> inCompleteEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inComplete',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      inCompleteGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'inComplete',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      inCompleteLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'inComplete',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> inCompleteBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'inComplete',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      inCompleteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'inComplete',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      inCompleteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'inComplete',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      inCompleteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'inComplete',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> inCompleteMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'inComplete',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      inCompleteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inComplete',
        value: '',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      inCompleteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'inComplete',
        value: '',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> isNightEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isNight',
        value: value,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> nightEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'night',
        value: value,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> nightGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'night',
        value: value,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> nightLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'night',
        value: value,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> nightBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'night',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> timePassedEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timePassed',
        value: value,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      timePassedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timePassed',
        value: value,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      timePassedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timePassed',
        value: value,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> timePassedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timePassed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension GameStatusQueryObject
    on QueryBuilder<GameStatus, GameStatus, QFilterCondition> {}

extension GameStatusQueryLinks
    on QueryBuilder<GameStatus, GameStatus, QFilterCondition> {}

extension GameStatusQuerySortBy
    on QueryBuilder<GameStatus, GameStatus, QSortBy> {
  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> sortByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> sortByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> sortByInComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inComplete', Sort.asc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> sortByInCompleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inComplete', Sort.desc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> sortByIsNight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isNight', Sort.asc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> sortByIsNightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isNight', Sort.desc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> sortByNight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'night', Sort.asc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> sortByNightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'night', Sort.desc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> sortByTimePassed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timePassed', Sort.asc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> sortByTimePassedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timePassed', Sort.desc);
    });
  }
}

extension GameStatusQuerySortThenBy
    on QueryBuilder<GameStatus, GameStatus, QSortThenBy> {
  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> thenByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> thenByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> thenByInComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inComplete', Sort.asc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> thenByInCompleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inComplete', Sort.desc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> thenByIsNight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isNight', Sort.asc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> thenByIsNightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isNight', Sort.desc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> thenByNight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'night', Sort.asc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> thenByNightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'night', Sort.desc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> thenByTimePassed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timePassed', Sort.asc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> thenByTimePassedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timePassed', Sort.desc);
    });
  }
}

extension GameStatusQueryWhereDistinct
    on QueryBuilder<GameStatus, GameStatus, QDistinct> {
  QueryBuilder<GameStatus, GameStatus, QDistinct> distinctByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'code');
    });
  }

  QueryBuilder<GameStatus, GameStatus, QDistinct> distinctByInComplete(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'inComplete', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QDistinct> distinctByIsNight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isNight');
    });
  }

  QueryBuilder<GameStatus, GameStatus, QDistinct> distinctByNight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'night');
    });
  }

  QueryBuilder<GameStatus, GameStatus, QDistinct> distinctByTimePassed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timePassed');
    });
  }
}

extension GameStatusQueryProperty
    on QueryBuilder<GameStatus, GameStatus, QQueryProperty> {
  QueryBuilder<GameStatus, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<GameStatus, int?, QQueryOperations> codeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'code');
    });
  }

  QueryBuilder<GameStatus, String?, QQueryOperations> inCompleteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'inComplete');
    });
  }

  QueryBuilder<GameStatus, bool, QQueryOperations> isNightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isNight');
    });
  }

  QueryBuilder<GameStatus, int, QQueryOperations> nightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'night');
    });
  }

  QueryBuilder<GameStatus, int, QQueryOperations> timePassedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timePassed');
    });
  }
}
