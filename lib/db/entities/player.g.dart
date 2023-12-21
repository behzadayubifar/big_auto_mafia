// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPlayerCollection on Isar {
  IsarCollection<Player> get players => this.collection();
}

const PlayerSchema = CollectionSchema(
  name: r'Player',
  id: -1052842935974721688,
  properties: {
    r'code': PropertySchema(
      id: 0,
      name: r'code',
      type: IsarType.long,
    ),
    r'description': PropertySchema(
      id: 1,
      name: r'description',
      type: IsarType.string,
    ),
    r'disclosured': PropertySchema(
      id: 2,
      name: r'disclosured',
      type: IsarType.bool,
    ),
    r'handCuffed': PropertySchema(
      id: 3,
      name: r'handCuffed',
      type: IsarType.bool,
    ),
    r'hasBuyed': PropertySchema(
      id: 4,
      name: r'hasBuyed',
      type: IsarType.bool,
    ),
    r'hasGussed': PropertySchema(
      id: 5,
      name: r'hasGussed',
      type: IsarType.bool,
    ),
    r'hasReturned': PropertySchema(
      id: 6,
      name: r'hasReturned',
      type: IsarType.bool,
    ),
    r'heart': PropertySchema(
      id: 7,
      name: r'heart',
      type: IsarType.long,
    ),
    r'isBlocked': PropertySchema(
      id: 8,
      name: r'isBlocked',
      type: IsarType.bool,
    ),
    r'isReversible': PropertySchema(
      id: 9,
      name: r'isReversible',
      type: IsarType.bool,
    ),
    r'isSaved': PropertySchema(
      id: 10,
      name: r'isSaved',
      type: IsarType.bool,
    ),
    r'isSavedOnce': PropertySchema(
      id: 11,
      name: r'isSavedOnce',
      type: IsarType.bool,
    ),
    r'isShot': PropertySchema(
      id: 12,
      name: r'isShot',
      type: IsarType.bool,
    ),
    r'nightDone': PropertySchema(
      id: 13,
      name: r'nightDone',
      type: IsarType.bool,
    ),
    r'playerName': PropertySchema(
      id: 14,
      name: r'playerName',
      type: IsarType.string,
    ),
    r'roleName': PropertySchema(
      id: 15,
      name: r'roleName',
      type: IsarType.string,
    ),
    r'shotCount': PropertySchema(
      id: 16,
      name: r'shotCount',
      type: IsarType.long,
    ),
    r'type': PropertySchema(
      id: 17,
      name: r'type',
      type: IsarType.int,
      enumMap: _PlayertypeEnumValueMap,
    ),
    r'whichSideWillWin': PropertySchema(
      id: 18,
      name: r'whichSideWillWin',
      type: IsarType.int,
      enumMap: _PlayerwhichSideWillWinEnumValueMap,
    )
  },
  estimateSize: _playerEstimateSize,
  serialize: _playerSerialize,
  deserialize: _playerDeserialize,
  deserializeProp: _playerDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _playerGetId,
  getLinks: _playerGetLinks,
  attach: _playerAttach,
  version: '3.1.0+1',
);

int _playerEstimateSize(
  Player object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.playerName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.roleName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _playerSerialize(
  Player object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.code);
  writer.writeString(offsets[1], object.description);
  writer.writeBool(offsets[2], object.disclosured);
  writer.writeBool(offsets[3], object.handCuffed);
  writer.writeBool(offsets[4], object.hasBuyed);
  writer.writeBool(offsets[5], object.hasGussed);
  writer.writeBool(offsets[6], object.hasReturned);
  writer.writeLong(offsets[7], object.heart);
  writer.writeBool(offsets[8], object.isBlocked);
  writer.writeBool(offsets[9], object.isReversible);
  writer.writeBool(offsets[10], object.isSaved);
  writer.writeBool(offsets[11], object.isSavedOnce);
  writer.writeBool(offsets[12], object.isShot);
  writer.writeBool(offsets[13], object.nightDone);
  writer.writeString(offsets[14], object.playerName);
  writer.writeString(offsets[15], object.roleName);
  writer.writeLong(offsets[16], object.shotCount);
  writer.writeInt(offsets[17], object.type?.index);
  writer.writeInt(offsets[18], object.whichSideWillWin?.index);
}

Player _playerDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Player();
  object.code = reader.readLongOrNull(offsets[0]);
  object.description = reader.readStringOrNull(offsets[1]);
  object.disclosured = reader.readBool(offsets[2]);
  object.handCuffed = reader.readBool(offsets[3]);
  object.hasBuyed = reader.readBoolOrNull(offsets[4]);
  object.hasGussed = reader.readBool(offsets[5]);
  object.hasReturned = reader.readBool(offsets[6]);
  object.heart = reader.readLongOrNull(offsets[7]);
  object.id = id;
  object.isBlocked = reader.readBool(offsets[8]);
  object.isReversible = reader.readBool(offsets[9]);
  object.isSaved = reader.readBool(offsets[10]);
  object.isSavedOnce = reader.readBool(offsets[11]);
  object.isShot = reader.readBool(offsets[12]);
  object.nightDone = reader.readBool(offsets[13]);
  object.playerName = reader.readStringOrNull(offsets[14]);
  object.roleName = reader.readStringOrNull(offsets[15]);
  object.shotCount = reader.readLong(offsets[16]);
  object.type = _PlayertypeValueEnumMap[reader.readIntOrNull(offsets[17])];
  object.whichSideWillWin =
      _PlayerwhichSideWillWinValueEnumMap[reader.readIntOrNull(offsets[18])];
  return object;
}

P _playerDeserializeProp<P>(
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
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readBool(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readLong(offset)) as P;
    case 17:
      return (_PlayertypeValueEnumMap[reader.readIntOrNull(offset)]) as P;
    case 18:
      return (_PlayerwhichSideWillWinValueEnumMap[reader.readIntOrNull(offset)])
          as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _PlayertypeEnumValueMap = {
  'citizen': 0,
  'mafia': 1,
  'independent': 2,
};
const _PlayertypeValueEnumMap = {
  0: RoleType.citizen,
  1: RoleType.mafia,
  2: RoleType.independent,
};
const _PlayerwhichSideWillWinEnumValueMap = {
  'citizen': 0,
  'mafia': 1,
  'independent': 2,
};
const _PlayerwhichSideWillWinValueEnumMap = {
  0: RoleType.citizen,
  1: RoleType.mafia,
  2: RoleType.independent,
};

Id _playerGetId(Player object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _playerGetLinks(Player object) {
  return [];
}

void _playerAttach(IsarCollection<dynamic> col, Id id, Player object) {
  object.id = id;
}

extension PlayerQueryWhereSort on QueryBuilder<Player, Player, QWhere> {
  QueryBuilder<Player, Player, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PlayerQueryWhere on QueryBuilder<Player, Player, QWhereClause> {
  QueryBuilder<Player, Player, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Player, Player, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterWhereClause> idBetween(
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

extension PlayerQueryFilter on QueryBuilder<Player, Player, QFilterCondition> {
  QueryBuilder<Player, Player, QAfterFilterCondition> codeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'code',
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> codeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'code',
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> codeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> codeGreaterThan(
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

  QueryBuilder<Player, Player, QAfterFilterCondition> codeLessThan(
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

  QueryBuilder<Player, Player, QAfterFilterCondition> codeBetween(
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

  QueryBuilder<Player, Player, QAfterFilterCondition> descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> disclosuredEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'disclosured',
        value: value,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> handCuffedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'handCuffed',
        value: value,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> hasBuyedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hasBuyed',
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> hasBuyedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hasBuyed',
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> hasBuyedEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasBuyed',
        value: value,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> hasGussedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasGussed',
        value: value,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> hasReturnedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasReturned',
        value: value,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> heartIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'heart',
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> heartIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'heart',
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> heartEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'heart',
        value: value,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> heartGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'heart',
        value: value,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> heartLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'heart',
        value: value,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> heartBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'heart',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Player, Player, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Player, Player, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Player, Player, QAfterFilterCondition> isBlockedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isBlocked',
        value: value,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> isReversibleEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isReversible',
        value: value,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> isSavedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSaved',
        value: value,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> isSavedOnceEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSavedOnce',
        value: value,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> isShotEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isShot',
        value: value,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> nightDoneEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nightDone',
        value: value,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> playerNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'playerName',
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> playerNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'playerName',
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> playerNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'playerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> playerNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'playerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> playerNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'playerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> playerNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'playerName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> playerNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'playerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> playerNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'playerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> playerNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'playerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> playerNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'playerName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> playerNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'playerName',
        value: '',
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> playerNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'playerName',
        value: '',
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> roleNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'roleName',
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> roleNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'roleName',
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> roleNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> roleNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'roleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> roleNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'roleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> roleNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'roleName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> roleNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'roleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> roleNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'roleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> roleNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'roleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> roleNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'roleName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> roleNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roleName',
        value: '',
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> roleNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'roleName',
        value: '',
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> shotCountEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shotCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> shotCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'shotCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> shotCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'shotCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> shotCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'shotCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> typeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> typeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> typeEqualTo(
      RoleType? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> typeGreaterThan(
    RoleType? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> typeLessThan(
    RoleType? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> typeBetween(
    RoleType? lower,
    RoleType? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> whichSideWillWinIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'whichSideWillWin',
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition>
      whichSideWillWinIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'whichSideWillWin',
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> whichSideWillWinEqualTo(
      RoleType? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'whichSideWillWin',
        value: value,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition>
      whichSideWillWinGreaterThan(
    RoleType? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'whichSideWillWin',
        value: value,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> whichSideWillWinLessThan(
    RoleType? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'whichSideWillWin',
        value: value,
      ));
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> whichSideWillWinBetween(
    RoleType? lower,
    RoleType? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'whichSideWillWin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PlayerQueryObject on QueryBuilder<Player, Player, QFilterCondition> {}

extension PlayerQueryLinks on QueryBuilder<Player, Player, QFilterCondition> {}

extension PlayerQuerySortBy on QueryBuilder<Player, Player, QSortBy> {
  QueryBuilder<Player, Player, QAfterSortBy> sortByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByDisclosured() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disclosured', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByDisclosuredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disclosured', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByHandCuffed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handCuffed', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByHandCuffedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handCuffed', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByHasBuyed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasBuyed', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByHasBuyedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasBuyed', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByHasGussed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasGussed', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByHasGussedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasGussed', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByHasReturned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasReturned', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByHasReturnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasReturned', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByHeart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'heart', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByHeartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'heart', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByIsBlocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBlocked', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByIsBlockedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBlocked', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByIsReversible() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReversible', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByIsReversibleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReversible', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByIsSaved() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSaved', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByIsSavedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSaved', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByIsSavedOnce() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSavedOnce', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByIsSavedOnceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSavedOnce', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByIsShot() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isShot', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByIsShotDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isShot', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByNightDone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightDone', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByNightDoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightDone', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByPlayerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerName', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByPlayerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerName', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByRoleName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roleName', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByRoleNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roleName', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByShotCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shotCount', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByShotCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shotCount', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByWhichSideWillWin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'whichSideWillWin', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByWhichSideWillWinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'whichSideWillWin', Sort.desc);
    });
  }
}

extension PlayerQuerySortThenBy on QueryBuilder<Player, Player, QSortThenBy> {
  QueryBuilder<Player, Player, QAfterSortBy> thenByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByDisclosured() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disclosured', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByDisclosuredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disclosured', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByHandCuffed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handCuffed', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByHandCuffedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handCuffed', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByHasBuyed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasBuyed', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByHasBuyedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasBuyed', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByHasGussed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasGussed', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByHasGussedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasGussed', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByHasReturned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasReturned', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByHasReturnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasReturned', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByHeart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'heart', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByHeartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'heart', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByIsBlocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBlocked', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByIsBlockedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBlocked', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByIsReversible() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReversible', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByIsReversibleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReversible', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByIsSaved() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSaved', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByIsSavedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSaved', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByIsSavedOnce() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSavedOnce', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByIsSavedOnceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSavedOnce', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByIsShot() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isShot', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByIsShotDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isShot', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByNightDone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightDone', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByNightDoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightDone', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByPlayerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerName', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByPlayerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerName', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByRoleName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roleName', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByRoleNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roleName', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByShotCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shotCount', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByShotCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shotCount', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByWhichSideWillWin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'whichSideWillWin', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByWhichSideWillWinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'whichSideWillWin', Sort.desc);
    });
  }
}

extension PlayerQueryWhereDistinct on QueryBuilder<Player, Player, QDistinct> {
  QueryBuilder<Player, Player, QDistinct> distinctByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'code');
    });
  }

  QueryBuilder<Player, Player, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Player, Player, QDistinct> distinctByDisclosured() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'disclosured');
    });
  }

  QueryBuilder<Player, Player, QDistinct> distinctByHandCuffed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'handCuffed');
    });
  }

  QueryBuilder<Player, Player, QDistinct> distinctByHasBuyed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasBuyed');
    });
  }

  QueryBuilder<Player, Player, QDistinct> distinctByHasGussed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasGussed');
    });
  }

  QueryBuilder<Player, Player, QDistinct> distinctByHasReturned() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasReturned');
    });
  }

  QueryBuilder<Player, Player, QDistinct> distinctByHeart() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'heart');
    });
  }

  QueryBuilder<Player, Player, QDistinct> distinctByIsBlocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isBlocked');
    });
  }

  QueryBuilder<Player, Player, QDistinct> distinctByIsReversible() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isReversible');
    });
  }

  QueryBuilder<Player, Player, QDistinct> distinctByIsSaved() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSaved');
    });
  }

  QueryBuilder<Player, Player, QDistinct> distinctByIsSavedOnce() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSavedOnce');
    });
  }

  QueryBuilder<Player, Player, QDistinct> distinctByIsShot() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isShot');
    });
  }

  QueryBuilder<Player, Player, QDistinct> distinctByNightDone() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nightDone');
    });
  }

  QueryBuilder<Player, Player, QDistinct> distinctByPlayerName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'playerName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Player, Player, QDistinct> distinctByRoleName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'roleName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Player, Player, QDistinct> distinctByShotCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shotCount');
    });
  }

  QueryBuilder<Player, Player, QDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }

  QueryBuilder<Player, Player, QDistinct> distinctByWhichSideWillWin() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'whichSideWillWin');
    });
  }
}

extension PlayerQueryProperty on QueryBuilder<Player, Player, QQueryProperty> {
  QueryBuilder<Player, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Player, int?, QQueryOperations> codeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'code');
    });
  }

  QueryBuilder<Player, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<Player, bool, QQueryOperations> disclosuredProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'disclosured');
    });
  }

  QueryBuilder<Player, bool, QQueryOperations> handCuffedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'handCuffed');
    });
  }

  QueryBuilder<Player, bool?, QQueryOperations> hasBuyedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasBuyed');
    });
  }

  QueryBuilder<Player, bool, QQueryOperations> hasGussedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasGussed');
    });
  }

  QueryBuilder<Player, bool, QQueryOperations> hasReturnedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasReturned');
    });
  }

  QueryBuilder<Player, int?, QQueryOperations> heartProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'heart');
    });
  }

  QueryBuilder<Player, bool, QQueryOperations> isBlockedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isBlocked');
    });
  }

  QueryBuilder<Player, bool, QQueryOperations> isReversibleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isReversible');
    });
  }

  QueryBuilder<Player, bool, QQueryOperations> isSavedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSaved');
    });
  }

  QueryBuilder<Player, bool, QQueryOperations> isSavedOnceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSavedOnce');
    });
  }

  QueryBuilder<Player, bool, QQueryOperations> isShotProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isShot');
    });
  }

  QueryBuilder<Player, bool, QQueryOperations> nightDoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nightDone');
    });
  }

  QueryBuilder<Player, String?, QQueryOperations> playerNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'playerName');
    });
  }

  QueryBuilder<Player, String?, QQueryOperations> roleNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'roleName');
    });
  }

  QueryBuilder<Player, int, QQueryOperations> shotCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shotCount');
    });
  }

  QueryBuilder<Player, RoleType?, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<Player, RoleType?, QQueryOperations> whichSideWillWinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'whichSideWillWin');
    });
  }
}
