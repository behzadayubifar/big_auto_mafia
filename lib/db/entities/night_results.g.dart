// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'night_results.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetResultsCollection on Isar {
  IsarCollection<Results> get results => this.collection();
}

const ResultsSchema = CollectionSchema(
  name: r'Results',
  id: -1436908029528008098,
  properties: {
    r'allDeadPlayers': PropertySchema(
      id: 0,
      name: r'allDeadPlayers',
      type: IsarType.stringList,
    ),
    r'bornPlayer': PropertySchema(
      id: 1,
      name: r'bornPlayer',
      type: IsarType.string,
    ),
    r'disclosured': PropertySchema(
      id: 2,
      name: r'disclosured',
      type: IsarType.string,
    ),
    r'nightCode': PropertySchema(
      id: 3,
      name: r'nightCode',
      type: IsarType.long,
    ),
    r'nightNumber': PropertySchema(
      id: 4,
      name: r'nightNumber',
      type: IsarType.long,
    ),
    r'remainedChancesForNightEnquiry': PropertySchema(
      id: 5,
      name: r'remainedChancesForNightEnquiry',
      type: IsarType.long,
    ),
    r'slaughtered': PropertySchema(
      id: 6,
      name: r'slaughtered',
      type: IsarType.string,
    ),
    r'tonightDeads': PropertySchema(
      id: 7,
      name: r'tonightDeads',
      type: IsarType.stringList,
    )
  },
  estimateSize: _resultsEstimateSize,
  serialize: _resultsSerialize,
  deserialize: _resultsDeserialize,
  deserializeProp: _resultsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _resultsGetId,
  getLinks: _resultsGetLinks,
  attach: _resultsAttach,
  version: '3.1.0+1',
);

int _resultsEstimateSize(
  Results object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.allDeadPlayers;
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
    final value = object.bornPlayer;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.disclosured;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.slaughtered;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.tonightDeads;
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

void _resultsSerialize(
  Results object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.allDeadPlayers);
  writer.writeString(offsets[1], object.bornPlayer);
  writer.writeString(offsets[2], object.disclosured);
  writer.writeLong(offsets[3], object.nightCode);
  writer.writeLong(offsets[4], object.nightNumber);
  writer.writeLong(offsets[5], object.remainedChancesForNightEnquiry);
  writer.writeString(offsets[6], object.slaughtered);
  writer.writeStringList(offsets[7], object.tonightDeads);
}

Results _resultsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Results();
  object.allDeadPlayers = reader.readStringList(offsets[0]);
  object.bornPlayer = reader.readStringOrNull(offsets[1]);
  object.disclosured = reader.readStringOrNull(offsets[2]);
  object.id = id;
  object.nightCode = reader.readLongOrNull(offsets[3]);
  object.nightNumber = reader.readLongOrNull(offsets[4]);
  object.remainedChancesForNightEnquiry = reader.readLongOrNull(offsets[5]);
  object.slaughtered = reader.readStringOrNull(offsets[6]);
  object.tonightDeads = reader.readStringList(offsets[7]);
  return object;
}

P _resultsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringList(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _resultsGetId(Results object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _resultsGetLinks(Results object) {
  return [];
}

void _resultsAttach(IsarCollection<dynamic> col, Id id, Results object) {
  object.id = id;
}

extension ResultsQueryWhereSort on QueryBuilder<Results, Results, QWhere> {
  QueryBuilder<Results, Results, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ResultsQueryWhere on QueryBuilder<Results, Results, QWhereClause> {
  QueryBuilder<Results, Results, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Results, Results, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Results, Results, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Results, Results, QAfterWhereClause> idBetween(
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

extension ResultsQueryFilter
    on QueryBuilder<Results, Results, QFilterCondition> {
  QueryBuilder<Results, Results, QAfterFilterCondition> allDeadPlayersIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'allDeadPlayers',
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      allDeadPlayersIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'allDeadPlayers',
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      allDeadPlayersElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'allDeadPlayers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      allDeadPlayersElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'allDeadPlayers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      allDeadPlayersElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'allDeadPlayers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      allDeadPlayersElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'allDeadPlayers',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      allDeadPlayersElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'allDeadPlayers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      allDeadPlayersElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'allDeadPlayers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      allDeadPlayersElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'allDeadPlayers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      allDeadPlayersElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'allDeadPlayers',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      allDeadPlayersElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'allDeadPlayers',
        value: '',
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      allDeadPlayersElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'allDeadPlayers',
        value: '',
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      allDeadPlayersLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allDeadPlayers',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      allDeadPlayersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allDeadPlayers',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      allDeadPlayersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allDeadPlayers',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      allDeadPlayersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allDeadPlayers',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      allDeadPlayersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allDeadPlayers',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      allDeadPlayersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'allDeadPlayers',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> bornPlayerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bornPlayer',
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> bornPlayerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bornPlayer',
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> bornPlayerEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bornPlayer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> bornPlayerGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bornPlayer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> bornPlayerLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bornPlayer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> bornPlayerBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bornPlayer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> bornPlayerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bornPlayer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> bornPlayerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bornPlayer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> bornPlayerContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bornPlayer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> bornPlayerMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bornPlayer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> bornPlayerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bornPlayer',
        value: '',
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> bornPlayerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bornPlayer',
        value: '',
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> disclosuredIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'disclosured',
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> disclosuredIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'disclosured',
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> disclosuredEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'disclosured',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> disclosuredGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'disclosured',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> disclosuredLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'disclosured',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> disclosuredBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'disclosured',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> disclosuredStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'disclosured',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> disclosuredEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'disclosured',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> disclosuredContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'disclosured',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> disclosuredMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'disclosured',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> disclosuredIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'disclosured',
        value: '',
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      disclosuredIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'disclosured',
        value: '',
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Results, Results, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Results, Results, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Results, Results, QAfterFilterCondition> nightCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nightCode',
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> nightCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nightCode',
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> nightCodeEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nightCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> nightCodeGreaterThan(
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

  QueryBuilder<Results, Results, QAfterFilterCondition> nightCodeLessThan(
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

  QueryBuilder<Results, Results, QAfterFilterCondition> nightCodeBetween(
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

  QueryBuilder<Results, Results, QAfterFilterCondition> nightNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nightNumber',
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> nightNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nightNumber',
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> nightNumberEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nightNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> nightNumberGreaterThan(
    int? value, {
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

  QueryBuilder<Results, Results, QAfterFilterCondition> nightNumberLessThan(
    int? value, {
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

  QueryBuilder<Results, Results, QAfterFilterCondition> nightNumberBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<Results, Results, QAfterFilterCondition>
      remainedChancesForNightEnquiryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remainedChancesForNightEnquiry',
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      remainedChancesForNightEnquiryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remainedChancesForNightEnquiry',
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      remainedChancesForNightEnquiryEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remainedChancesForNightEnquiry',
        value: value,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
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

  QueryBuilder<Results, Results, QAfterFilterCondition>
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

  QueryBuilder<Results, Results, QAfterFilterCondition>
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

  QueryBuilder<Results, Results, QAfterFilterCondition> slaughteredIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'slaughtered',
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> slaughteredIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'slaughtered',
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> slaughteredEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'slaughtered',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> slaughteredGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'slaughtered',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> slaughteredLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'slaughtered',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> slaughteredBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'slaughtered',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> slaughteredStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'slaughtered',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> slaughteredEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'slaughtered',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> slaughteredContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'slaughtered',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> slaughteredMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'slaughtered',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> slaughteredIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'slaughtered',
        value: '',
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      slaughteredIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'slaughtered',
        value: '',
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> tonightDeadsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tonightDeads',
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      tonightDeadsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tonightDeads',
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      tonightDeadsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tonightDeads',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      tonightDeadsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tonightDeads',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      tonightDeadsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tonightDeads',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      tonightDeadsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tonightDeads',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      tonightDeadsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tonightDeads',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      tonightDeadsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tonightDeads',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      tonightDeadsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tonightDeads',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      tonightDeadsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tonightDeads',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      tonightDeadsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tonightDeads',
        value: '',
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      tonightDeadsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tonightDeads',
        value: '',
      ));
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      tonightDeadsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tonightDeads',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition> tonightDeadsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tonightDeads',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      tonightDeadsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tonightDeads',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      tonightDeadsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tonightDeads',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      tonightDeadsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tonightDeads',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Results, Results, QAfterFilterCondition>
      tonightDeadsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tonightDeads',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension ResultsQueryObject
    on QueryBuilder<Results, Results, QFilterCondition> {}

extension ResultsQueryLinks
    on QueryBuilder<Results, Results, QFilterCondition> {}

extension ResultsQuerySortBy on QueryBuilder<Results, Results, QSortBy> {
  QueryBuilder<Results, Results, QAfterSortBy> sortByBornPlayer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bornPlayer', Sort.asc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy> sortByBornPlayerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bornPlayer', Sort.desc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy> sortByDisclosured() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disclosured', Sort.asc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy> sortByDisclosuredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disclosured', Sort.desc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy> sortByNightCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightCode', Sort.asc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy> sortByNightCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightCode', Sort.desc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy> sortByNightNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightNumber', Sort.asc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy> sortByNightNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightNumber', Sort.desc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy>
      sortByRemainedChancesForNightEnquiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainedChancesForNightEnquiry', Sort.asc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy>
      sortByRemainedChancesForNightEnquiryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainedChancesForNightEnquiry', Sort.desc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy> sortBySlaughtered() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'slaughtered', Sort.asc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy> sortBySlaughteredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'slaughtered', Sort.desc);
    });
  }
}

extension ResultsQuerySortThenBy
    on QueryBuilder<Results, Results, QSortThenBy> {
  QueryBuilder<Results, Results, QAfterSortBy> thenByBornPlayer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bornPlayer', Sort.asc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy> thenByBornPlayerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bornPlayer', Sort.desc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy> thenByDisclosured() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disclosured', Sort.asc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy> thenByDisclosuredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disclosured', Sort.desc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy> thenByNightCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightCode', Sort.asc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy> thenByNightCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightCode', Sort.desc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy> thenByNightNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightNumber', Sort.asc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy> thenByNightNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nightNumber', Sort.desc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy>
      thenByRemainedChancesForNightEnquiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainedChancesForNightEnquiry', Sort.asc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy>
      thenByRemainedChancesForNightEnquiryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainedChancesForNightEnquiry', Sort.desc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy> thenBySlaughtered() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'slaughtered', Sort.asc);
    });
  }

  QueryBuilder<Results, Results, QAfterSortBy> thenBySlaughteredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'slaughtered', Sort.desc);
    });
  }
}

extension ResultsQueryWhereDistinct
    on QueryBuilder<Results, Results, QDistinct> {
  QueryBuilder<Results, Results, QDistinct> distinctByAllDeadPlayers() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'allDeadPlayers');
    });
  }

  QueryBuilder<Results, Results, QDistinct> distinctByBornPlayer(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bornPlayer', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Results, Results, QDistinct> distinctByDisclosured(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'disclosured', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Results, Results, QDistinct> distinctByNightCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nightCode');
    });
  }

  QueryBuilder<Results, Results, QDistinct> distinctByNightNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nightNumber');
    });
  }

  QueryBuilder<Results, Results, QDistinct>
      distinctByRemainedChancesForNightEnquiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remainedChancesForNightEnquiry');
    });
  }

  QueryBuilder<Results, Results, QDistinct> distinctBySlaughtered(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'slaughtered', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Results, Results, QDistinct> distinctByTonightDeads() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tonightDeads');
    });
  }
}

extension ResultsQueryProperty
    on QueryBuilder<Results, Results, QQueryProperty> {
  QueryBuilder<Results, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Results, List<String>?, QQueryOperations>
      allDeadPlayersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'allDeadPlayers');
    });
  }

  QueryBuilder<Results, String?, QQueryOperations> bornPlayerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bornPlayer');
    });
  }

  QueryBuilder<Results, String?, QQueryOperations> disclosuredProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'disclosured');
    });
  }

  QueryBuilder<Results, int?, QQueryOperations> nightCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nightCode');
    });
  }

  QueryBuilder<Results, int?, QQueryOperations> nightNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nightNumber');
    });
  }

  QueryBuilder<Results, int?, QQueryOperations>
      remainedChancesForNightEnquiryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remainedChancesForNightEnquiry');
    });
  }

  QueryBuilder<Results, String?, QQueryOperations> slaughteredProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'slaughtered');
    });
  }

  QueryBuilder<Results, List<String>?, QQueryOperations>
      tonightDeadsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tonightDeads');
    });
  }
}
