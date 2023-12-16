// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PseudoRoleSchema = Schema(
  name: r'PseudoRole',
  id: -4516417135192080676,
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
    r'heart': PropertySchema(
      id: 4,
      name: r'heart',
      type: IsarType.long,
    ),
    r'isBlocked': PropertySchema(
      id: 5,
      name: r'isBlocked',
      type: IsarType.bool,
    ),
    r'isReversible': PropertySchema(
      id: 6,
      name: r'isReversible',
      type: IsarType.bool,
    ),
    r'isSaved': PropertySchema(
      id: 7,
      name: r'isSaved',
      type: IsarType.bool,
    ),
    r'isShot': PropertySchema(
      id: 8,
      name: r'isShot',
      type: IsarType.bool,
    ),
    r'roleName': PropertySchema(
      id: 9,
      name: r'roleName',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 10,
      name: r'type',
      type: IsarType.int,
      enumMap: _PseudoRoletypeEnumValueMap,
    )
  },
  estimateSize: _pseudoRoleEstimateSize,
  serialize: _pseudoRoleSerialize,
  deserialize: _pseudoRoleDeserialize,
  deserializeProp: _pseudoRoleDeserializeProp,
);

int _pseudoRoleEstimateSize(
  PseudoRole object,
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
    final value = object.roleName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _pseudoRoleSerialize(
  PseudoRole object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.code);
  writer.writeString(offsets[1], object.description);
  writer.writeBool(offsets[2], object.disclosured);
  writer.writeBool(offsets[3], object.handCuffed);
  writer.writeLong(offsets[4], object.heart);
  writer.writeBool(offsets[5], object.isBlocked);
  writer.writeBool(offsets[6], object.isReversible);
  writer.writeBool(offsets[7], object.isSaved);
  writer.writeBool(offsets[8], object.isShot);
  writer.writeString(offsets[9], object.roleName);
  writer.writeInt(offsets[10], object.type?.index);
}

PseudoRole _pseudoRoleDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PseudoRole();
  object.code = reader.readLongOrNull(offsets[0]);
  object.description = reader.readStringOrNull(offsets[1]);
  object.disclosured = reader.readBool(offsets[2]);
  object.handCuffed = reader.readBool(offsets[3]);
  object.heart = reader.readLongOrNull(offsets[4]);
  object.isBlocked = reader.readBool(offsets[5]);
  object.isReversible = reader.readBool(offsets[6]);
  object.isSaved = reader.readBool(offsets[7]);
  object.isShot = reader.readBool(offsets[8]);
  object.roleName = reader.readStringOrNull(offsets[9]);
  object.type = _PseudoRoletypeValueEnumMap[reader.readIntOrNull(offsets[10])];
  return object;
}

P _pseudoRoleDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (_PseudoRoletypeValueEnumMap[reader.readIntOrNull(offset)]) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _PseudoRoletypeEnumValueMap = {
  'citizen': 0,
  'mafia': 1,
  'independent': 2,
};
const _PseudoRoletypeValueEnumMap = {
  0: RoleType.citizen,
  1: RoleType.mafia,
  2: RoleType.independent,
};

extension PseudoRoleQueryFilter
    on QueryBuilder<PseudoRole, PseudoRole, QFilterCondition> {
  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition> codeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'code',
      ));
    });
  }

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition> codeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'code',
      ));
    });
  }

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition> codeEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
      ));
    });
  }

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition> codeGreaterThan(
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

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition> codeLessThan(
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

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition> codeBetween(
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

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition>
      descriptionEqualTo(
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

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition>
      descriptionGreaterThan(
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

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition>
      descriptionLessThan(
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

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition>
      descriptionBetween(
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

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition>
      descriptionStartsWith(
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

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition>
      descriptionEndsWith(
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

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition>
      disclosuredEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'disclosured',
        value: value,
      ));
    });
  }

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition> handCuffedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'handCuffed',
        value: value,
      ));
    });
  }

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition> heartIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'heart',
      ));
    });
  }

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition> heartIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'heart',
      ));
    });
  }

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition> heartEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'heart',
        value: value,
      ));
    });
  }

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition> heartGreaterThan(
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

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition> heartLessThan(
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

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition> heartBetween(
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

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition> isBlockedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isBlocked',
        value: value,
      ));
    });
  }

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition>
      isReversibleEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isReversible',
        value: value,
      ));
    });
  }

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition> isSavedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSaved',
        value: value,
      ));
    });
  }

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition> isShotEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isShot',
        value: value,
      ));
    });
  }

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition> roleNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'roleName',
      ));
    });
  }

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition>
      roleNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'roleName',
      ));
    });
  }

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition> roleNameEqualTo(
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

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition>
      roleNameGreaterThan(
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

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition> roleNameLessThan(
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

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition> roleNameBetween(
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

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition>
      roleNameStartsWith(
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

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition> roleNameEndsWith(
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

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition> roleNameContains(
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

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition> roleNameMatches(
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

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition>
      roleNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roleName',
        value: '',
      ));
    });
  }

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition>
      roleNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'roleName',
        value: '',
      ));
    });
  }

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition> typeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition> typeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition> typeEqualTo(
      RoleType? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition> typeGreaterThan(
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

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition> typeLessThan(
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

  QueryBuilder<PseudoRole, PseudoRole, QAfterFilterCondition> typeBetween(
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
}

extension PseudoRoleQueryObject
    on QueryBuilder<PseudoRole, PseudoRole, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const CitizenSchema = Schema(
  name: r'Citizen',
  id: 1566771359842095468,
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
    r'heart': PropertySchema(
      id: 4,
      name: r'heart',
      type: IsarType.long,
    ),
    r'isBlocked': PropertySchema(
      id: 5,
      name: r'isBlocked',
      type: IsarType.bool,
    ),
    r'isReversible': PropertySchema(
      id: 6,
      name: r'isReversible',
      type: IsarType.bool,
    ),
    r'isSaved': PropertySchema(
      id: 7,
      name: r'isSaved',
      type: IsarType.bool,
    ),
    r'isShot': PropertySchema(
      id: 8,
      name: r'isShot',
      type: IsarType.bool,
    ),
    r'roleName': PropertySchema(
      id: 9,
      name: r'roleName',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 10,
      name: r'type',
      type: IsarType.int,
      enumMap: _CitizentypeEnumValueMap,
    )
  },
  estimateSize: _citizenEstimateSize,
  serialize: _citizenSerialize,
  deserialize: _citizenDeserialize,
  deserializeProp: _citizenDeserializeProp,
);

int _citizenEstimateSize(
  Citizen object,
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
    final value = object.roleName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _citizenSerialize(
  Citizen object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.code);
  writer.writeString(offsets[1], object.description);
  writer.writeBool(offsets[2], object.disclosured);
  writer.writeBool(offsets[3], object.handCuffed);
  writer.writeLong(offsets[4], object.heart);
  writer.writeBool(offsets[5], object.isBlocked);
  writer.writeBool(offsets[6], object.isReversible);
  writer.writeBool(offsets[7], object.isSaved);
  writer.writeBool(offsets[8], object.isShot);
  writer.writeString(offsets[9], object.roleName);
  writer.writeInt(offsets[10], object.type?.index);
}

Citizen _citizenDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Citizen();
  object.code = reader.readLongOrNull(offsets[0]);
  object.description = reader.readStringOrNull(offsets[1]);
  object.disclosured = reader.readBool(offsets[2]);
  object.handCuffed = reader.readBool(offsets[3]);
  object.heart = reader.readLongOrNull(offsets[4]);
  object.isBlocked = reader.readBool(offsets[5]);
  object.isReversible = reader.readBool(offsets[6]);
  object.isSaved = reader.readBool(offsets[7]);
  object.isShot = reader.readBool(offsets[8]);
  object.roleName = reader.readStringOrNull(offsets[9]);
  object.type = _CitizentypeValueEnumMap[reader.readIntOrNull(offsets[10])];
  return object;
}

P _citizenDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (_CitizentypeValueEnumMap[reader.readIntOrNull(offset)]) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _CitizentypeEnumValueMap = {
  'citizen': 0,
  'mafia': 1,
  'independent': 2,
};
const _CitizentypeValueEnumMap = {
  0: RoleType.citizen,
  1: RoleType.mafia,
  2: RoleType.independent,
};

extension CitizenQueryFilter
    on QueryBuilder<Citizen, Citizen, QFilterCondition> {
  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> codeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'code',
      ));
    });
  }

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> codeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'code',
      ));
    });
  }

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> codeEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
      ));
    });
  }

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> codeGreaterThan(
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

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> codeLessThan(
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

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> codeBetween(
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

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> descriptionEqualTo(
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

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> descriptionGreaterThan(
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

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> descriptionLessThan(
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

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> descriptionBetween(
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

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> descriptionStartsWith(
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

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> descriptionEndsWith(
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

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> descriptionContains(
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

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> descriptionMatches(
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

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> disclosuredEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'disclosured',
        value: value,
      ));
    });
  }

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> handCuffedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'handCuffed',
        value: value,
      ));
    });
  }

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> heartIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'heart',
      ));
    });
  }

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> heartIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'heart',
      ));
    });
  }

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> heartEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'heart',
        value: value,
      ));
    });
  }

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> heartGreaterThan(
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

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> heartLessThan(
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

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> heartBetween(
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

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> isBlockedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isBlocked',
        value: value,
      ));
    });
  }

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> isReversibleEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isReversible',
        value: value,
      ));
    });
  }

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> isSavedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSaved',
        value: value,
      ));
    });
  }

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> isShotEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isShot',
        value: value,
      ));
    });
  }

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> roleNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'roleName',
      ));
    });
  }

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> roleNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'roleName',
      ));
    });
  }

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> roleNameEqualTo(
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

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> roleNameGreaterThan(
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

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> roleNameLessThan(
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

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> roleNameBetween(
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

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> roleNameStartsWith(
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

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> roleNameEndsWith(
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

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> roleNameContains(
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

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> roleNameMatches(
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

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> roleNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roleName',
        value: '',
      ));
    });
  }

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> roleNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'roleName',
        value: '',
      ));
    });
  }

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> typeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> typeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> typeEqualTo(
      RoleType? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> typeGreaterThan(
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

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> typeLessThan(
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

  QueryBuilder<Citizen, Citizen, QAfterFilterCondition> typeBetween(
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
}

extension CitizenQueryObject
    on QueryBuilder<Citizen, Citizen, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const WatsonSchema = Schema(
  name: r'Watson',
  id: 1127077270288672902,
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
    r'heart': PropertySchema(
      id: 4,
      name: r'heart',
      type: IsarType.long,
    ),
    r'isBlocked': PropertySchema(
      id: 5,
      name: r'isBlocked',
      type: IsarType.bool,
    ),
    r'isReversible': PropertySchema(
      id: 6,
      name: r'isReversible',
      type: IsarType.bool,
    ),
    r'isSaved': PropertySchema(
      id: 7,
      name: r'isSaved',
      type: IsarType.bool,
    ),
    r'isSavedOnce': PropertySchema(
      id: 8,
      name: r'isSavedOnce',
      type: IsarType.bool,
    ),
    r'isShot': PropertySchema(
      id: 9,
      name: r'isShot',
      type: IsarType.bool,
    ),
    r'roleName': PropertySchema(
      id: 10,
      name: r'roleName',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 11,
      name: r'type',
      type: IsarType.int,
      enumMap: _WatsontypeEnumValueMap,
    )
  },
  estimateSize: _watsonEstimateSize,
  serialize: _watsonSerialize,
  deserialize: _watsonDeserialize,
  deserializeProp: _watsonDeserializeProp,
);

int _watsonEstimateSize(
  Watson object,
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
    final value = object.roleName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _watsonSerialize(
  Watson object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.code);
  writer.writeString(offsets[1], object.description);
  writer.writeBool(offsets[2], object.disclosured);
  writer.writeBool(offsets[3], object.handCuffed);
  writer.writeLong(offsets[4], object.heart);
  writer.writeBool(offsets[5], object.isBlocked);
  writer.writeBool(offsets[6], object.isReversible);
  writer.writeBool(offsets[7], object.isSaved);
  writer.writeBool(offsets[8], object.isSavedOnce);
  writer.writeBool(offsets[9], object.isShot);
  writer.writeString(offsets[10], object.roleName);
  writer.writeInt(offsets[11], object.type?.index);
}

Watson _watsonDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Watson();
  object.code = reader.readLongOrNull(offsets[0]);
  object.description = reader.readStringOrNull(offsets[1]);
  object.disclosured = reader.readBool(offsets[2]);
  object.handCuffed = reader.readBool(offsets[3]);
  object.heart = reader.readLongOrNull(offsets[4]);
  object.isBlocked = reader.readBool(offsets[5]);
  object.isReversible = reader.readBool(offsets[6]);
  object.isSaved = reader.readBool(offsets[7]);
  object.isSavedOnce = reader.readBool(offsets[8]);
  object.isShot = reader.readBool(offsets[9]);
  object.roleName = reader.readStringOrNull(offsets[10]);
  object.type = _WatsontypeValueEnumMap[reader.readIntOrNull(offsets[11])];
  return object;
}

P _watsonDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (_WatsontypeValueEnumMap[reader.readIntOrNull(offset)]) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _WatsontypeEnumValueMap = {
  'citizen': 0,
  'mafia': 1,
  'independent': 2,
};
const _WatsontypeValueEnumMap = {
  0: RoleType.citizen,
  1: RoleType.mafia,
  2: RoleType.independent,
};

extension WatsonQueryFilter on QueryBuilder<Watson, Watson, QFilterCondition> {
  QueryBuilder<Watson, Watson, QAfterFilterCondition> codeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'code',
      ));
    });
  }

  QueryBuilder<Watson, Watson, QAfterFilterCondition> codeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'code',
      ));
    });
  }

  QueryBuilder<Watson, Watson, QAfterFilterCondition> codeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
      ));
    });
  }

  QueryBuilder<Watson, Watson, QAfterFilterCondition> codeGreaterThan(
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

  QueryBuilder<Watson, Watson, QAfterFilterCondition> codeLessThan(
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

  QueryBuilder<Watson, Watson, QAfterFilterCondition> codeBetween(
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

  QueryBuilder<Watson, Watson, QAfterFilterCondition> descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Watson, Watson, QAfterFilterCondition> descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Watson, Watson, QAfterFilterCondition> descriptionEqualTo(
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

  QueryBuilder<Watson, Watson, QAfterFilterCondition> descriptionGreaterThan(
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

  QueryBuilder<Watson, Watson, QAfterFilterCondition> descriptionLessThan(
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

  QueryBuilder<Watson, Watson, QAfterFilterCondition> descriptionBetween(
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

  QueryBuilder<Watson, Watson, QAfterFilterCondition> descriptionStartsWith(
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

  QueryBuilder<Watson, Watson, QAfterFilterCondition> descriptionEndsWith(
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

  QueryBuilder<Watson, Watson, QAfterFilterCondition> descriptionContains(
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

  QueryBuilder<Watson, Watson, QAfterFilterCondition> descriptionMatches(
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

  QueryBuilder<Watson, Watson, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Watson, Watson, QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Watson, Watson, QAfterFilterCondition> disclosuredEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'disclosured',
        value: value,
      ));
    });
  }

  QueryBuilder<Watson, Watson, QAfterFilterCondition> handCuffedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'handCuffed',
        value: value,
      ));
    });
  }

  QueryBuilder<Watson, Watson, QAfterFilterCondition> heartIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'heart',
      ));
    });
  }

  QueryBuilder<Watson, Watson, QAfterFilterCondition> heartIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'heart',
      ));
    });
  }

  QueryBuilder<Watson, Watson, QAfterFilterCondition> heartEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'heart',
        value: value,
      ));
    });
  }

  QueryBuilder<Watson, Watson, QAfterFilterCondition> heartGreaterThan(
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

  QueryBuilder<Watson, Watson, QAfterFilterCondition> heartLessThan(
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

  QueryBuilder<Watson, Watson, QAfterFilterCondition> heartBetween(
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

  QueryBuilder<Watson, Watson, QAfterFilterCondition> isBlockedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isBlocked',
        value: value,
      ));
    });
  }

  QueryBuilder<Watson, Watson, QAfterFilterCondition> isReversibleEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isReversible',
        value: value,
      ));
    });
  }

  QueryBuilder<Watson, Watson, QAfterFilterCondition> isSavedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSaved',
        value: value,
      ));
    });
  }

  QueryBuilder<Watson, Watson, QAfterFilterCondition> isSavedOnceEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSavedOnce',
        value: value,
      ));
    });
  }

  QueryBuilder<Watson, Watson, QAfterFilterCondition> isShotEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isShot',
        value: value,
      ));
    });
  }

  QueryBuilder<Watson, Watson, QAfterFilterCondition> roleNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'roleName',
      ));
    });
  }

  QueryBuilder<Watson, Watson, QAfterFilterCondition> roleNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'roleName',
      ));
    });
  }

  QueryBuilder<Watson, Watson, QAfterFilterCondition> roleNameEqualTo(
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

  QueryBuilder<Watson, Watson, QAfterFilterCondition> roleNameGreaterThan(
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

  QueryBuilder<Watson, Watson, QAfterFilterCondition> roleNameLessThan(
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

  QueryBuilder<Watson, Watson, QAfterFilterCondition> roleNameBetween(
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

  QueryBuilder<Watson, Watson, QAfterFilterCondition> roleNameStartsWith(
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

  QueryBuilder<Watson, Watson, QAfterFilterCondition> roleNameEndsWith(
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

  QueryBuilder<Watson, Watson, QAfterFilterCondition> roleNameContains(
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

  QueryBuilder<Watson, Watson, QAfterFilterCondition> roleNameMatches(
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

  QueryBuilder<Watson, Watson, QAfterFilterCondition> roleNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roleName',
        value: '',
      ));
    });
  }

  QueryBuilder<Watson, Watson, QAfterFilterCondition> roleNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'roleName',
        value: '',
      ));
    });
  }

  QueryBuilder<Watson, Watson, QAfterFilterCondition> typeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<Watson, Watson, QAfterFilterCondition> typeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<Watson, Watson, QAfterFilterCondition> typeEqualTo(
      RoleType? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Watson, Watson, QAfterFilterCondition> typeGreaterThan(
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

  QueryBuilder<Watson, Watson, QAfterFilterCondition> typeLessThan(
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

  QueryBuilder<Watson, Watson, QAfterFilterCondition> typeBetween(
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
}

extension WatsonQueryObject on QueryBuilder<Watson, Watson, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const LeonSchema = Schema(
  name: r'Leon',
  id: 6757263950920560475,
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
    r'heart': PropertySchema(
      id: 4,
      name: r'heart',
      type: IsarType.long,
    ),
    r'isBlocked': PropertySchema(
      id: 5,
      name: r'isBlocked',
      type: IsarType.bool,
    ),
    r'isReversible': PropertySchema(
      id: 6,
      name: r'isReversible',
      type: IsarType.bool,
    ),
    r'isSaved': PropertySchema(
      id: 7,
      name: r'isSaved',
      type: IsarType.bool,
    ),
    r'isShot': PropertySchema(
      id: 8,
      name: r'isShot',
      type: IsarType.bool,
    ),
    r'roleName': PropertySchema(
      id: 9,
      name: r'roleName',
      type: IsarType.string,
    ),
    r'shotCount': PropertySchema(
      id: 10,
      name: r'shotCount',
      type: IsarType.long,
    ),
    r'type': PropertySchema(
      id: 11,
      name: r'type',
      type: IsarType.int,
      enumMap: _LeontypeEnumValueMap,
    )
  },
  estimateSize: _leonEstimateSize,
  serialize: _leonSerialize,
  deserialize: _leonDeserialize,
  deserializeProp: _leonDeserializeProp,
);

int _leonEstimateSize(
  Leon object,
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
    final value = object.roleName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _leonSerialize(
  Leon object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.code);
  writer.writeString(offsets[1], object.description);
  writer.writeBool(offsets[2], object.disclosured);
  writer.writeBool(offsets[3], object.handCuffed);
  writer.writeLong(offsets[4], object.heart);
  writer.writeBool(offsets[5], object.isBlocked);
  writer.writeBool(offsets[6], object.isReversible);
  writer.writeBool(offsets[7], object.isSaved);
  writer.writeBool(offsets[8], object.isShot);
  writer.writeString(offsets[9], object.roleName);
  writer.writeLong(offsets[10], object.shotCount);
  writer.writeInt(offsets[11], object.type?.index);
}

Leon _leonDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Leon();
  object.code = reader.readLongOrNull(offsets[0]);
  object.description = reader.readStringOrNull(offsets[1]);
  object.disclosured = reader.readBool(offsets[2]);
  object.handCuffed = reader.readBool(offsets[3]);
  object.heart = reader.readLongOrNull(offsets[4]);
  object.isBlocked = reader.readBool(offsets[5]);
  object.isReversible = reader.readBool(offsets[6]);
  object.isSaved = reader.readBool(offsets[7]);
  object.isShot = reader.readBool(offsets[8]);
  object.roleName = reader.readStringOrNull(offsets[9]);
  object.shotCount = reader.readLong(offsets[10]);
  object.type = _LeontypeValueEnumMap[reader.readIntOrNull(offsets[11])];
  return object;
}

P _leonDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (_LeontypeValueEnumMap[reader.readIntOrNull(offset)]) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _LeontypeEnumValueMap = {
  'citizen': 0,
  'mafia': 1,
  'independent': 2,
};
const _LeontypeValueEnumMap = {
  0: RoleType.citizen,
  1: RoleType.mafia,
  2: RoleType.independent,
};

extension LeonQueryFilter on QueryBuilder<Leon, Leon, QFilterCondition> {
  QueryBuilder<Leon, Leon, QAfterFilterCondition> codeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'code',
      ));
    });
  }

  QueryBuilder<Leon, Leon, QAfterFilterCondition> codeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'code',
      ));
    });
  }

  QueryBuilder<Leon, Leon, QAfterFilterCondition> codeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
      ));
    });
  }

  QueryBuilder<Leon, Leon, QAfterFilterCondition> codeGreaterThan(
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

  QueryBuilder<Leon, Leon, QAfterFilterCondition> codeLessThan(
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

  QueryBuilder<Leon, Leon, QAfterFilterCondition> codeBetween(
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

  QueryBuilder<Leon, Leon, QAfterFilterCondition> descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Leon, Leon, QAfterFilterCondition> descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Leon, Leon, QAfterFilterCondition> descriptionEqualTo(
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

  QueryBuilder<Leon, Leon, QAfterFilterCondition> descriptionGreaterThan(
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

  QueryBuilder<Leon, Leon, QAfterFilterCondition> descriptionLessThan(
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

  QueryBuilder<Leon, Leon, QAfterFilterCondition> descriptionBetween(
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

  QueryBuilder<Leon, Leon, QAfterFilterCondition> descriptionStartsWith(
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

  QueryBuilder<Leon, Leon, QAfterFilterCondition> descriptionEndsWith(
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

  QueryBuilder<Leon, Leon, QAfterFilterCondition> descriptionContains(
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

  QueryBuilder<Leon, Leon, QAfterFilterCondition> descriptionMatches(
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

  QueryBuilder<Leon, Leon, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Leon, Leon, QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Leon, Leon, QAfterFilterCondition> disclosuredEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'disclosured',
        value: value,
      ));
    });
  }

  QueryBuilder<Leon, Leon, QAfterFilterCondition> handCuffedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'handCuffed',
        value: value,
      ));
    });
  }

  QueryBuilder<Leon, Leon, QAfterFilterCondition> heartIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'heart',
      ));
    });
  }

  QueryBuilder<Leon, Leon, QAfterFilterCondition> heartIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'heart',
      ));
    });
  }

  QueryBuilder<Leon, Leon, QAfterFilterCondition> heartEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'heart',
        value: value,
      ));
    });
  }

  QueryBuilder<Leon, Leon, QAfterFilterCondition> heartGreaterThan(
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

  QueryBuilder<Leon, Leon, QAfterFilterCondition> heartLessThan(
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

  QueryBuilder<Leon, Leon, QAfterFilterCondition> heartBetween(
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

  QueryBuilder<Leon, Leon, QAfterFilterCondition> isBlockedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isBlocked',
        value: value,
      ));
    });
  }

  QueryBuilder<Leon, Leon, QAfterFilterCondition> isReversibleEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isReversible',
        value: value,
      ));
    });
  }

  QueryBuilder<Leon, Leon, QAfterFilterCondition> isSavedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSaved',
        value: value,
      ));
    });
  }

  QueryBuilder<Leon, Leon, QAfterFilterCondition> isShotEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isShot',
        value: value,
      ));
    });
  }

  QueryBuilder<Leon, Leon, QAfterFilterCondition> roleNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'roleName',
      ));
    });
  }

  QueryBuilder<Leon, Leon, QAfterFilterCondition> roleNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'roleName',
      ));
    });
  }

  QueryBuilder<Leon, Leon, QAfterFilterCondition> roleNameEqualTo(
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

  QueryBuilder<Leon, Leon, QAfterFilterCondition> roleNameGreaterThan(
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

  QueryBuilder<Leon, Leon, QAfterFilterCondition> roleNameLessThan(
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

  QueryBuilder<Leon, Leon, QAfterFilterCondition> roleNameBetween(
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

  QueryBuilder<Leon, Leon, QAfterFilterCondition> roleNameStartsWith(
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

  QueryBuilder<Leon, Leon, QAfterFilterCondition> roleNameEndsWith(
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

  QueryBuilder<Leon, Leon, QAfterFilterCondition> roleNameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'roleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Leon, Leon, QAfterFilterCondition> roleNameMatches(
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

  QueryBuilder<Leon, Leon, QAfterFilterCondition> roleNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roleName',
        value: '',
      ));
    });
  }

  QueryBuilder<Leon, Leon, QAfterFilterCondition> roleNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'roleName',
        value: '',
      ));
    });
  }

  QueryBuilder<Leon, Leon, QAfterFilterCondition> shotCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shotCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Leon, Leon, QAfterFilterCondition> shotCountGreaterThan(
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

  QueryBuilder<Leon, Leon, QAfterFilterCondition> shotCountLessThan(
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

  QueryBuilder<Leon, Leon, QAfterFilterCondition> shotCountBetween(
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

  QueryBuilder<Leon, Leon, QAfterFilterCondition> typeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<Leon, Leon, QAfterFilterCondition> typeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<Leon, Leon, QAfterFilterCondition> typeEqualTo(RoleType? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Leon, Leon, QAfterFilterCondition> typeGreaterThan(
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

  QueryBuilder<Leon, Leon, QAfterFilterCondition> typeLessThan(
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

  QueryBuilder<Leon, Leon, QAfterFilterCondition> typeBetween(
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
}

extension LeonQueryObject on QueryBuilder<Leon, Leon, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const KaneSchema = Schema(
  name: r'Kane',
  id: -112001306032362134,
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
    r'hasGuessed': PropertySchema(
      id: 4,
      name: r'hasGuessed',
      type: IsarType.bool,
    ),
    r'heart': PropertySchema(
      id: 5,
      name: r'heart',
      type: IsarType.long,
    ),
    r'isBlocked': PropertySchema(
      id: 6,
      name: r'isBlocked',
      type: IsarType.bool,
    ),
    r'isReversible': PropertySchema(
      id: 7,
      name: r'isReversible',
      type: IsarType.bool,
    ),
    r'isSaved': PropertySchema(
      id: 8,
      name: r'isSaved',
      type: IsarType.bool,
    ),
    r'isShot': PropertySchema(
      id: 9,
      name: r'isShot',
      type: IsarType.bool,
    ),
    r'roleName': PropertySchema(
      id: 10,
      name: r'roleName',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 11,
      name: r'type',
      type: IsarType.int,
      enumMap: _KanetypeEnumValueMap,
    )
  },
  estimateSize: _kaneEstimateSize,
  serialize: _kaneSerialize,
  deserialize: _kaneDeserialize,
  deserializeProp: _kaneDeserializeProp,
);

int _kaneEstimateSize(
  Kane object,
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
    final value = object.roleName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _kaneSerialize(
  Kane object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.code);
  writer.writeString(offsets[1], object.description);
  writer.writeBool(offsets[2], object.disclosured);
  writer.writeBool(offsets[3], object.handCuffed);
  writer.writeBool(offsets[4], object.hasGuessed);
  writer.writeLong(offsets[5], object.heart);
  writer.writeBool(offsets[6], object.isBlocked);
  writer.writeBool(offsets[7], object.isReversible);
  writer.writeBool(offsets[8], object.isSaved);
  writer.writeBool(offsets[9], object.isShot);
  writer.writeString(offsets[10], object.roleName);
  writer.writeInt(offsets[11], object.type?.index);
}

Kane _kaneDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Kane();
  object.code = reader.readLongOrNull(offsets[0]);
  object.description = reader.readStringOrNull(offsets[1]);
  object.disclosured = reader.readBool(offsets[2]);
  object.handCuffed = reader.readBool(offsets[3]);
  object.hasGuessed = reader.readBoolOrNull(offsets[4]);
  object.heart = reader.readLongOrNull(offsets[5]);
  object.isBlocked = reader.readBool(offsets[6]);
  object.isReversible = reader.readBool(offsets[7]);
  object.isSaved = reader.readBool(offsets[8]);
  object.isShot = reader.readBool(offsets[9]);
  object.roleName = reader.readStringOrNull(offsets[10]);
  object.type = _KanetypeValueEnumMap[reader.readIntOrNull(offsets[11])];
  return object;
}

P _kaneDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (_KanetypeValueEnumMap[reader.readIntOrNull(offset)]) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _KanetypeEnumValueMap = {
  'citizen': 0,
  'mafia': 1,
  'independent': 2,
};
const _KanetypeValueEnumMap = {
  0: RoleType.citizen,
  1: RoleType.mafia,
  2: RoleType.independent,
};

extension KaneQueryFilter on QueryBuilder<Kane, Kane, QFilterCondition> {
  QueryBuilder<Kane, Kane, QAfterFilterCondition> codeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'code',
      ));
    });
  }

  QueryBuilder<Kane, Kane, QAfterFilterCondition> codeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'code',
      ));
    });
  }

  QueryBuilder<Kane, Kane, QAfterFilterCondition> codeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
      ));
    });
  }

  QueryBuilder<Kane, Kane, QAfterFilterCondition> codeGreaterThan(
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

  QueryBuilder<Kane, Kane, QAfterFilterCondition> codeLessThan(
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

  QueryBuilder<Kane, Kane, QAfterFilterCondition> codeBetween(
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

  QueryBuilder<Kane, Kane, QAfterFilterCondition> descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Kane, Kane, QAfterFilterCondition> descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Kane, Kane, QAfterFilterCondition> descriptionEqualTo(
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

  QueryBuilder<Kane, Kane, QAfterFilterCondition> descriptionGreaterThan(
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

  QueryBuilder<Kane, Kane, QAfterFilterCondition> descriptionLessThan(
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

  QueryBuilder<Kane, Kane, QAfterFilterCondition> descriptionBetween(
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

  QueryBuilder<Kane, Kane, QAfterFilterCondition> descriptionStartsWith(
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

  QueryBuilder<Kane, Kane, QAfterFilterCondition> descriptionEndsWith(
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

  QueryBuilder<Kane, Kane, QAfterFilterCondition> descriptionContains(
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

  QueryBuilder<Kane, Kane, QAfterFilterCondition> descriptionMatches(
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

  QueryBuilder<Kane, Kane, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Kane, Kane, QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Kane, Kane, QAfterFilterCondition> disclosuredEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'disclosured',
        value: value,
      ));
    });
  }

  QueryBuilder<Kane, Kane, QAfterFilterCondition> handCuffedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'handCuffed',
        value: value,
      ));
    });
  }

  QueryBuilder<Kane, Kane, QAfterFilterCondition> hasGuessedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hasGuessed',
      ));
    });
  }

  QueryBuilder<Kane, Kane, QAfterFilterCondition> hasGuessedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hasGuessed',
      ));
    });
  }

  QueryBuilder<Kane, Kane, QAfterFilterCondition> hasGuessedEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasGuessed',
        value: value,
      ));
    });
  }

  QueryBuilder<Kane, Kane, QAfterFilterCondition> heartIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'heart',
      ));
    });
  }

  QueryBuilder<Kane, Kane, QAfterFilterCondition> heartIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'heart',
      ));
    });
  }

  QueryBuilder<Kane, Kane, QAfterFilterCondition> heartEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'heart',
        value: value,
      ));
    });
  }

  QueryBuilder<Kane, Kane, QAfterFilterCondition> heartGreaterThan(
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

  QueryBuilder<Kane, Kane, QAfterFilterCondition> heartLessThan(
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

  QueryBuilder<Kane, Kane, QAfterFilterCondition> heartBetween(
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

  QueryBuilder<Kane, Kane, QAfterFilterCondition> isBlockedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isBlocked',
        value: value,
      ));
    });
  }

  QueryBuilder<Kane, Kane, QAfterFilterCondition> isReversibleEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isReversible',
        value: value,
      ));
    });
  }

  QueryBuilder<Kane, Kane, QAfterFilterCondition> isSavedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSaved',
        value: value,
      ));
    });
  }

  QueryBuilder<Kane, Kane, QAfterFilterCondition> isShotEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isShot',
        value: value,
      ));
    });
  }

  QueryBuilder<Kane, Kane, QAfterFilterCondition> roleNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'roleName',
      ));
    });
  }

  QueryBuilder<Kane, Kane, QAfterFilterCondition> roleNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'roleName',
      ));
    });
  }

  QueryBuilder<Kane, Kane, QAfterFilterCondition> roleNameEqualTo(
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

  QueryBuilder<Kane, Kane, QAfterFilterCondition> roleNameGreaterThan(
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

  QueryBuilder<Kane, Kane, QAfterFilterCondition> roleNameLessThan(
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

  QueryBuilder<Kane, Kane, QAfterFilterCondition> roleNameBetween(
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

  QueryBuilder<Kane, Kane, QAfterFilterCondition> roleNameStartsWith(
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

  QueryBuilder<Kane, Kane, QAfterFilterCondition> roleNameEndsWith(
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

  QueryBuilder<Kane, Kane, QAfterFilterCondition> roleNameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'roleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Kane, Kane, QAfterFilterCondition> roleNameMatches(
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

  QueryBuilder<Kane, Kane, QAfterFilterCondition> roleNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roleName',
        value: '',
      ));
    });
  }

  QueryBuilder<Kane, Kane, QAfterFilterCondition> roleNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'roleName',
        value: '',
      ));
    });
  }

  QueryBuilder<Kane, Kane, QAfterFilterCondition> typeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<Kane, Kane, QAfterFilterCondition> typeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<Kane, Kane, QAfterFilterCondition> typeEqualTo(RoleType? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Kane, Kane, QAfterFilterCondition> typeGreaterThan(
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

  QueryBuilder<Kane, Kane, QAfterFilterCondition> typeLessThan(
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

  QueryBuilder<Kane, Kane, QAfterFilterCondition> typeBetween(
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
}

extension KaneQueryObject on QueryBuilder<Kane, Kane, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const KonstantinSchema = Schema(
  name: r'Konstantin',
  id: -4482128376767421354,
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
    r'hasReturned': PropertySchema(
      id: 4,
      name: r'hasReturned',
      type: IsarType.bool,
    ),
    r'heart': PropertySchema(
      id: 5,
      name: r'heart',
      type: IsarType.long,
    ),
    r'isBlocked': PropertySchema(
      id: 6,
      name: r'isBlocked',
      type: IsarType.bool,
    ),
    r'isReversible': PropertySchema(
      id: 7,
      name: r'isReversible',
      type: IsarType.bool,
    ),
    r'isSaved': PropertySchema(
      id: 8,
      name: r'isSaved',
      type: IsarType.bool,
    ),
    r'isShot': PropertySchema(
      id: 9,
      name: r'isShot',
      type: IsarType.bool,
    ),
    r'roleName': PropertySchema(
      id: 10,
      name: r'roleName',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 11,
      name: r'type',
      type: IsarType.int,
      enumMap: _KonstantintypeEnumValueMap,
    )
  },
  estimateSize: _konstantinEstimateSize,
  serialize: _konstantinSerialize,
  deserialize: _konstantinDeserialize,
  deserializeProp: _konstantinDeserializeProp,
);

int _konstantinEstimateSize(
  Konstantin object,
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
    final value = object.roleName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _konstantinSerialize(
  Konstantin object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.code);
  writer.writeString(offsets[1], object.description);
  writer.writeBool(offsets[2], object.disclosured);
  writer.writeBool(offsets[3], object.handCuffed);
  writer.writeBool(offsets[4], object.hasReturned);
  writer.writeLong(offsets[5], object.heart);
  writer.writeBool(offsets[6], object.isBlocked);
  writer.writeBool(offsets[7], object.isReversible);
  writer.writeBool(offsets[8], object.isSaved);
  writer.writeBool(offsets[9], object.isShot);
  writer.writeString(offsets[10], object.roleName);
  writer.writeInt(offsets[11], object.type?.index);
}

Konstantin _konstantinDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Konstantin();
  object.code = reader.readLongOrNull(offsets[0]);
  object.description = reader.readStringOrNull(offsets[1]);
  object.disclosured = reader.readBool(offsets[2]);
  object.handCuffed = reader.readBool(offsets[3]);
  object.hasReturned = reader.readBoolOrNull(offsets[4]);
  object.heart = reader.readLongOrNull(offsets[5]);
  object.isBlocked = reader.readBool(offsets[6]);
  object.isReversible = reader.readBool(offsets[7]);
  object.isSaved = reader.readBool(offsets[8]);
  object.isShot = reader.readBool(offsets[9]);
  object.roleName = reader.readStringOrNull(offsets[10]);
  object.type = _KonstantintypeValueEnumMap[reader.readIntOrNull(offsets[11])];
  return object;
}

P _konstantinDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (_KonstantintypeValueEnumMap[reader.readIntOrNull(offset)]) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _KonstantintypeEnumValueMap = {
  'citizen': 0,
  'mafia': 1,
  'independent': 2,
};
const _KonstantintypeValueEnumMap = {
  0: RoleType.citizen,
  1: RoleType.mafia,
  2: RoleType.independent,
};

extension KonstantinQueryFilter
    on QueryBuilder<Konstantin, Konstantin, QFilterCondition> {
  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition> codeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'code',
      ));
    });
  }

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition> codeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'code',
      ));
    });
  }

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition> codeEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
      ));
    });
  }

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition> codeGreaterThan(
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

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition> codeLessThan(
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

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition> codeBetween(
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

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition>
      descriptionEqualTo(
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

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition>
      descriptionGreaterThan(
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

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition>
      descriptionLessThan(
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

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition>
      descriptionBetween(
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

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition>
      descriptionStartsWith(
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

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition>
      descriptionEndsWith(
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

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition>
      disclosuredEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'disclosured',
        value: value,
      ));
    });
  }

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition> handCuffedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'handCuffed',
        value: value,
      ));
    });
  }

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition>
      hasReturnedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hasReturned',
      ));
    });
  }

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition>
      hasReturnedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hasReturned',
      ));
    });
  }

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition>
      hasReturnedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasReturned',
        value: value,
      ));
    });
  }

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition> heartIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'heart',
      ));
    });
  }

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition> heartIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'heart',
      ));
    });
  }

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition> heartEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'heart',
        value: value,
      ));
    });
  }

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition> heartGreaterThan(
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

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition> heartLessThan(
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

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition> heartBetween(
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

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition> isBlockedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isBlocked',
        value: value,
      ));
    });
  }

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition>
      isReversibleEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isReversible',
        value: value,
      ));
    });
  }

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition> isSavedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSaved',
        value: value,
      ));
    });
  }

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition> isShotEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isShot',
        value: value,
      ));
    });
  }

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition> roleNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'roleName',
      ));
    });
  }

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition>
      roleNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'roleName',
      ));
    });
  }

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition> roleNameEqualTo(
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

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition>
      roleNameGreaterThan(
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

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition> roleNameLessThan(
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

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition> roleNameBetween(
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

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition>
      roleNameStartsWith(
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

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition> roleNameEndsWith(
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

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition> roleNameContains(
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

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition> roleNameMatches(
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

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition>
      roleNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roleName',
        value: '',
      ));
    });
  }

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition>
      roleNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'roleName',
        value: '',
      ));
    });
  }

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition> typeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition> typeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition> typeEqualTo(
      RoleType? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition> typeGreaterThan(
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

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition> typeLessThan(
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

  QueryBuilder<Konstantin, Konstantin, QAfterFilterCondition> typeBetween(
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
}

extension KonstantinQueryObject
    on QueryBuilder<Konstantin, Konstantin, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const NostradamousSchema = Schema(
  name: r'Nostradamous',
  id: 515614367590144760,
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
    r'heart': PropertySchema(
      id: 4,
      name: r'heart',
      type: IsarType.long,
    ),
    r'isBlocked': PropertySchema(
      id: 5,
      name: r'isBlocked',
      type: IsarType.bool,
    ),
    r'isReversible': PropertySchema(
      id: 6,
      name: r'isReversible',
      type: IsarType.bool,
    ),
    r'isSaved': PropertySchema(
      id: 7,
      name: r'isSaved',
      type: IsarType.bool,
    ),
    r'isShot': PropertySchema(
      id: 8,
      name: r'isShot',
      type: IsarType.bool,
    ),
    r'roleName': PropertySchema(
      id: 9,
      name: r'roleName',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 10,
      name: r'type',
      type: IsarType.int,
      enumMap: _NostradamoustypeEnumValueMap,
    ),
    r'whichSideWillWin': PropertySchema(
      id: 11,
      name: r'whichSideWillWin',
      type: IsarType.byte,
      enumMap: _NostradamouswhichSideWillWinEnumValueMap,
    )
  },
  estimateSize: _nostradamousEstimateSize,
  serialize: _nostradamousSerialize,
  deserialize: _nostradamousDeserialize,
  deserializeProp: _nostradamousDeserializeProp,
);

int _nostradamousEstimateSize(
  Nostradamous object,
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
    final value = object.roleName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _nostradamousSerialize(
  Nostradamous object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.code);
  writer.writeString(offsets[1], object.description);
  writer.writeBool(offsets[2], object.disclosured);
  writer.writeBool(offsets[3], object.handCuffed);
  writer.writeLong(offsets[4], object.heart);
  writer.writeBool(offsets[5], object.isBlocked);
  writer.writeBool(offsets[6], object.isReversible);
  writer.writeBool(offsets[7], object.isSaved);
  writer.writeBool(offsets[8], object.isShot);
  writer.writeString(offsets[9], object.roleName);
  writer.writeInt(offsets[10], object.type?.index);
  writer.writeByte(offsets[11], object.whichSideWillWin.index);
}

Nostradamous _nostradamousDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Nostradamous();
  object.code = reader.readLongOrNull(offsets[0]);
  object.description = reader.readStringOrNull(offsets[1]);
  object.disclosured = reader.readBool(offsets[2]);
  object.handCuffed = reader.readBool(offsets[3]);
  object.heart = reader.readLongOrNull(offsets[4]);
  object.isBlocked = reader.readBool(offsets[5]);
  object.isReversible = reader.readBool(offsets[6]);
  object.isSaved = reader.readBool(offsets[7]);
  object.isShot = reader.readBool(offsets[8]);
  object.roleName = reader.readStringOrNull(offsets[9]);
  object.type =
      _NostradamoustypeValueEnumMap[reader.readIntOrNull(offsets[10])];
  object.whichSideWillWin = _NostradamouswhichSideWillWinValueEnumMap[
          reader.readByteOrNull(offsets[11])] ??
      RoleType.citizen;
  return object;
}

P _nostradamousDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (_NostradamoustypeValueEnumMap[reader.readIntOrNull(offset)]) as P;
    case 11:
      return (_NostradamouswhichSideWillWinValueEnumMap[
              reader.readByteOrNull(offset)] ??
          RoleType.citizen) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _NostradamoustypeEnumValueMap = {
  'citizen': 0,
  'mafia': 1,
  'independent': 2,
};
const _NostradamoustypeValueEnumMap = {
  0: RoleType.citizen,
  1: RoleType.mafia,
  2: RoleType.independent,
};
const _NostradamouswhichSideWillWinEnumValueMap = {
  'citizen': 0,
  'mafia': 1,
  'independent': 2,
};
const _NostradamouswhichSideWillWinValueEnumMap = {
  0: RoleType.citizen,
  1: RoleType.mafia,
  2: RoleType.independent,
};

extension NostradamousQueryFilter
    on QueryBuilder<Nostradamous, Nostradamous, QFilterCondition> {
  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition> codeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'code',
      ));
    });
  }

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      codeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'code',
      ));
    });
  }

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition> codeEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
      ));
    });
  }

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      codeGreaterThan(
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

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition> codeLessThan(
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

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition> codeBetween(
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

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      descriptionEqualTo(
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

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      descriptionGreaterThan(
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

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      descriptionLessThan(
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

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      descriptionBetween(
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

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      descriptionStartsWith(
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

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      descriptionEndsWith(
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

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      disclosuredEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'disclosured',
        value: value,
      ));
    });
  }

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      handCuffedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'handCuffed',
        value: value,
      ));
    });
  }

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      heartIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'heart',
      ));
    });
  }

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      heartIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'heart',
      ));
    });
  }

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition> heartEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'heart',
        value: value,
      ));
    });
  }

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      heartGreaterThan(
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

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition> heartLessThan(
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

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition> heartBetween(
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

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      isBlockedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isBlocked',
        value: value,
      ));
    });
  }

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      isReversibleEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isReversible',
        value: value,
      ));
    });
  }

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      isSavedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSaved',
        value: value,
      ));
    });
  }

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition> isShotEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isShot',
        value: value,
      ));
    });
  }

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      roleNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'roleName',
      ));
    });
  }

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      roleNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'roleName',
      ));
    });
  }

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      roleNameEqualTo(
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

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      roleNameGreaterThan(
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

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      roleNameLessThan(
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

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      roleNameBetween(
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

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      roleNameStartsWith(
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

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      roleNameEndsWith(
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

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      roleNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'roleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      roleNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'roleName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      roleNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roleName',
        value: '',
      ));
    });
  }

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      roleNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'roleName',
        value: '',
      ));
    });
  }

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition> typeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      typeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition> typeEqualTo(
      RoleType? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      typeGreaterThan(
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

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition> typeLessThan(
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

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition> typeBetween(
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

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      whichSideWillWinEqualTo(RoleType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'whichSideWillWin',
        value: value,
      ));
    });
  }

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      whichSideWillWinGreaterThan(
    RoleType value, {
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

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      whichSideWillWinLessThan(
    RoleType value, {
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

  QueryBuilder<Nostradamous, Nostradamous, QAfterFilterCondition>
      whichSideWillWinBetween(
    RoleType lower,
    RoleType upper, {
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

extension NostradamousQueryObject
    on QueryBuilder<Nostradamous, Nostradamous, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const GodfatherSchema = Schema(
  name: r'Godfather',
  id: 20086056780957450,
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
    r'heart': PropertySchema(
      id: 4,
      name: r'heart',
      type: IsarType.long,
    ),
    r'isBlocked': PropertySchema(
      id: 5,
      name: r'isBlocked',
      type: IsarType.bool,
    ),
    r'isReversible': PropertySchema(
      id: 6,
      name: r'isReversible',
      type: IsarType.bool,
    ),
    r'isSaved': PropertySchema(
      id: 7,
      name: r'isSaved',
      type: IsarType.bool,
    ),
    r'isShot': PropertySchema(
      id: 8,
      name: r'isShot',
      type: IsarType.bool,
    ),
    r'roleName': PropertySchema(
      id: 9,
      name: r'roleName',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 10,
      name: r'type',
      type: IsarType.int,
      enumMap: _GodfathertypeEnumValueMap,
    )
  },
  estimateSize: _godfatherEstimateSize,
  serialize: _godfatherSerialize,
  deserialize: _godfatherDeserialize,
  deserializeProp: _godfatherDeserializeProp,
);

int _godfatherEstimateSize(
  Godfather object,
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
    final value = object.roleName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _godfatherSerialize(
  Godfather object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.code);
  writer.writeString(offsets[1], object.description);
  writer.writeBool(offsets[2], object.disclosured);
  writer.writeBool(offsets[3], object.handCuffed);
  writer.writeLong(offsets[4], object.heart);
  writer.writeBool(offsets[5], object.isBlocked);
  writer.writeBool(offsets[6], object.isReversible);
  writer.writeBool(offsets[7], object.isSaved);
  writer.writeBool(offsets[8], object.isShot);
  writer.writeString(offsets[9], object.roleName);
  writer.writeInt(offsets[10], object.type?.index);
}

Godfather _godfatherDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Godfather();
  object.code = reader.readLongOrNull(offsets[0]);
  object.description = reader.readStringOrNull(offsets[1]);
  object.disclosured = reader.readBool(offsets[2]);
  object.handCuffed = reader.readBool(offsets[3]);
  object.heart = reader.readLongOrNull(offsets[4]);
  object.isBlocked = reader.readBool(offsets[5]);
  object.isReversible = reader.readBool(offsets[6]);
  object.isSaved = reader.readBool(offsets[7]);
  object.isShot = reader.readBool(offsets[8]);
  object.roleName = reader.readStringOrNull(offsets[9]);
  object.type = _GodfathertypeValueEnumMap[reader.readIntOrNull(offsets[10])];
  return object;
}

P _godfatherDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (_GodfathertypeValueEnumMap[reader.readIntOrNull(offset)]) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _GodfathertypeEnumValueMap = {
  'citizen': 0,
  'mafia': 1,
  'independent': 2,
};
const _GodfathertypeValueEnumMap = {
  0: RoleType.citizen,
  1: RoleType.mafia,
  2: RoleType.independent,
};

extension GodfatherQueryFilter
    on QueryBuilder<Godfather, Godfather, QFilterCondition> {
  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> codeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'code',
      ));
    });
  }

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> codeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'code',
      ));
    });
  }

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> codeEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
      ));
    });
  }

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> codeGreaterThan(
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

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> codeLessThan(
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

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> codeBetween(
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

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> descriptionEqualTo(
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

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition>
      descriptionGreaterThan(
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

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> descriptionLessThan(
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

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> descriptionBetween(
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

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition>
      descriptionStartsWith(
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

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> descriptionEndsWith(
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

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> descriptionContains(
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

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> descriptionMatches(
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

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> disclosuredEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'disclosured',
        value: value,
      ));
    });
  }

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> handCuffedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'handCuffed',
        value: value,
      ));
    });
  }

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> heartIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'heart',
      ));
    });
  }

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> heartIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'heart',
      ));
    });
  }

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> heartEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'heart',
        value: value,
      ));
    });
  }

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> heartGreaterThan(
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

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> heartLessThan(
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

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> heartBetween(
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

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> isBlockedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isBlocked',
        value: value,
      ));
    });
  }

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> isReversibleEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isReversible',
        value: value,
      ));
    });
  }

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> isSavedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSaved',
        value: value,
      ));
    });
  }

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> isShotEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isShot',
        value: value,
      ));
    });
  }

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> roleNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'roleName',
      ));
    });
  }

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition>
      roleNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'roleName',
      ));
    });
  }

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> roleNameEqualTo(
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

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> roleNameGreaterThan(
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

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> roleNameLessThan(
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

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> roleNameBetween(
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

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> roleNameStartsWith(
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

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> roleNameEndsWith(
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

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> roleNameContains(
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

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> roleNameMatches(
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

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> roleNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roleName',
        value: '',
      ));
    });
  }

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition>
      roleNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'roleName',
        value: '',
      ));
    });
  }

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> typeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> typeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> typeEqualTo(
      RoleType? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> typeGreaterThan(
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

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> typeLessThan(
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

  QueryBuilder<Godfather, Godfather, QAfterFilterCondition> typeBetween(
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
}

extension GodfatherQueryObject
    on QueryBuilder<Godfather, Godfather, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const MatadorSchema = Schema(
  name: r'Matador',
  id: 3843183038526533113,
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
    r'heart': PropertySchema(
      id: 4,
      name: r'heart',
      type: IsarType.long,
    ),
    r'isBlocked': PropertySchema(
      id: 5,
      name: r'isBlocked',
      type: IsarType.bool,
    ),
    r'isReversible': PropertySchema(
      id: 6,
      name: r'isReversible',
      type: IsarType.bool,
    ),
    r'isSaved': PropertySchema(
      id: 7,
      name: r'isSaved',
      type: IsarType.bool,
    ),
    r'isShot': PropertySchema(
      id: 8,
      name: r'isShot',
      type: IsarType.bool,
    ),
    r'roleName': PropertySchema(
      id: 9,
      name: r'roleName',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 10,
      name: r'type',
      type: IsarType.int,
      enumMap: _MatadortypeEnumValueMap,
    )
  },
  estimateSize: _matadorEstimateSize,
  serialize: _matadorSerialize,
  deserialize: _matadorDeserialize,
  deserializeProp: _matadorDeserializeProp,
);

int _matadorEstimateSize(
  Matador object,
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
    final value = object.roleName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _matadorSerialize(
  Matador object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.code);
  writer.writeString(offsets[1], object.description);
  writer.writeBool(offsets[2], object.disclosured);
  writer.writeBool(offsets[3], object.handCuffed);
  writer.writeLong(offsets[4], object.heart);
  writer.writeBool(offsets[5], object.isBlocked);
  writer.writeBool(offsets[6], object.isReversible);
  writer.writeBool(offsets[7], object.isSaved);
  writer.writeBool(offsets[8], object.isShot);
  writer.writeString(offsets[9], object.roleName);
  writer.writeInt(offsets[10], object.type?.index);
}

Matador _matadorDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Matador();
  object.code = reader.readLongOrNull(offsets[0]);
  object.description = reader.readStringOrNull(offsets[1]);
  object.disclosured = reader.readBool(offsets[2]);
  object.handCuffed = reader.readBool(offsets[3]);
  object.heart = reader.readLongOrNull(offsets[4]);
  object.isBlocked = reader.readBool(offsets[5]);
  object.isReversible = reader.readBool(offsets[6]);
  object.isSaved = reader.readBool(offsets[7]);
  object.isShot = reader.readBool(offsets[8]);
  object.roleName = reader.readStringOrNull(offsets[9]);
  object.type = _MatadortypeValueEnumMap[reader.readIntOrNull(offsets[10])];
  return object;
}

P _matadorDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (_MatadortypeValueEnumMap[reader.readIntOrNull(offset)]) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _MatadortypeEnumValueMap = {
  'citizen': 0,
  'mafia': 1,
  'independent': 2,
};
const _MatadortypeValueEnumMap = {
  0: RoleType.citizen,
  1: RoleType.mafia,
  2: RoleType.independent,
};

extension MatadorQueryFilter
    on QueryBuilder<Matador, Matador, QFilterCondition> {
  QueryBuilder<Matador, Matador, QAfterFilterCondition> codeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'code',
      ));
    });
  }

  QueryBuilder<Matador, Matador, QAfterFilterCondition> codeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'code',
      ));
    });
  }

  QueryBuilder<Matador, Matador, QAfterFilterCondition> codeEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
      ));
    });
  }

  QueryBuilder<Matador, Matador, QAfterFilterCondition> codeGreaterThan(
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

  QueryBuilder<Matador, Matador, QAfterFilterCondition> codeLessThan(
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

  QueryBuilder<Matador, Matador, QAfterFilterCondition> codeBetween(
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

  QueryBuilder<Matador, Matador, QAfterFilterCondition> descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Matador, Matador, QAfterFilterCondition> descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Matador, Matador, QAfterFilterCondition> descriptionEqualTo(
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

  QueryBuilder<Matador, Matador, QAfterFilterCondition> descriptionGreaterThan(
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

  QueryBuilder<Matador, Matador, QAfterFilterCondition> descriptionLessThan(
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

  QueryBuilder<Matador, Matador, QAfterFilterCondition> descriptionBetween(
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

  QueryBuilder<Matador, Matador, QAfterFilterCondition> descriptionStartsWith(
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

  QueryBuilder<Matador, Matador, QAfterFilterCondition> descriptionEndsWith(
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

  QueryBuilder<Matador, Matador, QAfterFilterCondition> descriptionContains(
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

  QueryBuilder<Matador, Matador, QAfterFilterCondition> descriptionMatches(
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

  QueryBuilder<Matador, Matador, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Matador, Matador, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Matador, Matador, QAfterFilterCondition> disclosuredEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'disclosured',
        value: value,
      ));
    });
  }

  QueryBuilder<Matador, Matador, QAfterFilterCondition> handCuffedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'handCuffed',
        value: value,
      ));
    });
  }

  QueryBuilder<Matador, Matador, QAfterFilterCondition> heartIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'heart',
      ));
    });
  }

  QueryBuilder<Matador, Matador, QAfterFilterCondition> heartIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'heart',
      ));
    });
  }

  QueryBuilder<Matador, Matador, QAfterFilterCondition> heartEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'heart',
        value: value,
      ));
    });
  }

  QueryBuilder<Matador, Matador, QAfterFilterCondition> heartGreaterThan(
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

  QueryBuilder<Matador, Matador, QAfterFilterCondition> heartLessThan(
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

  QueryBuilder<Matador, Matador, QAfterFilterCondition> heartBetween(
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

  QueryBuilder<Matador, Matador, QAfterFilterCondition> isBlockedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isBlocked',
        value: value,
      ));
    });
  }

  QueryBuilder<Matador, Matador, QAfterFilterCondition> isReversibleEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isReversible',
        value: value,
      ));
    });
  }

  QueryBuilder<Matador, Matador, QAfterFilterCondition> isSavedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSaved',
        value: value,
      ));
    });
  }

  QueryBuilder<Matador, Matador, QAfterFilterCondition> isShotEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isShot',
        value: value,
      ));
    });
  }

  QueryBuilder<Matador, Matador, QAfterFilterCondition> roleNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'roleName',
      ));
    });
  }

  QueryBuilder<Matador, Matador, QAfterFilterCondition> roleNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'roleName',
      ));
    });
  }

  QueryBuilder<Matador, Matador, QAfterFilterCondition> roleNameEqualTo(
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

  QueryBuilder<Matador, Matador, QAfterFilterCondition> roleNameGreaterThan(
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

  QueryBuilder<Matador, Matador, QAfterFilterCondition> roleNameLessThan(
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

  QueryBuilder<Matador, Matador, QAfterFilterCondition> roleNameBetween(
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

  QueryBuilder<Matador, Matador, QAfterFilterCondition> roleNameStartsWith(
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

  QueryBuilder<Matador, Matador, QAfterFilterCondition> roleNameEndsWith(
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

  QueryBuilder<Matador, Matador, QAfterFilterCondition> roleNameContains(
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

  QueryBuilder<Matador, Matador, QAfterFilterCondition> roleNameMatches(
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

  QueryBuilder<Matador, Matador, QAfterFilterCondition> roleNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roleName',
        value: '',
      ));
    });
  }

  QueryBuilder<Matador, Matador, QAfterFilterCondition> roleNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'roleName',
        value: '',
      ));
    });
  }

  QueryBuilder<Matador, Matador, QAfterFilterCondition> typeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<Matador, Matador, QAfterFilterCondition> typeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<Matador, Matador, QAfterFilterCondition> typeEqualTo(
      RoleType? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Matador, Matador, QAfterFilterCondition> typeGreaterThan(
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

  QueryBuilder<Matador, Matador, QAfterFilterCondition> typeLessThan(
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

  QueryBuilder<Matador, Matador, QAfterFilterCondition> typeBetween(
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
}

extension MatadorQueryObject
    on QueryBuilder<Matador, Matador, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SaulSchema = Schema(
  name: r'Saul',
  id: 5402948994031595217,
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
    r'heart': PropertySchema(
      id: 5,
      name: r'heart',
      type: IsarType.long,
    ),
    r'isBlocked': PropertySchema(
      id: 6,
      name: r'isBlocked',
      type: IsarType.bool,
    ),
    r'isReversible': PropertySchema(
      id: 7,
      name: r'isReversible',
      type: IsarType.bool,
    ),
    r'isSaved': PropertySchema(
      id: 8,
      name: r'isSaved',
      type: IsarType.bool,
    ),
    r'isShot': PropertySchema(
      id: 9,
      name: r'isShot',
      type: IsarType.bool,
    ),
    r'roleName': PropertySchema(
      id: 10,
      name: r'roleName',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 11,
      name: r'type',
      type: IsarType.int,
      enumMap: _SaultypeEnumValueMap,
    )
  },
  estimateSize: _saulEstimateSize,
  serialize: _saulSerialize,
  deserialize: _saulDeserialize,
  deserializeProp: _saulDeserializeProp,
);

int _saulEstimateSize(
  Saul object,
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
    final value = object.roleName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _saulSerialize(
  Saul object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.code);
  writer.writeString(offsets[1], object.description);
  writer.writeBool(offsets[2], object.disclosured);
  writer.writeBool(offsets[3], object.handCuffed);
  writer.writeBool(offsets[4], object.hasBuyed);
  writer.writeLong(offsets[5], object.heart);
  writer.writeBool(offsets[6], object.isBlocked);
  writer.writeBool(offsets[7], object.isReversible);
  writer.writeBool(offsets[8], object.isSaved);
  writer.writeBool(offsets[9], object.isShot);
  writer.writeString(offsets[10], object.roleName);
  writer.writeInt(offsets[11], object.type?.index);
}

Saul _saulDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Saul();
  object.code = reader.readLongOrNull(offsets[0]);
  object.description = reader.readStringOrNull(offsets[1]);
  object.disclosured = reader.readBool(offsets[2]);
  object.handCuffed = reader.readBool(offsets[3]);
  object.hasBuyed = reader.readBool(offsets[4]);
  object.heart = reader.readLongOrNull(offsets[5]);
  object.isBlocked = reader.readBool(offsets[6]);
  object.isReversible = reader.readBool(offsets[7]);
  object.isSaved = reader.readBool(offsets[8]);
  object.isShot = reader.readBool(offsets[9]);
  object.roleName = reader.readStringOrNull(offsets[10]);
  object.type = _SaultypeValueEnumMap[reader.readIntOrNull(offsets[11])];
  return object;
}

P _saulDeserializeProp<P>(
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
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (_SaultypeValueEnumMap[reader.readIntOrNull(offset)]) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _SaultypeEnumValueMap = {
  'citizen': 0,
  'mafia': 1,
  'independent': 2,
};
const _SaultypeValueEnumMap = {
  0: RoleType.citizen,
  1: RoleType.mafia,
  2: RoleType.independent,
};

extension SaulQueryFilter on QueryBuilder<Saul, Saul, QFilterCondition> {
  QueryBuilder<Saul, Saul, QAfterFilterCondition> codeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'code',
      ));
    });
  }

  QueryBuilder<Saul, Saul, QAfterFilterCondition> codeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'code',
      ));
    });
  }

  QueryBuilder<Saul, Saul, QAfterFilterCondition> codeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
      ));
    });
  }

  QueryBuilder<Saul, Saul, QAfterFilterCondition> codeGreaterThan(
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

  QueryBuilder<Saul, Saul, QAfterFilterCondition> codeLessThan(
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

  QueryBuilder<Saul, Saul, QAfterFilterCondition> codeBetween(
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

  QueryBuilder<Saul, Saul, QAfterFilterCondition> descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Saul, Saul, QAfterFilterCondition> descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Saul, Saul, QAfterFilterCondition> descriptionEqualTo(
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

  QueryBuilder<Saul, Saul, QAfterFilterCondition> descriptionGreaterThan(
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

  QueryBuilder<Saul, Saul, QAfterFilterCondition> descriptionLessThan(
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

  QueryBuilder<Saul, Saul, QAfterFilterCondition> descriptionBetween(
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

  QueryBuilder<Saul, Saul, QAfterFilterCondition> descriptionStartsWith(
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

  QueryBuilder<Saul, Saul, QAfterFilterCondition> descriptionEndsWith(
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

  QueryBuilder<Saul, Saul, QAfterFilterCondition> descriptionContains(
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

  QueryBuilder<Saul, Saul, QAfterFilterCondition> descriptionMatches(
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

  QueryBuilder<Saul, Saul, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Saul, Saul, QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Saul, Saul, QAfterFilterCondition> disclosuredEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'disclosured',
        value: value,
      ));
    });
  }

  QueryBuilder<Saul, Saul, QAfterFilterCondition> handCuffedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'handCuffed',
        value: value,
      ));
    });
  }

  QueryBuilder<Saul, Saul, QAfterFilterCondition> hasBuyedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasBuyed',
        value: value,
      ));
    });
  }

  QueryBuilder<Saul, Saul, QAfterFilterCondition> heartIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'heart',
      ));
    });
  }

  QueryBuilder<Saul, Saul, QAfterFilterCondition> heartIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'heart',
      ));
    });
  }

  QueryBuilder<Saul, Saul, QAfterFilterCondition> heartEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'heart',
        value: value,
      ));
    });
  }

  QueryBuilder<Saul, Saul, QAfterFilterCondition> heartGreaterThan(
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

  QueryBuilder<Saul, Saul, QAfterFilterCondition> heartLessThan(
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

  QueryBuilder<Saul, Saul, QAfterFilterCondition> heartBetween(
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

  QueryBuilder<Saul, Saul, QAfterFilterCondition> isBlockedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isBlocked',
        value: value,
      ));
    });
  }

  QueryBuilder<Saul, Saul, QAfterFilterCondition> isReversibleEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isReversible',
        value: value,
      ));
    });
  }

  QueryBuilder<Saul, Saul, QAfterFilterCondition> isSavedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSaved',
        value: value,
      ));
    });
  }

  QueryBuilder<Saul, Saul, QAfterFilterCondition> isShotEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isShot',
        value: value,
      ));
    });
  }

  QueryBuilder<Saul, Saul, QAfterFilterCondition> roleNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'roleName',
      ));
    });
  }

  QueryBuilder<Saul, Saul, QAfterFilterCondition> roleNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'roleName',
      ));
    });
  }

  QueryBuilder<Saul, Saul, QAfterFilterCondition> roleNameEqualTo(
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

  QueryBuilder<Saul, Saul, QAfterFilterCondition> roleNameGreaterThan(
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

  QueryBuilder<Saul, Saul, QAfterFilterCondition> roleNameLessThan(
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

  QueryBuilder<Saul, Saul, QAfterFilterCondition> roleNameBetween(
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

  QueryBuilder<Saul, Saul, QAfterFilterCondition> roleNameStartsWith(
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

  QueryBuilder<Saul, Saul, QAfterFilterCondition> roleNameEndsWith(
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

  QueryBuilder<Saul, Saul, QAfterFilterCondition> roleNameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'roleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Saul, Saul, QAfterFilterCondition> roleNameMatches(
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

  QueryBuilder<Saul, Saul, QAfterFilterCondition> roleNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roleName',
        value: '',
      ));
    });
  }

  QueryBuilder<Saul, Saul, QAfterFilterCondition> roleNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'roleName',
        value: '',
      ));
    });
  }

  QueryBuilder<Saul, Saul, QAfterFilterCondition> typeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<Saul, Saul, QAfterFilterCondition> typeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<Saul, Saul, QAfterFilterCondition> typeEqualTo(RoleType? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Saul, Saul, QAfterFilterCondition> typeGreaterThan(
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

  QueryBuilder<Saul, Saul, QAfterFilterCondition> typeLessThan(
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

  QueryBuilder<Saul, Saul, QAfterFilterCondition> typeBetween(
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
}

extension SaulQueryObject on QueryBuilder<Saul, Saul, QFilterCondition> {}
