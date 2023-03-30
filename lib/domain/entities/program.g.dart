// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetProgramCollection on Isar {
  IsarCollection<Program> get programs => this.collection();
}

const ProgramSchema = CollectionSchema(
  name: r'Program',
  id: 602068775558646134,
  properties: {
    r'abbreviation': PropertySchema(
      id: 0,
      name: r'abbreviation',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 1,
      name: r'description',
      type: IsarType.string,
    ),
    r'enabled': PropertySchema(
      id: 2,
      name: r'enabled',
      type: IsarType.bool,
    ),
    r'image': PropertySchema(
      id: 3,
      name: r'image',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    ),
    r'programOptions': PropertySchema(
      id: 5,
      name: r'programOptions',
      type: IsarType.byte,
      enumMap: _ProgramprogramOptionsEnumValueMap,
    ),
    r'score': PropertySchema(
      id: 6,
      name: r'score',
      type: IsarType.long,
    ),
    r'script': PropertySchema(
      id: 7,
      name: r'script',
      type: IsarType.string,
    ),
    r'values': PropertySchema(
      id: 8,
      name: r'values',
      type: IsarType.string,
    )
  },
  estimateSize: _programEstimateSize,
  serialize: _programSerialize,
  deserialize: _programDeserialize,
  deserializeProp: _programDeserializeProp,
  idName: r'id',
  indexes: {
    r'abbreviation': IndexSchema(
      id: 8242173811669365471,
      name: r'abbreviation',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'abbreviation',
          type: IndexType.hash,
          caseSensitive: false,
        )
      ],
    ),
    r'enabled': IndexSchema(
      id: -4605800638041043998,
      name: r'enabled',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'enabled',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'player': LinkSchema(
      id: -3048473050562855308,
      name: r'player',
      target: r'Player',
      single: true,
      linkName: r'program',
    )
  },
  embeddedSchemas: {},
  getId: _programGetId,
  getLinks: _programGetLinks,
  attach: _programAttach,
  version: '3.0.5',
);

int _programEstimateSize(
  Program object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.abbreviation.length * 3;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.image.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.script.length * 3;
  bytesCount += 3 + object.values.length * 3;
  return bytesCount;
}

void _programSerialize(
  Program object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.abbreviation);
  writer.writeString(offsets[1], object.description);
  writer.writeBool(offsets[2], object.enabled);
  writer.writeString(offsets[3], object.image);
  writer.writeString(offsets[4], object.name);
  writer.writeByte(offsets[5], object.programOptions.index);
  writer.writeLong(offsets[6], object.score);
  writer.writeString(offsets[7], object.script);
  writer.writeString(offsets[8], object.values);
}

Program _programDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Program();
  object.abbreviation = reader.readString(offsets[0]);
  object.description = reader.readStringOrNull(offsets[1]);
  object.enabled = reader.readBool(offsets[2]);
  object.id = id;
  object.image = reader.readString(offsets[3]);
  object.name = reader.readString(offsets[4]);
  object.programOptions =
      _ProgramprogramOptionsValueEnumMap[reader.readByteOrNull(offsets[5])] ??
          ProgramOptions.dcOptions;
  object.score = reader.readLong(offsets[6]);
  object.script = reader.readString(offsets[7]);
  object.values = reader.readString(offsets[8]);
  return object;
}

P _programDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (_ProgramprogramOptionsValueEnumMap[
              reader.readByteOrNull(offset)] ??
          ProgramOptions.dcOptions) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ProgramprogramOptionsEnumValueMap = {
  'dcOptions': 0,
  'tcOptions': 1,
  'fcOptions': 2,
  'rcOptions': 3,
  'miopOptions': 4,
};
const _ProgramprogramOptionsValueEnumMap = {
  0: ProgramOptions.dcOptions,
  1: ProgramOptions.tcOptions,
  2: ProgramOptions.fcOptions,
  3: ProgramOptions.rcOptions,
  4: ProgramOptions.miopOptions,
};

Id _programGetId(Program object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _programGetLinks(Program object) {
  return [object.player];
}

void _programAttach(IsarCollection<dynamic> col, Id id, Program object) {
  object.id = id;
  object.player.attach(col, col.isar.collection<Player>(), r'player', id);
}

extension ProgramByIndex on IsarCollection<Program> {
  Future<Program?> getByAbbreviation(String abbreviation) {
    return getByIndex(r'abbreviation', [abbreviation]);
  }

  Program? getByAbbreviationSync(String abbreviation) {
    return getByIndexSync(r'abbreviation', [abbreviation]);
  }

  Future<bool> deleteByAbbreviation(String abbreviation) {
    return deleteByIndex(r'abbreviation', [abbreviation]);
  }

  bool deleteByAbbreviationSync(String abbreviation) {
    return deleteByIndexSync(r'abbreviation', [abbreviation]);
  }

  Future<List<Program?>> getAllByAbbreviation(List<String> abbreviationValues) {
    final values = abbreviationValues.map((e) => [e]).toList();
    return getAllByIndex(r'abbreviation', values);
  }

  List<Program?> getAllByAbbreviationSync(List<String> abbreviationValues) {
    final values = abbreviationValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'abbreviation', values);
  }

  Future<int> deleteAllByAbbreviation(List<String> abbreviationValues) {
    final values = abbreviationValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'abbreviation', values);
  }

  int deleteAllByAbbreviationSync(List<String> abbreviationValues) {
    final values = abbreviationValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'abbreviation', values);
  }

  Future<Id> putByAbbreviation(Program object) {
    return putByIndex(r'abbreviation', object);
  }

  Id putByAbbreviationSync(Program object, {bool saveLinks = true}) {
    return putByIndexSync(r'abbreviation', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByAbbreviation(List<Program> objects) {
    return putAllByIndex(r'abbreviation', objects);
  }

  List<Id> putAllByAbbreviationSync(List<Program> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'abbreviation', objects, saveLinks: saveLinks);
  }

  Future<Program?> getByName(String name) {
    return getByIndex(r'name', [name]);
  }

  Program? getByNameSync(String name) {
    return getByIndexSync(r'name', [name]);
  }

  Future<bool> deleteByName(String name) {
    return deleteByIndex(r'name', [name]);
  }

  bool deleteByNameSync(String name) {
    return deleteByIndexSync(r'name', [name]);
  }

  Future<List<Program?>> getAllByName(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return getAllByIndex(r'name', values);
  }

  List<Program?> getAllByNameSync(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'name', values);
  }

  Future<int> deleteAllByName(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'name', values);
  }

  int deleteAllByNameSync(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'name', values);
  }

  Future<Id> putByName(Program object) {
    return putByIndex(r'name', object);
  }

  Id putByNameSync(Program object, {bool saveLinks = true}) {
    return putByIndexSync(r'name', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByName(List<Program> objects) {
    return putAllByIndex(r'name', objects);
  }

  List<Id> putAllByNameSync(List<Program> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'name', objects, saveLinks: saveLinks);
  }
}

extension ProgramQueryWhereSort on QueryBuilder<Program, Program, QWhere> {
  QueryBuilder<Program, Program, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Program, Program, QAfterWhere> anyEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'enabled'),
      );
    });
  }
}

extension ProgramQueryWhere on QueryBuilder<Program, Program, QWhereClause> {
  QueryBuilder<Program, Program, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Program, Program, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Program, Program, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Program, Program, QAfterWhereClause> idBetween(
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

  QueryBuilder<Program, Program, QAfterWhereClause> abbreviationEqualTo(
      String abbreviation) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'abbreviation',
        value: [abbreviation],
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterWhereClause> abbreviationNotEqualTo(
      String abbreviation) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'abbreviation',
              lower: [],
              upper: [abbreviation],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'abbreviation',
              lower: [abbreviation],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'abbreviation',
              lower: [abbreviation],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'abbreviation',
              lower: [],
              upper: [abbreviation],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Program, Program, QAfterWhereClause> enabledEqualTo(
      bool enabled) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'enabled',
        value: [enabled],
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterWhereClause> enabledNotEqualTo(
      bool enabled) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'enabled',
              lower: [],
              upper: [enabled],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'enabled',
              lower: [enabled],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'enabled',
              lower: [enabled],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'enabled',
              lower: [],
              upper: [enabled],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Program, Program, QAfterWhereClause> nameEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterWhereClause> nameNotEqualTo(
      String name) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ProgramQueryFilter
    on QueryBuilder<Program, Program, QFilterCondition> {
  QueryBuilder<Program, Program, QAfterFilterCondition> abbreviationEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'abbreviation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> abbreviationGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'abbreviation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> abbreviationLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'abbreviation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> abbreviationBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'abbreviation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> abbreviationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'abbreviation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> abbreviationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'abbreviation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> abbreviationContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'abbreviation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> abbreviationMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'abbreviation',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> abbreviationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'abbreviation',
        value: '',
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition>
      abbreviationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'abbreviation',
        value: '',
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> descriptionEqualTo(
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

  QueryBuilder<Program, Program, QAfterFilterCondition> descriptionGreaterThan(
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

  QueryBuilder<Program, Program, QAfterFilterCondition> descriptionLessThan(
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

  QueryBuilder<Program, Program, QAfterFilterCondition> descriptionBetween(
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

  QueryBuilder<Program, Program, QAfterFilterCondition> descriptionStartsWith(
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

  QueryBuilder<Program, Program, QAfterFilterCondition> descriptionEndsWith(
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

  QueryBuilder<Program, Program, QAfterFilterCondition> descriptionContains(
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

  QueryBuilder<Program, Program, QAfterFilterCondition> descriptionMatches(
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

  QueryBuilder<Program, Program, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> enabledEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enabled',
        value: value,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> idGreaterThan(
    Id value, {
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

  QueryBuilder<Program, Program, QAfterFilterCondition> idLessThan(
    Id value, {
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

  QueryBuilder<Program, Program, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
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

  QueryBuilder<Program, Program, QAfterFilterCondition> imageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> imageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> imageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> imageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'image',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> imageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> imageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> imageContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> imageMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'image',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> imageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'image',
        value: '',
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> imageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'image',
        value: '',
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> programOptionsEqualTo(
      ProgramOptions value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'programOptions',
        value: value,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition>
      programOptionsGreaterThan(
    ProgramOptions value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'programOptions',
        value: value,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> programOptionsLessThan(
    ProgramOptions value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'programOptions',
        value: value,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> programOptionsBetween(
    ProgramOptions lower,
    ProgramOptions upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'programOptions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> scoreEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'score',
        value: value,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> scoreGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'score',
        value: value,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> scoreLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'score',
        value: value,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> scoreBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'score',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> scriptEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'script',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> scriptGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'script',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> scriptLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'script',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> scriptBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'script',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> scriptStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'script',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> scriptEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'script',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> scriptContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'script',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> scriptMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'script',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> scriptIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'script',
        value: '',
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> scriptIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'script',
        value: '',
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> valuesEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'values',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> valuesGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'values',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> valuesLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'values',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> valuesBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'values',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> valuesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'values',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> valuesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'values',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> valuesContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'values',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> valuesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'values',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> valuesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'values',
        value: '',
      ));
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> valuesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'values',
        value: '',
      ));
    });
  }
}

extension ProgramQueryObject
    on QueryBuilder<Program, Program, QFilterCondition> {}

extension ProgramQueryLinks
    on QueryBuilder<Program, Program, QFilterCondition> {
  QueryBuilder<Program, Program, QAfterFilterCondition> player(
      FilterQuery<Player> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'player');
    });
  }

  QueryBuilder<Program, Program, QAfterFilterCondition> playerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'player', 0, true, 0, true);
    });
  }
}

extension ProgramQuerySortBy on QueryBuilder<Program, Program, QSortBy> {
  QueryBuilder<Program, Program, QAfterSortBy> sortByAbbreviation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'abbreviation', Sort.asc);
    });
  }

  QueryBuilder<Program, Program, QAfterSortBy> sortByAbbreviationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'abbreviation', Sort.desc);
    });
  }

  QueryBuilder<Program, Program, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Program, Program, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Program, Program, QAfterSortBy> sortByEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabled', Sort.asc);
    });
  }

  QueryBuilder<Program, Program, QAfterSortBy> sortByEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabled', Sort.desc);
    });
  }

  QueryBuilder<Program, Program, QAfterSortBy> sortByImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.asc);
    });
  }

  QueryBuilder<Program, Program, QAfterSortBy> sortByImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.desc);
    });
  }

  QueryBuilder<Program, Program, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Program, Program, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Program, Program, QAfterSortBy> sortByProgramOptions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'programOptions', Sort.asc);
    });
  }

  QueryBuilder<Program, Program, QAfterSortBy> sortByProgramOptionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'programOptions', Sort.desc);
    });
  }

  QueryBuilder<Program, Program, QAfterSortBy> sortByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.asc);
    });
  }

  QueryBuilder<Program, Program, QAfterSortBy> sortByScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.desc);
    });
  }

  QueryBuilder<Program, Program, QAfterSortBy> sortByScript() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'script', Sort.asc);
    });
  }

  QueryBuilder<Program, Program, QAfterSortBy> sortByScriptDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'script', Sort.desc);
    });
  }

  QueryBuilder<Program, Program, QAfterSortBy> sortByValues() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'values', Sort.asc);
    });
  }

  QueryBuilder<Program, Program, QAfterSortBy> sortByValuesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'values', Sort.desc);
    });
  }
}

extension ProgramQuerySortThenBy
    on QueryBuilder<Program, Program, QSortThenBy> {
  QueryBuilder<Program, Program, QAfterSortBy> thenByAbbreviation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'abbreviation', Sort.asc);
    });
  }

  QueryBuilder<Program, Program, QAfterSortBy> thenByAbbreviationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'abbreviation', Sort.desc);
    });
  }

  QueryBuilder<Program, Program, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Program, Program, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Program, Program, QAfterSortBy> thenByEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabled', Sort.asc);
    });
  }

  QueryBuilder<Program, Program, QAfterSortBy> thenByEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabled', Sort.desc);
    });
  }

  QueryBuilder<Program, Program, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Program, Program, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Program, Program, QAfterSortBy> thenByImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.asc);
    });
  }

  QueryBuilder<Program, Program, QAfterSortBy> thenByImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.desc);
    });
  }

  QueryBuilder<Program, Program, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Program, Program, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Program, Program, QAfterSortBy> thenByProgramOptions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'programOptions', Sort.asc);
    });
  }

  QueryBuilder<Program, Program, QAfterSortBy> thenByProgramOptionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'programOptions', Sort.desc);
    });
  }

  QueryBuilder<Program, Program, QAfterSortBy> thenByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.asc);
    });
  }

  QueryBuilder<Program, Program, QAfterSortBy> thenByScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.desc);
    });
  }

  QueryBuilder<Program, Program, QAfterSortBy> thenByScript() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'script', Sort.asc);
    });
  }

  QueryBuilder<Program, Program, QAfterSortBy> thenByScriptDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'script', Sort.desc);
    });
  }

  QueryBuilder<Program, Program, QAfterSortBy> thenByValues() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'values', Sort.asc);
    });
  }

  QueryBuilder<Program, Program, QAfterSortBy> thenByValuesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'values', Sort.desc);
    });
  }
}

extension ProgramQueryWhereDistinct
    on QueryBuilder<Program, Program, QDistinct> {
  QueryBuilder<Program, Program, QDistinct> distinctByAbbreviation(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'abbreviation', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Program, Program, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Program, Program, QDistinct> distinctByEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enabled');
    });
  }

  QueryBuilder<Program, Program, QDistinct> distinctByImage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'image', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Program, Program, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Program, Program, QDistinct> distinctByProgramOptions() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'programOptions');
    });
  }

  QueryBuilder<Program, Program, QDistinct> distinctByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'score');
    });
  }

  QueryBuilder<Program, Program, QDistinct> distinctByScript(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'script', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Program, Program, QDistinct> distinctByValues(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'values', caseSensitive: caseSensitive);
    });
  }
}

extension ProgramQueryProperty
    on QueryBuilder<Program, Program, QQueryProperty> {
  QueryBuilder<Program, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Program, String, QQueryOperations> abbreviationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'abbreviation');
    });
  }

  QueryBuilder<Program, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<Program, bool, QQueryOperations> enabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enabled');
    });
  }

  QueryBuilder<Program, String, QQueryOperations> imageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'image');
    });
  }

  QueryBuilder<Program, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Program, ProgramOptions, QQueryOperations>
      programOptionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'programOptions');
    });
  }

  QueryBuilder<Program, int, QQueryOperations> scoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'score');
    });
  }

  QueryBuilder<Program, String, QQueryOperations> scriptProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'script');
    });
  }

  QueryBuilder<Program, String, QQueryOperations> valuesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'values');
    });
  }
}
