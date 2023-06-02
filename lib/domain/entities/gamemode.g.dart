// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gamemode.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetGamemodeCollection on Isar {
  IsarCollection<Gamemode> get gamemodes => this.collection();
}

const GamemodeSchema = CollectionSchema(
  name: r'Gamemode',
  id: -743387943824840136,
  properties: {
    r'hashCode': PropertySchema(
      id: 0,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'image': PropertySchema(
      id: 1,
      name: r'image',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    ),
    r'teams': PropertySchema(
      id: 3,
      name: r'teams',
      type: IsarType.bool,
    ),
    r'timesPlayed': PropertySchema(
      id: 4,
      name: r'timesPlayed',
      type: IsarType.long,
    )
  },
  estimateSize: _gamemodeEstimateSize,
  serialize: _gamemodeSerialize,
  deserialize: _gamemodeDeserialize,
  deserializeProp: _gamemodeDeserializeProp,
  idName: r'id',
  indexes: {
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.hash,
          caseSensitive: false,
        )
      ],
    ),
    r'timesPlayed': IndexSchema(
      id: 7766255773319790358,
      name: r'timesPlayed',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'timesPlayed',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'teams': IndexSchema(
      id: -1291517212919527017,
      name: r'teams',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'teams',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {
    r'players': LinkSchema(
      id: -7430248874211053004,
      name: r'players',
      target: r'Player',
      single: false,
    ),
    r'settings': LinkSchema(
      id: 9012956140367106906,
      name: r'settings',
      target: r'Setting',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _gamemodeGetId,
  getLinks: _gamemodeGetLinks,
  attach: _gamemodeAttach,
  version: '3.0.5',
);

int _gamemodeEstimateSize(
  Gamemode object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.image;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _gamemodeSerialize(
  Gamemode object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.hashCode);
  writer.writeString(offsets[1], object.image);
  writer.writeString(offsets[2], object.name);
  writer.writeBool(offsets[3], object.teams);
  writer.writeLong(offsets[4], object.timesPlayed);
}

Gamemode _gamemodeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Gamemode();
  object.id = id;
  object.image = reader.readStringOrNull(offsets[1]);
  object.name = reader.readString(offsets[2]);
  object.teams = reader.readBoolOrNull(offsets[3]);
  object.timesPlayed = reader.readLong(offsets[4]);
  return object;
}

P _gamemodeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _gamemodeGetId(Gamemode object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _gamemodeGetLinks(Gamemode object) {
  return [object.players, object.settings];
}

void _gamemodeAttach(IsarCollection<dynamic> col, Id id, Gamemode object) {
  object.id = id;
  object.players.attach(col, col.isar.collection<Player>(), r'players', id);
  object.settings.attach(col, col.isar.collection<Setting>(), r'settings', id);
}

extension GamemodeByIndex on IsarCollection<Gamemode> {
  Future<Gamemode?> getByName(String name) {
    return getByIndex(r'name', [name]);
  }

  Gamemode? getByNameSync(String name) {
    return getByIndexSync(r'name', [name]);
  }

  Future<bool> deleteByName(String name) {
    return deleteByIndex(r'name', [name]);
  }

  bool deleteByNameSync(String name) {
    return deleteByIndexSync(r'name', [name]);
  }

  Future<List<Gamemode?>> getAllByName(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return getAllByIndex(r'name', values);
  }

  List<Gamemode?> getAllByNameSync(List<String> nameValues) {
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

  Future<Id> putByName(Gamemode object) {
    return putByIndex(r'name', object);
  }

  Id putByNameSync(Gamemode object, {bool saveLinks = true}) {
    return putByIndexSync(r'name', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByName(List<Gamemode> objects) {
    return putAllByIndex(r'name', objects);
  }

  List<Id> putAllByNameSync(List<Gamemode> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'name', objects, saveLinks: saveLinks);
  }
}

extension GamemodeQueryWhereSort on QueryBuilder<Gamemode, Gamemode, QWhere> {
  QueryBuilder<Gamemode, Gamemode, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterWhere> anyTimesPlayed() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'timesPlayed'),
      );
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterWhere> anyTeams() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'teams'),
      );
    });
  }
}

extension GamemodeQueryWhere on QueryBuilder<Gamemode, Gamemode, QWhereClause> {
  QueryBuilder<Gamemode, Gamemode, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Gamemode, Gamemode, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterWhereClause> idBetween(
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

  QueryBuilder<Gamemode, Gamemode, QAfterWhereClause> nameEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterWhereClause> nameNotEqualTo(
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

  QueryBuilder<Gamemode, Gamemode, QAfterWhereClause> timesPlayedEqualTo(
      int timesPlayed) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'timesPlayed',
        value: [timesPlayed],
      ));
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterWhereClause> timesPlayedNotEqualTo(
      int timesPlayed) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'timesPlayed',
              lower: [],
              upper: [timesPlayed],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'timesPlayed',
              lower: [timesPlayed],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'timesPlayed',
              lower: [timesPlayed],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'timesPlayed',
              lower: [],
              upper: [timesPlayed],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterWhereClause> timesPlayedGreaterThan(
    int timesPlayed, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'timesPlayed',
        lower: [timesPlayed],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterWhereClause> timesPlayedLessThan(
    int timesPlayed, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'timesPlayed',
        lower: [],
        upper: [timesPlayed],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterWhereClause> timesPlayedBetween(
    int lowerTimesPlayed,
    int upperTimesPlayed, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'timesPlayed',
        lower: [lowerTimesPlayed],
        includeLower: includeLower,
        upper: [upperTimesPlayed],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterWhereClause> teamsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'teams',
        value: [null],
      ));
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterWhereClause> teamsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'teams',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterWhereClause> teamsEqualTo(
      bool? teams) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'teams',
        value: [teams],
      ));
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterWhereClause> teamsNotEqualTo(
      bool? teams) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'teams',
              lower: [],
              upper: [teams],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'teams',
              lower: [teams],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'teams',
              lower: [teams],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'teams',
              lower: [],
              upper: [teams],
              includeUpper: false,
            ));
      }
    });
  }
}

extension GamemodeQueryFilter
    on QueryBuilder<Gamemode, Gamemode, QFilterCondition> {
  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> hashCodeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> hashCodeGreaterThan(
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

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> hashCodeLessThan(
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

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> hashCodeBetween(
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

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> imageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'image',
      ));
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> imageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'image',
      ));
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> imageEqualTo(
    String? value, {
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

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> imageGreaterThan(
    String? value, {
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

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> imageLessThan(
    String? value, {
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

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> imageBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> imageStartsWith(
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

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> imageEndsWith(
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

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> imageContains(
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

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> imageMatches(
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

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> imageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'image',
        value: '',
      ));
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> imageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'image',
        value: '',
      ));
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> nameContains(
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

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> teamsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'teams',
      ));
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> teamsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'teams',
      ));
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> teamsEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'teams',
        value: value,
      ));
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> timesPlayedEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timesPlayed',
        value: value,
      ));
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition>
      timesPlayedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timesPlayed',
        value: value,
      ));
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> timesPlayedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timesPlayed',
        value: value,
      ));
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> timesPlayedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timesPlayed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension GamemodeQueryObject
    on QueryBuilder<Gamemode, Gamemode, QFilterCondition> {}

extension GamemodeQueryLinks
    on QueryBuilder<Gamemode, Gamemode, QFilterCondition> {
  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> players(
      FilterQuery<Player> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'players');
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> playersLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'players', length, true, length, true);
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> playersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'players', 0, true, 0, true);
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> playersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'players', 0, false, 999999, true);
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> playersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'players', 0, true, length, include);
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition>
      playersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'players', length, include, 999999, true);
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> playersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'players', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> settings(
      FilterQuery<Setting> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'settings');
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> settingsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'settings', length, true, length, true);
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> settingsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'settings', 0, true, 0, true);
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> settingsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'settings', 0, false, 999999, true);
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition>
      settingsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'settings', 0, true, length, include);
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition>
      settingsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'settings', length, include, 999999, true);
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterFilterCondition> settingsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'settings', lower, includeLower, upper, includeUpper);
    });
  }
}

extension GamemodeQuerySortBy on QueryBuilder<Gamemode, Gamemode, QSortBy> {
  QueryBuilder<Gamemode, Gamemode, QAfterSortBy> sortByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterSortBy> sortByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterSortBy> sortByImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.asc);
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterSortBy> sortByImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.desc);
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterSortBy> sortByTeams() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teams', Sort.asc);
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterSortBy> sortByTeamsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teams', Sort.desc);
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterSortBy> sortByTimesPlayed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timesPlayed', Sort.asc);
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterSortBy> sortByTimesPlayedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timesPlayed', Sort.desc);
    });
  }
}

extension GamemodeQuerySortThenBy
    on QueryBuilder<Gamemode, Gamemode, QSortThenBy> {
  QueryBuilder<Gamemode, Gamemode, QAfterSortBy> thenByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterSortBy> thenByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterSortBy> thenByImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.asc);
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterSortBy> thenByImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.desc);
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterSortBy> thenByTeams() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teams', Sort.asc);
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterSortBy> thenByTeamsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teams', Sort.desc);
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterSortBy> thenByTimesPlayed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timesPlayed', Sort.asc);
    });
  }

  QueryBuilder<Gamemode, Gamemode, QAfterSortBy> thenByTimesPlayedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timesPlayed', Sort.desc);
    });
  }
}

extension GamemodeQueryWhereDistinct
    on QueryBuilder<Gamemode, Gamemode, QDistinct> {
  QueryBuilder<Gamemode, Gamemode, QDistinct> distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }

  QueryBuilder<Gamemode, Gamemode, QDistinct> distinctByImage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'image', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Gamemode, Gamemode, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Gamemode, Gamemode, QDistinct> distinctByTeams() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'teams');
    });
  }

  QueryBuilder<Gamemode, Gamemode, QDistinct> distinctByTimesPlayed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timesPlayed');
    });
  }
}

extension GamemodeQueryProperty
    on QueryBuilder<Gamemode, Gamemode, QQueryProperty> {
  QueryBuilder<Gamemode, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Gamemode, int, QQueryOperations> hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }

  QueryBuilder<Gamemode, String?, QQueryOperations> imageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'image');
    });
  }

  QueryBuilder<Gamemode, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Gamemode, bool?, QQueryOperations> teamsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'teams');
    });
  }

  QueryBuilder<Gamemode, int, QQueryOperations> timesPlayedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timesPlayed');
    });
  }
}
