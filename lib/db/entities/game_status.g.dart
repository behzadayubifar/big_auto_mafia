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
    r'inComplete': PropertySchema(
      id: 0,
      name: r'inComplete',
      type: IsarType.string,
    ),
    r'isNight': PropertySchema(
      id: 1,
      name: r'isNight',
      type: IsarType.bool,
    ),
    r'night': PropertySchema(
      id: 2,
      name: r'night',
      type: IsarType.long,
    ),
    r'nightCode': PropertySchema(
      id: 3,
      name: r'nightCode',
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
  writer.writeString(offsets[0], object.inComplete);
  writer.writeBool(offsets[1], object.isNight);
  writer.writeLong(offsets[2], object.night);
  writer.writeLong(offsets[3], object.nightCode);
  writer.writeLong(offsets[4], object.timePassed);
}

GameStatus _gameStatusDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GameStatus();
  object.id = id;
  object.inComplete = reader.readStringOrNull(offsets[0]);
  object.isNight = reader.readBool(offsets[1]);
  object.night = reader.readLong(offsets[2]);
  object.nightCode = reader.readLongOrNull(offsets[3]);
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
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
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

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      nightCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nightCode',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      nightCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nightCode',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> nightCodeEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nightCode',
        value: value,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      nightCodeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nightCode',
        value: value,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> nightCodeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nightCode',
        value: value,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> nightCodeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nightCode',
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

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> sortByNightCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightCode', Sort.asc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> sortByNightCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightCode', Sort.desc);
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

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> thenByNightCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightCode', Sort.asc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> thenByNightCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightCode', Sort.desc);
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

  QueryBuilder<GameStatus, GameStatus, QDistinct> distinctByNightCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nightCode');
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

  QueryBuilder<GameStatus, int?, QQueryOperations> nightCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nightCode');
    });
  }

  QueryBuilder<GameStatus, int, QQueryOperations> timePassedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timePassed');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNightCollection on Isar {
  IsarCollection<Night> get nights => this.collection();
}

const NightSchema = CollectionSchema(
  name: r'Night',
  id: -2452319164639997485,
  properties: {
    r'inComplete': PropertySchema(
      id: 0,
      name: r'inComplete',
      type: IsarType.string,
    ),
    r'isNight': PropertySchema(
      id: 1,
      name: r'isNight',
      type: IsarType.bool,
    ),
    r'nightCode': PropertySchema(
      id: 2,
      name: r'nightCode',
      type: IsarType.long,
    ),
    r'nightNumber': PropertySchema(
      id: 3,
      name: r'nightNumber',
      type: IsarType.long,
    ),
    r'playerNameWhoIsComingBack': PropertySchema(
      id: 4,
      name: r'playerNameWhoIsComingBack',
      type: IsarType.string,
    ),
    r'playersWaitingForDoingTheirNightJob': PropertySchema(
      id: 5,
      name: r'playersWaitingForDoingTheirNightJob',
      type: IsarType.stringList,
    ),
    r'timePassed': PropertySchema(
      id: 6,
      name: r'timePassed',
      type: IsarType.long,
    )
  },
  estimateSize: _nightEstimateSize,
  serialize: _nightSerialize,
  deserialize: _nightDeserialize,
  deserializeProp: _nightDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _nightGetId,
  getLinks: _nightGetLinks,
  attach: _nightAttach,
  version: '3.1.0+1',
);

int _nightEstimateSize(
  Night object,
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
  {
    final value = object.playerNameWhoIsComingBack;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.playersWaitingForDoingTheirNightJob;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  return bytesCount;
}

void _nightSerialize(
  Night object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.inComplete);
  writer.writeBool(offsets[1], object.isNight);
  writer.writeLong(offsets[2], object.nightCode);
  writer.writeLong(offsets[3], object.nightNumber);
  writer.writeString(offsets[4], object.playerNameWhoIsComingBack);
  writer.writeStringList(
      offsets[5], object.playersWaitingForDoingTheirNightJob);
  writer.writeLong(offsets[6], object.timePassed);
}

Night _nightDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Night();
  object.id = id;
  object.inComplete = reader.readStringOrNull(offsets[0]);
  object.isNight = reader.readBool(offsets[1]);
  object.nightCode = reader.readLongOrNull(offsets[2]);
  object.nightNumber = reader.readLong(offsets[3]);
  object.playerNameWhoIsComingBack = reader.readStringOrNull(offsets[4]);
  object.playersWaitingForDoingTheirNightJob =
      reader.readStringList(offsets[5]);
  object.timePassed = reader.readLong(offsets[6]);
  return object;
}

P _nightDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringList(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _nightGetId(Night object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _nightGetLinks(Night object) {
  return [];
}

void _nightAttach(IsarCollection<dynamic> col, Id id, Night object) {
  object.id = id;
}

extension NightQueryWhereSort on QueryBuilder<Night, Night, QWhere> {
  QueryBuilder<Night, Night, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NightQueryWhere on QueryBuilder<Night, Night, QWhereClause> {
  QueryBuilder<Night, Night, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Night, Night, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Night, Night, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Night, Night, QAfterWhereClause> idBetween(
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

extension NightQueryFilter on QueryBuilder<Night, Night, QFilterCondition> {
  QueryBuilder<Night, Night, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Night, Night, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Night, Night, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Night, Night, QAfterFilterCondition> inCompleteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'inComplete',
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> inCompleteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'inComplete',
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> inCompleteEqualTo(
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

  QueryBuilder<Night, Night, QAfterFilterCondition> inCompleteGreaterThan(
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

  QueryBuilder<Night, Night, QAfterFilterCondition> inCompleteLessThan(
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

  QueryBuilder<Night, Night, QAfterFilterCondition> inCompleteBetween(
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

  QueryBuilder<Night, Night, QAfterFilterCondition> inCompleteStartsWith(
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

  QueryBuilder<Night, Night, QAfterFilterCondition> inCompleteEndsWith(
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

  QueryBuilder<Night, Night, QAfterFilterCondition> inCompleteContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'inComplete',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> inCompleteMatches(
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

  QueryBuilder<Night, Night, QAfterFilterCondition> inCompleteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inComplete',
        value: '',
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> inCompleteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'inComplete',
        value: '',
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> isNightEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isNight',
        value: value,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> nightCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nightCode',
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> nightCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nightCode',
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> nightCodeEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nightCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> nightCodeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nightCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> nightCodeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nightCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> nightCodeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nightCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> nightNumberEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nightNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> nightNumberGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nightNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> nightNumberLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nightNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> nightNumberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nightNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      playerNameWhoIsComingBackIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'playerNameWhoIsComingBack',
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      playerNameWhoIsComingBackIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'playerNameWhoIsComingBack',
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      playerNameWhoIsComingBackEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'playerNameWhoIsComingBack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      playerNameWhoIsComingBackGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'playerNameWhoIsComingBack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      playerNameWhoIsComingBackLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'playerNameWhoIsComingBack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      playerNameWhoIsComingBackBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'playerNameWhoIsComingBack',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      playerNameWhoIsComingBackStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'playerNameWhoIsComingBack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      playerNameWhoIsComingBackEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'playerNameWhoIsComingBack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      playerNameWhoIsComingBackContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'playerNameWhoIsComingBack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      playerNameWhoIsComingBackMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'playerNameWhoIsComingBack',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      playerNameWhoIsComingBackIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'playerNameWhoIsComingBack',
        value: '',
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      playerNameWhoIsComingBackIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'playerNameWhoIsComingBack',
        value: '',
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      playersWaitingForDoingTheirNightJobIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'playersWaitingForDoingTheirNightJob',
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      playersWaitingForDoingTheirNightJobIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'playersWaitingForDoingTheirNightJob',
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      playersWaitingForDoingTheirNightJobElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'playersWaitingForDoingTheirNightJob',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      playersWaitingForDoingTheirNightJobElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'playersWaitingForDoingTheirNightJob',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      playersWaitingForDoingTheirNightJobElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'playersWaitingForDoingTheirNightJob',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      playersWaitingForDoingTheirNightJobElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'playersWaitingForDoingTheirNightJob',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      playersWaitingForDoingTheirNightJobElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'playersWaitingForDoingTheirNightJob',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      playersWaitingForDoingTheirNightJobElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'playersWaitingForDoingTheirNightJob',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      playersWaitingForDoingTheirNightJobElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'playersWaitingForDoingTheirNightJob',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      playersWaitingForDoingTheirNightJobElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'playersWaitingForDoingTheirNightJob',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      playersWaitingForDoingTheirNightJobElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'playersWaitingForDoingTheirNightJob',
        value: '',
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      playersWaitingForDoingTheirNightJobElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'playersWaitingForDoingTheirNightJob',
        value: '',
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      playersWaitingForDoingTheirNightJobLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'playersWaitingForDoingTheirNightJob',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      playersWaitingForDoingTheirNightJobIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'playersWaitingForDoingTheirNightJob',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      playersWaitingForDoingTheirNightJobIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'playersWaitingForDoingTheirNightJob',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      playersWaitingForDoingTheirNightJobLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'playersWaitingForDoingTheirNightJob',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      playersWaitingForDoingTheirNightJobLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'playersWaitingForDoingTheirNightJob',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      playersWaitingForDoingTheirNightJobLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'playersWaitingForDoingTheirNightJob',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> timePassedEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timePassed',
        value: value,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> timePassedGreaterThan(
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

  QueryBuilder<Night, Night, QAfterFilterCondition> timePassedLessThan(
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

  QueryBuilder<Night, Night, QAfterFilterCondition> timePassedBetween(
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

extension NightQueryObject on QueryBuilder<Night, Night, QFilterCondition> {}

extension NightQueryLinks on QueryBuilder<Night, Night, QFilterCondition> {}

extension NightQuerySortBy on QueryBuilder<Night, Night, QSortBy> {
  QueryBuilder<Night, Night, QAfterSortBy> sortByInComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inComplete', Sort.asc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> sortByInCompleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inComplete', Sort.desc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> sortByIsNight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isNight', Sort.asc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> sortByIsNightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isNight', Sort.desc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> sortByNightCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightCode', Sort.asc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> sortByNightCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightCode', Sort.desc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> sortByNightNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightNumber', Sort.asc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> sortByNightNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightNumber', Sort.desc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> sortByPlayerNameWhoIsComingBack() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerNameWhoIsComingBack', Sort.asc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy>
      sortByPlayerNameWhoIsComingBackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerNameWhoIsComingBack', Sort.desc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> sortByTimePassed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timePassed', Sort.asc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> sortByTimePassedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timePassed', Sort.desc);
    });
  }
}

extension NightQuerySortThenBy on QueryBuilder<Night, Night, QSortThenBy> {
  QueryBuilder<Night, Night, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> thenByInComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inComplete', Sort.asc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> thenByInCompleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inComplete', Sort.desc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> thenByIsNight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isNight', Sort.asc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> thenByIsNightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isNight', Sort.desc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> thenByNightCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightCode', Sort.asc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> thenByNightCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightCode', Sort.desc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> thenByNightNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightNumber', Sort.asc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> thenByNightNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightNumber', Sort.desc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> thenByPlayerNameWhoIsComingBack() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerNameWhoIsComingBack', Sort.asc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy>
      thenByPlayerNameWhoIsComingBackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerNameWhoIsComingBack', Sort.desc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> thenByTimePassed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timePassed', Sort.asc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> thenByTimePassedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timePassed', Sort.desc);
    });
  }
}

extension NightQueryWhereDistinct on QueryBuilder<Night, Night, QDistinct> {
  QueryBuilder<Night, Night, QDistinct> distinctByInComplete(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'inComplete', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Night, Night, QDistinct> distinctByIsNight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isNight');
    });
  }

  QueryBuilder<Night, Night, QDistinct> distinctByNightCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nightCode');
    });
  }

  QueryBuilder<Night, Night, QDistinct> distinctByNightNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nightNumber');
    });
  }

  QueryBuilder<Night, Night, QDistinct> distinctByPlayerNameWhoIsComingBack(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'playerNameWhoIsComingBack',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Night, Night, QDistinct>
      distinctByPlayersWaitingForDoingTheirNightJob() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'playersWaitingForDoingTheirNightJob');
    });
  }

  QueryBuilder<Night, Night, QDistinct> distinctByTimePassed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timePassed');
    });
  }
}

extension NightQueryProperty on QueryBuilder<Night, Night, QQueryProperty> {
  QueryBuilder<Night, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Night, String?, QQueryOperations> inCompleteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'inComplete');
    });
  }

  QueryBuilder<Night, bool, QQueryOperations> isNightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isNight');
    });
  }

  QueryBuilder<Night, int?, QQueryOperations> nightCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nightCode');
    });
  }

  QueryBuilder<Night, int, QQueryOperations> nightNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nightNumber');
    });
  }

  QueryBuilder<Night, String?, QQueryOperations>
      playerNameWhoIsComingBackProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'playerNameWhoIsComingBack');
    });
  }

  QueryBuilder<Night, List<String>?, QQueryOperations>
      playersWaitingForDoingTheirNightJobProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'playersWaitingForDoingTheirNightJob');
    });
  }

  QueryBuilder<Night, int, QQueryOperations> timePassedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timePassed');
    });
  }
}
