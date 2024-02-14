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
    r'dayNumber': PropertySchema(
      id: 0,
      name: r'dayNumber',
      type: IsarType.long,
    ),
    r'hashCode': PropertySchema(
      id: 1,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'isChaos': PropertySchema(
      id: 2,
      name: r'isChaos',
      type: IsarType.bool,
    ),
    r'isDay': PropertySchema(
      id: 3,
      name: r'isDay',
      type: IsarType.bool,
    ),
    r'isFinished': PropertySchema(
      id: 4,
      name: r'isFinished',
      type: IsarType.bool,
    ),
    r'nightCode': PropertySchema(
      id: 5,
      name: r'nightCode',
      type: IsarType.long,
    ),
    r'playersWhoSawTheirRole': PropertySchema(
      id: 6,
      name: r'playersWhoSawTheirRole',
      type: IsarType.stringList,
    ),
    r'remainedChancesForNightEnquiry': PropertySchema(
      id: 7,
      name: r'remainedChancesForNightEnquiry',
      type: IsarType.long,
    ),
    r'remainedMafiasBullets': PropertySchema(
      id: 8,
      name: r'remainedMafiasBullets',
      type: IsarType.long,
    ),
    r'situation': PropertySchema(
      id: 9,
      name: r'situation',
      type: IsarType.string,
    ),
    r'statusOfGame': PropertySchema(
      id: 10,
      name: r'statusOfGame',
      type: IsarType.string,
    ),
    r'timeLeft': PropertySchema(
      id: 11,
      name: r'timeLeft',
      type: IsarType.stringList,
    ),
    r'usedLastMoves': PropertySchema(
      id: 12,
      name: r'usedLastMoves',
      type: IsarType.stringList,
    ),
    r'wholeGameTimePassed': PropertySchema(
      id: 13,
      name: r'wholeGameTimePassed',
      type: IsarType.long,
    ),
    r'winner': PropertySchema(
      id: 14,
      name: r'winner',
      type: IsarType.string,
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
    final list = object.playersWhoSawTheirRole;
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
  {
    final value = object.situation;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.statusOfGame;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.timeLeft;
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
  {
    final list = object.usedLastMoves;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          if (value != null) {
            bytesCount += value.length * 3;
          }
        }
      }
    }
  }
  {
    final value = object.winner;
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
  writer.writeLong(offsets[0], object.dayNumber);
  writer.writeLong(offsets[1], object.hashCode);
  writer.writeBool(offsets[2], object.isChaos);
  writer.writeBool(offsets[3], object.isDay);
  writer.writeBool(offsets[4], object.isFinished);
  writer.writeLong(offsets[5], object.nightCode);
  writer.writeStringList(offsets[6], object.playersWhoSawTheirRole);
  writer.writeLong(offsets[7], object.remainedChancesForNightEnquiry);
  writer.writeLong(offsets[8], object.remainedMafiasBullets);
  writer.writeString(offsets[9], object.situation);
  writer.writeString(offsets[10], object.statusOfGame);
  writer.writeStringList(offsets[11], object.timeLeft);
  writer.writeStringList(offsets[12], object.usedLastMoves);
  writer.writeLong(offsets[13], object.wholeGameTimePassed);
  writer.writeString(offsets[14], object.winner);
}

GameStatus _gameStatusDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GameStatus();
  object.dayNumber = reader.readLong(offsets[0]);
  object.id = id;
  object.isChaos = reader.readBoolOrNull(offsets[2]);
  object.isDay = reader.readBool(offsets[3]);
  object.isFinished = reader.readBoolOrNull(offsets[4]);
  object.nightCode = reader.readLongOrNull(offsets[5]);
  object.playersWhoSawTheirRole = reader.readStringList(offsets[6]);
  object.remainedChancesForNightEnquiry = reader.readLongOrNull(offsets[7]);
  object.remainedMafiasBullets = reader.readLongOrNull(offsets[8]);
  object.situation = reader.readStringOrNull(offsets[9]);
  object.statusOfGame = reader.readStringOrNull(offsets[10]);
  object.timeLeft = reader.readStringList(offsets[11]);
  object.usedLastMoves = reader.readStringOrNullList(offsets[12]);
  object.wholeGameTimePassed = reader.readLongOrNull(offsets[13]);
  object.winner = reader.readStringOrNull(offsets[14]);
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
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readBoolOrNull(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readStringList(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringList(offset)) as P;
    case 12:
      return (reader.readStringOrNullList(offset)) as P;
    case 13:
      return (reader.readLongOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
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
  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> dayNumberEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dayNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      dayNumberGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dayNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> dayNumberLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dayNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> dayNumberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dayNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> hashCodeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      hashCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> hashCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> hashCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hashCode',
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

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> isChaosIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isChaos',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      isChaosIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isChaos',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> isChaosEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isChaos',
        value: value,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> isDayEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDay',
        value: value,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      isFinishedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isFinished',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      isFinishedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isFinished',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> isFinishedEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFinished',
        value: value,
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

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      playersWhoSawTheirRoleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'playersWhoSawTheirRole',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      playersWhoSawTheirRoleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'playersWhoSawTheirRole',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      playersWhoSawTheirRoleElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'playersWhoSawTheirRole',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      playersWhoSawTheirRoleElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'playersWhoSawTheirRole',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      playersWhoSawTheirRoleElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'playersWhoSawTheirRole',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      playersWhoSawTheirRoleElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'playersWhoSawTheirRole',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      playersWhoSawTheirRoleElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'playersWhoSawTheirRole',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      playersWhoSawTheirRoleElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'playersWhoSawTheirRole',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      playersWhoSawTheirRoleElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'playersWhoSawTheirRole',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      playersWhoSawTheirRoleElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'playersWhoSawTheirRole',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      playersWhoSawTheirRoleElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'playersWhoSawTheirRole',
        value: '',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      playersWhoSawTheirRoleElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'playersWhoSawTheirRole',
        value: '',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      playersWhoSawTheirRoleLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'playersWhoSawTheirRole',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      playersWhoSawTheirRoleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'playersWhoSawTheirRole',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      playersWhoSawTheirRoleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'playersWhoSawTheirRole',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      playersWhoSawTheirRoleLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'playersWhoSawTheirRole',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      playersWhoSawTheirRoleLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'playersWhoSawTheirRole',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      playersWhoSawTheirRoleLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'playersWhoSawTheirRole',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      remainedChancesForNightEnquiryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remainedChancesForNightEnquiry',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      remainedChancesForNightEnquiryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remainedChancesForNightEnquiry',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      remainedChancesForNightEnquiryEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remainedChancesForNightEnquiry',
        value: value,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      remainedChancesForNightEnquiryGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remainedChancesForNightEnquiry',
        value: value,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      remainedChancesForNightEnquiryLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remainedChancesForNightEnquiry',
        value: value,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      remainedChancesForNightEnquiryBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remainedChancesForNightEnquiry',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      remainedMafiasBulletsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remainedMafiasBullets',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      remainedMafiasBulletsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remainedMafiasBullets',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      remainedMafiasBulletsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remainedMafiasBullets',
        value: value,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      remainedMafiasBulletsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remainedMafiasBullets',
        value: value,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      remainedMafiasBulletsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remainedMafiasBullets',
        value: value,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      remainedMafiasBulletsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remainedMafiasBullets',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      situationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'situation',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      situationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'situation',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> situationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'situation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      situationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'situation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> situationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'situation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> situationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'situation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      situationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'situation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> situationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'situation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> situationContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'situation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> situationMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'situation',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      situationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'situation',
        value: '',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      situationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'situation',
        value: '',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      statusOfGameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'statusOfGame',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      statusOfGameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'statusOfGame',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      statusOfGameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statusOfGame',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      statusOfGameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'statusOfGame',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      statusOfGameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'statusOfGame',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      statusOfGameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'statusOfGame',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      statusOfGameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'statusOfGame',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      statusOfGameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'statusOfGame',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      statusOfGameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'statusOfGame',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      statusOfGameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'statusOfGame',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      statusOfGameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statusOfGame',
        value: '',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      statusOfGameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'statusOfGame',
        value: '',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> timeLeftIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'timeLeft',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      timeLeftIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'timeLeft',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      timeLeftElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeLeft',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      timeLeftElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timeLeft',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      timeLeftElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timeLeft',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      timeLeftElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timeLeft',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      timeLeftElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'timeLeft',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      timeLeftElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'timeLeft',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      timeLeftElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'timeLeft',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      timeLeftElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'timeLeft',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      timeLeftElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeLeft',
        value: '',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      timeLeftElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'timeLeft',
        value: '',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      timeLeftLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timeLeft',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      timeLeftIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timeLeft',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      timeLeftIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timeLeft',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      timeLeftLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timeLeft',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      timeLeftLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timeLeft',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      timeLeftLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timeLeft',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      usedLastMovesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'usedLastMoves',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      usedLastMovesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'usedLastMoves',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      usedLastMovesElementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNull(
        property: r'usedLastMoves',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      usedLastMovesElementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.elementIsNotNull(
        property: r'usedLastMoves',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      usedLastMovesElementEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usedLastMoves',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      usedLastMovesElementGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'usedLastMoves',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      usedLastMovesElementLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'usedLastMoves',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      usedLastMovesElementBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'usedLastMoves',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      usedLastMovesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'usedLastMoves',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      usedLastMovesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'usedLastMoves',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      usedLastMovesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'usedLastMoves',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      usedLastMovesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'usedLastMoves',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      usedLastMovesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usedLastMoves',
        value: '',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      usedLastMovesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'usedLastMoves',
        value: '',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      usedLastMovesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'usedLastMoves',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      usedLastMovesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'usedLastMoves',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      usedLastMovesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'usedLastMoves',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      usedLastMovesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'usedLastMoves',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      usedLastMovesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'usedLastMoves',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      usedLastMovesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'usedLastMoves',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      wholeGameTimePassedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'wholeGameTimePassed',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      wholeGameTimePassedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'wholeGameTimePassed',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      wholeGameTimePassedEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wholeGameTimePassed',
        value: value,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      wholeGameTimePassedGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wholeGameTimePassed',
        value: value,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      wholeGameTimePassedLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wholeGameTimePassed',
        value: value,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      wholeGameTimePassedBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wholeGameTimePassed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> winnerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'winner',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      winnerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'winner',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> winnerEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'winner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> winnerGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'winner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> winnerLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'winner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> winnerBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'winner',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> winnerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'winner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> winnerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'winner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> winnerContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'winner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> winnerMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'winner',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition> winnerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'winner',
        value: '',
      ));
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterFilterCondition>
      winnerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'winner',
        value: '',
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
  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> sortByDayNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayNumber', Sort.asc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> sortByDayNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayNumber', Sort.desc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> sortByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> sortByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> sortByIsChaos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isChaos', Sort.asc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> sortByIsChaosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isChaos', Sort.desc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> sortByIsDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDay', Sort.asc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> sortByIsDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDay', Sort.desc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> sortByIsFinished() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFinished', Sort.asc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> sortByIsFinishedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFinished', Sort.desc);
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

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy>
      sortByRemainedChancesForNightEnquiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainedChancesForNightEnquiry', Sort.asc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy>
      sortByRemainedChancesForNightEnquiryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainedChancesForNightEnquiry', Sort.desc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy>
      sortByRemainedMafiasBullets() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainedMafiasBullets', Sort.asc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy>
      sortByRemainedMafiasBulletsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainedMafiasBullets', Sort.desc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> sortBySituation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'situation', Sort.asc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> sortBySituationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'situation', Sort.desc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> sortByStatusOfGame() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusOfGame', Sort.asc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> sortByStatusOfGameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusOfGame', Sort.desc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy>
      sortByWholeGameTimePassed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wholeGameTimePassed', Sort.asc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy>
      sortByWholeGameTimePassedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wholeGameTimePassed', Sort.desc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> sortByWinner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'winner', Sort.asc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> sortByWinnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'winner', Sort.desc);
    });
  }
}

extension GameStatusQuerySortThenBy
    on QueryBuilder<GameStatus, GameStatus, QSortThenBy> {
  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> thenByDayNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayNumber', Sort.asc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> thenByDayNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayNumber', Sort.desc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> thenByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> thenByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
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

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> thenByIsChaos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isChaos', Sort.asc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> thenByIsChaosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isChaos', Sort.desc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> thenByIsDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDay', Sort.asc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> thenByIsDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDay', Sort.desc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> thenByIsFinished() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFinished', Sort.asc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> thenByIsFinishedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFinished', Sort.desc);
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

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy>
      thenByRemainedChancesForNightEnquiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainedChancesForNightEnquiry', Sort.asc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy>
      thenByRemainedChancesForNightEnquiryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainedChancesForNightEnquiry', Sort.desc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy>
      thenByRemainedMafiasBullets() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainedMafiasBullets', Sort.asc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy>
      thenByRemainedMafiasBulletsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainedMafiasBullets', Sort.desc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> thenBySituation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'situation', Sort.asc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> thenBySituationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'situation', Sort.desc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> thenByStatusOfGame() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusOfGame', Sort.asc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> thenByStatusOfGameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusOfGame', Sort.desc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy>
      thenByWholeGameTimePassed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wholeGameTimePassed', Sort.asc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy>
      thenByWholeGameTimePassedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wholeGameTimePassed', Sort.desc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> thenByWinner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'winner', Sort.asc);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QAfterSortBy> thenByWinnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'winner', Sort.desc);
    });
  }
}

extension GameStatusQueryWhereDistinct
    on QueryBuilder<GameStatus, GameStatus, QDistinct> {
  QueryBuilder<GameStatus, GameStatus, QDistinct> distinctByDayNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dayNumber');
    });
  }

  QueryBuilder<GameStatus, GameStatus, QDistinct> distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }

  QueryBuilder<GameStatus, GameStatus, QDistinct> distinctByIsChaos() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isChaos');
    });
  }

  QueryBuilder<GameStatus, GameStatus, QDistinct> distinctByIsDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDay');
    });
  }

  QueryBuilder<GameStatus, GameStatus, QDistinct> distinctByIsFinished() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFinished');
    });
  }

  QueryBuilder<GameStatus, GameStatus, QDistinct> distinctByNightCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nightCode');
    });
  }

  QueryBuilder<GameStatus, GameStatus, QDistinct>
      distinctByPlayersWhoSawTheirRole() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'playersWhoSawTheirRole');
    });
  }

  QueryBuilder<GameStatus, GameStatus, QDistinct>
      distinctByRemainedChancesForNightEnquiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remainedChancesForNightEnquiry');
    });
  }

  QueryBuilder<GameStatus, GameStatus, QDistinct>
      distinctByRemainedMafiasBullets() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remainedMafiasBullets');
    });
  }

  QueryBuilder<GameStatus, GameStatus, QDistinct> distinctBySituation(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'situation', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QDistinct> distinctByStatusOfGame(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'statusOfGame', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GameStatus, GameStatus, QDistinct> distinctByTimeLeft() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeLeft');
    });
  }

  QueryBuilder<GameStatus, GameStatus, QDistinct> distinctByUsedLastMoves() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usedLastMoves');
    });
  }

  QueryBuilder<GameStatus, GameStatus, QDistinct>
      distinctByWholeGameTimePassed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wholeGameTimePassed');
    });
  }

  QueryBuilder<GameStatus, GameStatus, QDistinct> distinctByWinner(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'winner', caseSensitive: caseSensitive);
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

  QueryBuilder<GameStatus, int, QQueryOperations> dayNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dayNumber');
    });
  }

  QueryBuilder<GameStatus, int, QQueryOperations> hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }

  QueryBuilder<GameStatus, bool?, QQueryOperations> isChaosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isChaos');
    });
  }

  QueryBuilder<GameStatus, bool, QQueryOperations> isDayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDay');
    });
  }

  QueryBuilder<GameStatus, bool?, QQueryOperations> isFinishedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFinished');
    });
  }

  QueryBuilder<GameStatus, int?, QQueryOperations> nightCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nightCode');
    });
  }

  QueryBuilder<GameStatus, List<String>?, QQueryOperations>
      playersWhoSawTheirRoleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'playersWhoSawTheirRole');
    });
  }

  QueryBuilder<GameStatus, int?, QQueryOperations>
      remainedChancesForNightEnquiryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remainedChancesForNightEnquiry');
    });
  }

  QueryBuilder<GameStatus, int?, QQueryOperations>
      remainedMafiasBulletsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remainedMafiasBullets');
    });
  }

  QueryBuilder<GameStatus, String?, QQueryOperations> situationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'situation');
    });
  }

  QueryBuilder<GameStatus, String?, QQueryOperations> statusOfGameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'statusOfGame');
    });
  }

  QueryBuilder<GameStatus, List<String>?, QQueryOperations> timeLeftProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeLeft');
    });
  }

  QueryBuilder<GameStatus, List<String?>?, QQueryOperations>
      usedLastMovesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usedLastMoves');
    });
  }

  QueryBuilder<GameStatus, int?, QQueryOperations>
      wholeGameTimePassedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wholeGameTimePassed');
    });
  }

  QueryBuilder<GameStatus, String?, QQueryOperations> winnerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'winner');
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
    r'godfatherChoice': PropertySchema(
      id: 0,
      name: r'godfatherChoice',
      type: IsarType.string,
    ),
    r'isNight': PropertySchema(
      id: 1,
      name: r'isNight',
      type: IsarType.bool,
    ),
    r'kaneChoice': PropertySchema(
      id: 2,
      name: r'kaneChoice',
      type: IsarType.string,
    ),
    r'konstantinChoice': PropertySchema(
      id: 3,
      name: r'konstantinChoice',
      type: IsarType.string,
    ),
    r'leonChoice': PropertySchema(
      id: 4,
      name: r'leonChoice',
      type: IsarType.string,
    ),
    r'mafiasShot': PropertySchema(
      id: 5,
      name: r'mafiasShot',
      type: IsarType.string,
    ),
    r'matadorChoice': PropertySchema(
      id: 6,
      name: r'matadorChoice',
      type: IsarType.string,
    ),
    r'nightNumber': PropertySchema(
      id: 7,
      name: r'nightNumber',
      type: IsarType.long,
    ),
    r'nightOfBlockage': PropertySchema(
      id: 8,
      name: r'nightOfBlockage',
      type: IsarType.string,
    ),
    r'nightOfRightChoiceOfKane': PropertySchema(
      id: 9,
      name: r'nightOfRightChoiceOfKane',
      type: IsarType.string,
    ),
    r'nostradamousChoices': PropertySchema(
      id: 10,
      name: r'nostradamousChoices',
      type: IsarType.stringList,
    ),
    r'playerNameWhoIsComingBack': PropertySchema(
      id: 11,
      name: r'playerNameWhoIsComingBack',
      type: IsarType.string,
    ),
    r'playersWaitingForDoingTheirNightJob': PropertySchema(
      id: 12,
      name: r'playersWaitingForDoingTheirNightJob',
      type: IsarType.stringList,
    ),
    r'saulChoice': PropertySchema(
      id: 13,
      name: r'saulChoice',
      type: IsarType.string,
    ),
    r'theRoleGuessedByGodfather': PropertySchema(
      id: 14,
      name: r'theRoleGuessedByGodfather',
      type: IsarType.string,
    ),
    r'watsonChoice': PropertySchema(
      id: 15,
      name: r'watsonChoice',
      type: IsarType.string,
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
  bytesCount += 3 + object.godfatherChoice.length * 3;
  bytesCount += 3 + object.kaneChoice.length * 3;
  bytesCount += 3 + object.konstantinChoice.length * 3;
  bytesCount += 3 + object.leonChoice.length * 3;
  bytesCount += 3 + object.mafiasShot.length * 3;
  bytesCount += 3 + object.matadorChoice.length * 3;
  bytesCount += 3 + object.nightOfBlockage.length * 3;
  bytesCount += 3 + object.nightOfRightChoiceOfKane.length * 3;
  bytesCount += 3 + object.nostradamousChoices.length * 3;
  {
    for (var i = 0; i < object.nostradamousChoices.length; i++) {
      final value = object.nostradamousChoices[i];
      bytesCount += value.length * 3;
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
  bytesCount += 3 + object.saulChoice.length * 3;
  bytesCount += 3 + object.theRoleGuessedByGodfather.length * 3;
  bytesCount += 3 + object.watsonChoice.length * 3;
  return bytesCount;
}

void _nightSerialize(
  Night object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.godfatherChoice);
  writer.writeBool(offsets[1], object.isNight);
  writer.writeString(offsets[2], object.kaneChoice);
  writer.writeString(offsets[3], object.konstantinChoice);
  writer.writeString(offsets[4], object.leonChoice);
  writer.writeString(offsets[5], object.mafiasShot);
  writer.writeString(offsets[6], object.matadorChoice);
  writer.writeLong(offsets[7], object.nightNumber);
  writer.writeString(offsets[8], object.nightOfBlockage);
  writer.writeString(offsets[9], object.nightOfRightChoiceOfKane);
  writer.writeStringList(offsets[10], object.nostradamousChoices);
  writer.writeString(offsets[11], object.playerNameWhoIsComingBack);
  writer.writeStringList(
      offsets[12], object.playersWaitingForDoingTheirNightJob);
  writer.writeString(offsets[13], object.saulChoice);
  writer.writeString(offsets[14], object.theRoleGuessedByGodfather);
  writer.writeString(offsets[15], object.watsonChoice);
}

Night _nightDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Night();
  object.godfatherChoice = reader.readString(offsets[0]);
  object.id = id;
  object.isNight = reader.readBool(offsets[1]);
  object.kaneChoice = reader.readString(offsets[2]);
  object.konstantinChoice = reader.readString(offsets[3]);
  object.leonChoice = reader.readString(offsets[4]);
  object.mafiasShot = reader.readString(offsets[5]);
  object.matadorChoice = reader.readString(offsets[6]);
  object.nightNumber = reader.readLong(offsets[7]);
  object.nightOfBlockage = reader.readString(offsets[8]);
  object.nightOfRightChoiceOfKane = reader.readString(offsets[9]);
  object.nostradamousChoices = reader.readStringList(offsets[10]) ?? [];
  object.playerNameWhoIsComingBack = reader.readStringOrNull(offsets[11]);
  object.playersWaitingForDoingTheirNightJob =
      reader.readStringList(offsets[12]);
  object.saulChoice = reader.readString(offsets[13]);
  object.theRoleGuessedByGodfather = reader.readString(offsets[14]);
  object.watsonChoice = reader.readString(offsets[15]);
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
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readStringList(offset) ?? []) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringList(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
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
  QueryBuilder<Night, Night, QAfterFilterCondition> godfatherChoiceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'godfatherChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> godfatherChoiceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'godfatherChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> godfatherChoiceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'godfatherChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> godfatherChoiceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'godfatherChoice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> godfatherChoiceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'godfatherChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> godfatherChoiceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'godfatherChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> godfatherChoiceContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'godfatherChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> godfatherChoiceMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'godfatherChoice',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> godfatherChoiceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'godfatherChoice',
        value: '',
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      godfatherChoiceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'godfatherChoice',
        value: '',
      ));
    });
  }

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

  QueryBuilder<Night, Night, QAfterFilterCondition> isNightEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isNight',
        value: value,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> kaneChoiceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kaneChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> kaneChoiceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'kaneChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> kaneChoiceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'kaneChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> kaneChoiceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'kaneChoice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> kaneChoiceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'kaneChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> kaneChoiceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'kaneChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> kaneChoiceContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'kaneChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> kaneChoiceMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'kaneChoice',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> kaneChoiceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kaneChoice',
        value: '',
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> kaneChoiceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'kaneChoice',
        value: '',
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> konstantinChoiceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'konstantinChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> konstantinChoiceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'konstantinChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> konstantinChoiceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'konstantinChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> konstantinChoiceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'konstantinChoice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> konstantinChoiceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'konstantinChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> konstantinChoiceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'konstantinChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> konstantinChoiceContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'konstantinChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> konstantinChoiceMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'konstantinChoice',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> konstantinChoiceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'konstantinChoice',
        value: '',
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      konstantinChoiceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'konstantinChoice',
        value: '',
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> leonChoiceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'leonChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> leonChoiceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'leonChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> leonChoiceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'leonChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> leonChoiceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'leonChoice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> leonChoiceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'leonChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> leonChoiceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'leonChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> leonChoiceContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'leonChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> leonChoiceMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'leonChoice',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> leonChoiceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'leonChoice',
        value: '',
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> leonChoiceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'leonChoice',
        value: '',
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> mafiasShotEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mafiasShot',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> mafiasShotGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mafiasShot',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> mafiasShotLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mafiasShot',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> mafiasShotBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mafiasShot',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> mafiasShotStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mafiasShot',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> mafiasShotEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mafiasShot',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> mafiasShotContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mafiasShot',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> mafiasShotMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mafiasShot',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> mafiasShotIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mafiasShot',
        value: '',
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> mafiasShotIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mafiasShot',
        value: '',
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> matadorChoiceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'matadorChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> matadorChoiceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'matadorChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> matadorChoiceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'matadorChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> matadorChoiceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'matadorChoice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> matadorChoiceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'matadorChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> matadorChoiceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'matadorChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> matadorChoiceContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'matadorChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> matadorChoiceMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'matadorChoice',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> matadorChoiceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'matadorChoice',
        value: '',
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> matadorChoiceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'matadorChoice',
        value: '',
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

  QueryBuilder<Night, Night, QAfterFilterCondition> nightOfBlockageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nightOfBlockage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> nightOfBlockageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nightOfBlockage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> nightOfBlockageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nightOfBlockage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> nightOfBlockageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nightOfBlockage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> nightOfBlockageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nightOfBlockage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> nightOfBlockageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nightOfBlockage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> nightOfBlockageContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nightOfBlockage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> nightOfBlockageMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nightOfBlockage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> nightOfBlockageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nightOfBlockage',
        value: '',
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      nightOfBlockageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nightOfBlockage',
        value: '',
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      nightOfRightChoiceOfKaneEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nightOfRightChoiceOfKane',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      nightOfRightChoiceOfKaneGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nightOfRightChoiceOfKane',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      nightOfRightChoiceOfKaneLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nightOfRightChoiceOfKane',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      nightOfRightChoiceOfKaneBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nightOfRightChoiceOfKane',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      nightOfRightChoiceOfKaneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nightOfRightChoiceOfKane',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      nightOfRightChoiceOfKaneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nightOfRightChoiceOfKane',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      nightOfRightChoiceOfKaneContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nightOfRightChoiceOfKane',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      nightOfRightChoiceOfKaneMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nightOfRightChoiceOfKane',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      nightOfRightChoiceOfKaneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nightOfRightChoiceOfKane',
        value: '',
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      nightOfRightChoiceOfKaneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nightOfRightChoiceOfKane',
        value: '',
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      nostradamousChoicesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nostradamousChoices',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      nostradamousChoicesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nostradamousChoices',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      nostradamousChoicesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nostradamousChoices',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      nostradamousChoicesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nostradamousChoices',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      nostradamousChoicesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nostradamousChoices',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      nostradamousChoicesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nostradamousChoices',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      nostradamousChoicesElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nostradamousChoices',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      nostradamousChoicesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nostradamousChoices',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      nostradamousChoicesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nostradamousChoices',
        value: '',
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      nostradamousChoicesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nostradamousChoices',
        value: '',
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      nostradamousChoicesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nostradamousChoices',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      nostradamousChoicesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nostradamousChoices',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      nostradamousChoicesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nostradamousChoices',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      nostradamousChoicesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nostradamousChoices',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      nostradamousChoicesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nostradamousChoices',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      nostradamousChoicesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nostradamousChoices',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
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

  QueryBuilder<Night, Night, QAfterFilterCondition> saulChoiceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'saulChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> saulChoiceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'saulChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> saulChoiceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'saulChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> saulChoiceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'saulChoice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> saulChoiceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'saulChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> saulChoiceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'saulChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> saulChoiceContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'saulChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> saulChoiceMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'saulChoice',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> saulChoiceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'saulChoice',
        value: '',
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> saulChoiceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'saulChoice',
        value: '',
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      theRoleGuessedByGodfatherEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'theRoleGuessedByGodfather',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      theRoleGuessedByGodfatherGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'theRoleGuessedByGodfather',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      theRoleGuessedByGodfatherLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'theRoleGuessedByGodfather',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      theRoleGuessedByGodfatherBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'theRoleGuessedByGodfather',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      theRoleGuessedByGodfatherStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'theRoleGuessedByGodfather',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      theRoleGuessedByGodfatherEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'theRoleGuessedByGodfather',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      theRoleGuessedByGodfatherContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'theRoleGuessedByGodfather',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      theRoleGuessedByGodfatherMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'theRoleGuessedByGodfather',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      theRoleGuessedByGodfatherIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'theRoleGuessedByGodfather',
        value: '',
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition>
      theRoleGuessedByGodfatherIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'theRoleGuessedByGodfather',
        value: '',
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> watsonChoiceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'watsonChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> watsonChoiceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'watsonChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> watsonChoiceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'watsonChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> watsonChoiceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'watsonChoice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> watsonChoiceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'watsonChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> watsonChoiceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'watsonChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> watsonChoiceContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'watsonChoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> watsonChoiceMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'watsonChoice',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> watsonChoiceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'watsonChoice',
        value: '',
      ));
    });
  }

  QueryBuilder<Night, Night, QAfterFilterCondition> watsonChoiceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'watsonChoice',
        value: '',
      ));
    });
  }
}

extension NightQueryObject on QueryBuilder<Night, Night, QFilterCondition> {}

extension NightQueryLinks on QueryBuilder<Night, Night, QFilterCondition> {}

extension NightQuerySortBy on QueryBuilder<Night, Night, QSortBy> {
  QueryBuilder<Night, Night, QAfterSortBy> sortByGodfatherChoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'godfatherChoice', Sort.asc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> sortByGodfatherChoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'godfatherChoice', Sort.desc);
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

  QueryBuilder<Night, Night, QAfterSortBy> sortByKaneChoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kaneChoice', Sort.asc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> sortByKaneChoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kaneChoice', Sort.desc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> sortByKonstantinChoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'konstantinChoice', Sort.asc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> sortByKonstantinChoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'konstantinChoice', Sort.desc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> sortByLeonChoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leonChoice', Sort.asc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> sortByLeonChoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leonChoice', Sort.desc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> sortByMafiasShot() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mafiasShot', Sort.asc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> sortByMafiasShotDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mafiasShot', Sort.desc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> sortByMatadorChoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matadorChoice', Sort.asc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> sortByMatadorChoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matadorChoice', Sort.desc);
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

  QueryBuilder<Night, Night, QAfterSortBy> sortByNightOfBlockage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightOfBlockage', Sort.asc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> sortByNightOfBlockageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightOfBlockage', Sort.desc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> sortByNightOfRightChoiceOfKane() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightOfRightChoiceOfKane', Sort.asc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy>
      sortByNightOfRightChoiceOfKaneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightOfRightChoiceOfKane', Sort.desc);
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

  QueryBuilder<Night, Night, QAfterSortBy> sortBySaulChoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saulChoice', Sort.asc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> sortBySaulChoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saulChoice', Sort.desc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> sortByTheRoleGuessedByGodfather() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theRoleGuessedByGodfather', Sort.asc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy>
      sortByTheRoleGuessedByGodfatherDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theRoleGuessedByGodfather', Sort.desc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> sortByWatsonChoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'watsonChoice', Sort.asc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> sortByWatsonChoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'watsonChoice', Sort.desc);
    });
  }
}

extension NightQuerySortThenBy on QueryBuilder<Night, Night, QSortThenBy> {
  QueryBuilder<Night, Night, QAfterSortBy> thenByGodfatherChoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'godfatherChoice', Sort.asc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> thenByGodfatherChoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'godfatherChoice', Sort.desc);
    });
  }

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

  QueryBuilder<Night, Night, QAfterSortBy> thenByKaneChoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kaneChoice', Sort.asc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> thenByKaneChoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kaneChoice', Sort.desc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> thenByKonstantinChoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'konstantinChoice', Sort.asc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> thenByKonstantinChoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'konstantinChoice', Sort.desc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> thenByLeonChoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leonChoice', Sort.asc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> thenByLeonChoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leonChoice', Sort.desc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> thenByMafiasShot() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mafiasShot', Sort.asc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> thenByMafiasShotDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mafiasShot', Sort.desc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> thenByMatadorChoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matadorChoice', Sort.asc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> thenByMatadorChoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matadorChoice', Sort.desc);
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

  QueryBuilder<Night, Night, QAfterSortBy> thenByNightOfBlockage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightOfBlockage', Sort.asc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> thenByNightOfBlockageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightOfBlockage', Sort.desc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> thenByNightOfRightChoiceOfKane() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightOfRightChoiceOfKane', Sort.asc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy>
      thenByNightOfRightChoiceOfKaneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightOfRightChoiceOfKane', Sort.desc);
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

  QueryBuilder<Night, Night, QAfterSortBy> thenBySaulChoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saulChoice', Sort.asc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> thenBySaulChoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saulChoice', Sort.desc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> thenByTheRoleGuessedByGodfather() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theRoleGuessedByGodfather', Sort.asc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy>
      thenByTheRoleGuessedByGodfatherDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theRoleGuessedByGodfather', Sort.desc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> thenByWatsonChoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'watsonChoice', Sort.asc);
    });
  }

  QueryBuilder<Night, Night, QAfterSortBy> thenByWatsonChoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'watsonChoice', Sort.desc);
    });
  }
}

extension NightQueryWhereDistinct on QueryBuilder<Night, Night, QDistinct> {
  QueryBuilder<Night, Night, QDistinct> distinctByGodfatherChoice(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'godfatherChoice',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Night, Night, QDistinct> distinctByIsNight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isNight');
    });
  }

  QueryBuilder<Night, Night, QDistinct> distinctByKaneChoice(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'kaneChoice', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Night, Night, QDistinct> distinctByKonstantinChoice(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'konstantinChoice',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Night, Night, QDistinct> distinctByLeonChoice(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'leonChoice', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Night, Night, QDistinct> distinctByMafiasShot(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mafiasShot', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Night, Night, QDistinct> distinctByMatadorChoice(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'matadorChoice',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Night, Night, QDistinct> distinctByNightNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nightNumber');
    });
  }

  QueryBuilder<Night, Night, QDistinct> distinctByNightOfBlockage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nightOfBlockage',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Night, Night, QDistinct> distinctByNightOfRightChoiceOfKane(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nightOfRightChoiceOfKane',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Night, Night, QDistinct> distinctByNostradamousChoices() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nostradamousChoices');
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

  QueryBuilder<Night, Night, QDistinct> distinctBySaulChoice(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'saulChoice', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Night, Night, QDistinct> distinctByTheRoleGuessedByGodfather(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'theRoleGuessedByGodfather',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Night, Night, QDistinct> distinctByWatsonChoice(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'watsonChoice', caseSensitive: caseSensitive);
    });
  }
}

extension NightQueryProperty on QueryBuilder<Night, Night, QQueryProperty> {
  QueryBuilder<Night, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Night, String, QQueryOperations> godfatherChoiceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'godfatherChoice');
    });
  }

  QueryBuilder<Night, bool, QQueryOperations> isNightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isNight');
    });
  }

  QueryBuilder<Night, String, QQueryOperations> kaneChoiceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'kaneChoice');
    });
  }

  QueryBuilder<Night, String, QQueryOperations> konstantinChoiceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'konstantinChoice');
    });
  }

  QueryBuilder<Night, String, QQueryOperations> leonChoiceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'leonChoice');
    });
  }

  QueryBuilder<Night, String, QQueryOperations> mafiasShotProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mafiasShot');
    });
  }

  QueryBuilder<Night, String, QQueryOperations> matadorChoiceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'matadorChoice');
    });
  }

  QueryBuilder<Night, int, QQueryOperations> nightNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nightNumber');
    });
  }

  QueryBuilder<Night, String, QQueryOperations> nightOfBlockageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nightOfBlockage');
    });
  }

  QueryBuilder<Night, String, QQueryOperations>
      nightOfRightChoiceOfKaneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nightOfRightChoiceOfKane');
    });
  }

  QueryBuilder<Night, List<String>, QQueryOperations>
      nostradamousChoicesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nostradamousChoices');
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

  QueryBuilder<Night, String, QQueryOperations> saulChoiceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'saulChoice');
    });
  }

  QueryBuilder<Night, String, QQueryOperations>
      theRoleGuessedByGodfatherProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'theRoleGuessedByGodfather');
    });
  }

  QueryBuilder<Night, String, QQueryOperations> watsonChoiceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'watsonChoice');
    });
  }
}
