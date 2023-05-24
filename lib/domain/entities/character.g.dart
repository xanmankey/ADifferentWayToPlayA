// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetCharacterCollection on Isar {
  IsarCollection<Character> get characters => this.collection();
}

const CharacterSchema = CollectionSchema(
  name: r'Character',
  id: 4658184409279959047,
  properties: {
    r'age': PropertySchema(
      id: 0,
      name: r'age',
      type: IsarType.long,
    ),
    r'color': PropertySchema(
      id: 1,
      name: r'color',
      type: IsarType.long,
    ),
    r'description': PropertySchema(
      id: 2,
      name: r'description',
      type: IsarType.string,
    ),
    r'hit': PropertySchema(
      id: 3,
      name: r'hit',
      type: IsarType.string,
    ),
    r'image': PropertySchema(
      id: 4,
      name: r'image',
      type: IsarType.string,
    ),
    r'matchesPlayed': PropertySchema(
      id: 5,
      name: r'matchesPlayed',
      type: IsarType.long,
    ),
    r'matchesWon': PropertySchema(
      id: 6,
      name: r'matchesWon',
      type: IsarType.long,
    ),
    r'miss': PropertySchema(
      id: 7,
      name: r'miss',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 8,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _characterEstimateSize,
  serialize: _characterSerialize,
  deserialize: _characterDeserialize,
  deserializeProp: _characterDeserializeProp,
  idName: r'id',
  indexes: {
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.hash,
          caseSensitive: false,
        )
      ],
    ),
    r'age': IndexSchema(
      id: 548969265645285521,
      name: r'age',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'age',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'color': IndexSchema(
      id: 880366885425937065,
      name: r'color',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'color',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'matchesPlayed': IndexSchema(
      id: -7455529411281231777,
      name: r'matchesPlayed',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'matchesPlayed',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'matchesWon': IndexSchema(
      id: -3928586518888013116,
      name: r'matchesWon',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'matchesWon',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {
    r'player': LinkSchema(
      id: -5121079739277691024,
      name: r'player',
      target: r'Player',
      single: false,
      linkName: r'character',
    )
  },
  embeddedSchemas: {},
  getId: _characterGetId,
  getLinks: _characterGetLinks,
  attach: _characterAttach,
  version: '3.0.5',
);

int _characterEstimateSize(
  Character object,
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
    final value = object.hit;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.image.length * 3;
  {
    final value = object.miss;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _characterSerialize(
  Character object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.age);
  writer.writeLong(offsets[1], object.color);
  writer.writeString(offsets[2], object.description);
  writer.writeString(offsets[3], object.hit);
  writer.writeString(offsets[4], object.image);
  writer.writeLong(offsets[5], object.matchesPlayed);
  writer.writeLong(offsets[6], object.matchesWon);
  writer.writeString(offsets[7], object.miss);
  writer.writeString(offsets[8], object.name);
}

Character _characterDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Character();
  object.age = reader.readLongOrNull(offsets[0]);
  object.color = reader.readLongOrNull(offsets[1]);
  object.description = reader.readStringOrNull(offsets[2]);
  object.hit = reader.readStringOrNull(offsets[3]);
  object.id = id;
  object.image = reader.readString(offsets[4]);
  object.matchesPlayed = reader.readLong(offsets[5]);
  object.matchesWon = reader.readLong(offsets[6]);
  object.miss = reader.readStringOrNull(offsets[7]);
  object.name = reader.readString(offsets[8]);
  return object;
}

P _characterDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _characterGetId(Character object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _characterGetLinks(Character object) {
  return [object.player];
}

void _characterAttach(IsarCollection<dynamic> col, Id id, Character object) {
  object.id = id;
  object.player.attach(col, col.isar.collection<Player>(), r'player', id);
}

extension CharacterByIndex on IsarCollection<Character> {
  Future<Character?> getByName(String name) {
    return getByIndex(r'name', [name]);
  }

  Character? getByNameSync(String name) {
    return getByIndexSync(r'name', [name]);
  }

  Future<bool> deleteByName(String name) {
    return deleteByIndex(r'name', [name]);
  }

  bool deleteByNameSync(String name) {
    return deleteByIndexSync(r'name', [name]);
  }

  Future<List<Character?>> getAllByName(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return getAllByIndex(r'name', values);
  }

  List<Character?> getAllByNameSync(List<String> nameValues) {
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

  Future<Id> putByName(Character object) {
    return putByIndex(r'name', object);
  }

  Id putByNameSync(Character object, {bool saveLinks = true}) {
    return putByIndexSync(r'name', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByName(List<Character> objects) {
    return putAllByIndex(r'name', objects);
  }

  List<Id> putAllByNameSync(List<Character> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'name', objects, saveLinks: saveLinks);
  }
}

extension CharacterQueryWhereSort
    on QueryBuilder<Character, Character, QWhere> {
  QueryBuilder<Character, Character, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Character, Character, QAfterWhere> anyAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'age'),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterWhere> anyColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'color'),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterWhere> anyMatchesPlayed() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'matchesPlayed'),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterWhere> anyMatchesWon() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'matchesWon'),
      );
    });
  }
}

extension CharacterQueryWhere
    on QueryBuilder<Character, Character, QWhereClause> {
  QueryBuilder<Character, Character, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Character, Character, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> idBetween(
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

  QueryBuilder<Character, Character, QAfterWhereClause> nameEqualTo(
      String name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> nameNotEqualTo(
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

  QueryBuilder<Character, Character, QAfterWhereClause> ageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'age',
        value: [null],
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> ageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'age',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> ageEqualTo(int? age) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'age',
        value: [age],
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> ageNotEqualTo(
      int? age) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'age',
              lower: [],
              upper: [age],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'age',
              lower: [age],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'age',
              lower: [age],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'age',
              lower: [],
              upper: [age],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> ageGreaterThan(
    int? age, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'age',
        lower: [age],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> ageLessThan(
    int? age, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'age',
        lower: [],
        upper: [age],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> ageBetween(
    int? lowerAge,
    int? upperAge, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'age',
        lower: [lowerAge],
        includeLower: includeLower,
        upper: [upperAge],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> colorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'color',
        value: [null],
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> colorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'color',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> colorEqualTo(
      int? color) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'color',
        value: [color],
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> colorNotEqualTo(
      int? color) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'color',
              lower: [],
              upper: [color],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'color',
              lower: [color],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'color',
              lower: [color],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'color',
              lower: [],
              upper: [color],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> colorGreaterThan(
    int? color, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'color',
        lower: [color],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> colorLessThan(
    int? color, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'color',
        lower: [],
        upper: [color],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> colorBetween(
    int? lowerColor,
    int? upperColor, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'color',
        lower: [lowerColor],
        includeLower: includeLower,
        upper: [upperColor],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> matchesPlayedEqualTo(
      int matchesPlayed) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'matchesPlayed',
        value: [matchesPlayed],
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> matchesPlayedNotEqualTo(
      int matchesPlayed) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'matchesPlayed',
              lower: [],
              upper: [matchesPlayed],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'matchesPlayed',
              lower: [matchesPlayed],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'matchesPlayed',
              lower: [matchesPlayed],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'matchesPlayed',
              lower: [],
              upper: [matchesPlayed],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause>
      matchesPlayedGreaterThan(
    int matchesPlayed, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'matchesPlayed',
        lower: [matchesPlayed],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> matchesPlayedLessThan(
    int matchesPlayed, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'matchesPlayed',
        lower: [],
        upper: [matchesPlayed],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> matchesPlayedBetween(
    int lowerMatchesPlayed,
    int upperMatchesPlayed, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'matchesPlayed',
        lower: [lowerMatchesPlayed],
        includeLower: includeLower,
        upper: [upperMatchesPlayed],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> matchesWonEqualTo(
      int matchesWon) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'matchesWon',
        value: [matchesWon],
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> matchesWonNotEqualTo(
      int matchesWon) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'matchesWon',
              lower: [],
              upper: [matchesWon],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'matchesWon',
              lower: [matchesWon],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'matchesWon',
              lower: [matchesWon],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'matchesWon',
              lower: [],
              upper: [matchesWon],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> matchesWonGreaterThan(
    int matchesWon, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'matchesWon',
        lower: [matchesWon],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> matchesWonLessThan(
    int matchesWon, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'matchesWon',
        lower: [],
        upper: [matchesWon],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> matchesWonBetween(
    int lowerMatchesWon,
    int upperMatchesWon, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'matchesWon',
        lower: [lowerMatchesWon],
        includeLower: includeLower,
        upper: [upperMatchesWon],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CharacterQueryFilter
    on QueryBuilder<Character, Character, QFilterCondition> {
  QueryBuilder<Character, Character, QAfterFilterCondition> ageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'age',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> ageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'age',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> ageEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'age',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> ageGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'age',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> ageLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'age',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> ageBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'age',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> colorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'color',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> colorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'color',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> colorEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'color',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> colorGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'color',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> colorLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'color',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> colorBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'color',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> descriptionEqualTo(
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

  QueryBuilder<Character, Character, QAfterFilterCondition>
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

  QueryBuilder<Character, Character, QAfterFilterCondition> descriptionLessThan(
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

  QueryBuilder<Character, Character, QAfterFilterCondition> descriptionBetween(
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

  QueryBuilder<Character, Character, QAfterFilterCondition>
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

  QueryBuilder<Character, Character, QAfterFilterCondition> descriptionEndsWith(
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

  QueryBuilder<Character, Character, QAfterFilterCondition> descriptionContains(
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

  QueryBuilder<Character, Character, QAfterFilterCondition> descriptionMatches(
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

  QueryBuilder<Character, Character, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> hitIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hit',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> hitIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hit',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> hitEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> hitGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> hitLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> hitBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> hitStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> hitEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> hitContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> hitMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hit',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> hitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hit',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> hitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hit',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Character, Character, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Character, Character, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Character, Character, QAfterFilterCondition> imageEqualTo(
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

  QueryBuilder<Character, Character, QAfterFilterCondition> imageGreaterThan(
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

  QueryBuilder<Character, Character, QAfterFilterCondition> imageLessThan(
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

  QueryBuilder<Character, Character, QAfterFilterCondition> imageBetween(
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

  QueryBuilder<Character, Character, QAfterFilterCondition> imageStartsWith(
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

  QueryBuilder<Character, Character, QAfterFilterCondition> imageEndsWith(
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

  QueryBuilder<Character, Character, QAfterFilterCondition> imageContains(
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

  QueryBuilder<Character, Character, QAfterFilterCondition> imageMatches(
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

  QueryBuilder<Character, Character, QAfterFilterCondition> imageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'image',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> imageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'image',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      matchesPlayedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'matchesPlayed',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      matchesPlayedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'matchesPlayed',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      matchesPlayedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'matchesPlayed',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      matchesPlayedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'matchesPlayed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> matchesWonEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'matchesWon',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      matchesWonGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'matchesWon',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> matchesWonLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'matchesWon',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> matchesWonBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'matchesWon',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> missIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'miss',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> missIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'miss',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> missEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'miss',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> missGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'miss',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> missLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'miss',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> missBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'miss',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> missStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'miss',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> missEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'miss',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> missContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'miss',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> missMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'miss',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> missIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'miss',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> missIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'miss',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Character, Character, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Character, Character, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Character, Character, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Character, Character, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Character, Character, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Character, Character, QAfterFilterCondition> nameContains(
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

  QueryBuilder<Character, Character, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<Character, Character, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension CharacterQueryObject
    on QueryBuilder<Character, Character, QFilterCondition> {}

extension CharacterQueryLinks
    on QueryBuilder<Character, Character, QFilterCondition> {
  QueryBuilder<Character, Character, QAfterFilterCondition> player(
      FilterQuery<Player> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'player');
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> playerLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'player', length, true, length, true);
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> playerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'player', 0, true, 0, true);
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> playerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'player', 0, false, 999999, true);
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      playerLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'player', 0, true, length, include);
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      playerLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'player', length, include, 999999, true);
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> playerLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'player', lower, includeLower, upper, includeUpper);
    });
  }
}

extension CharacterQuerySortBy on QueryBuilder<Character, Character, QSortBy> {
  QueryBuilder<Character, Character, QAfterSortBy> sortByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByAgeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByHit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hit', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByHitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hit', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByMatchesPlayed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matchesPlayed', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByMatchesPlayedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matchesPlayed', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByMatchesWon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matchesWon', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByMatchesWonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matchesWon', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByMiss() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'miss', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByMissDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'miss', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension CharacterQuerySortThenBy
    on QueryBuilder<Character, Character, QSortThenBy> {
  QueryBuilder<Character, Character, QAfterSortBy> thenByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByAgeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByHit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hit', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByHitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hit', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByMatchesPlayed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matchesPlayed', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByMatchesPlayedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matchesPlayed', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByMatchesWon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matchesWon', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByMatchesWonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matchesWon', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByMiss() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'miss', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByMissDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'miss', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension CharacterQueryWhereDistinct
    on QueryBuilder<Character, Character, QDistinct> {
  QueryBuilder<Character, Character, QDistinct> distinctByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'age');
    });
  }

  QueryBuilder<Character, Character, QDistinct> distinctByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'color');
    });
  }

  QueryBuilder<Character, Character, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Character, Character, QDistinct> distinctByHit(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hit', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Character, Character, QDistinct> distinctByImage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'image', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Character, Character, QDistinct> distinctByMatchesPlayed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'matchesPlayed');
    });
  }

  QueryBuilder<Character, Character, QDistinct> distinctByMatchesWon() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'matchesWon');
    });
  }

  QueryBuilder<Character, Character, QDistinct> distinctByMiss(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'miss', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Character, Character, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension CharacterQueryProperty
    on QueryBuilder<Character, Character, QQueryProperty> {
  QueryBuilder<Character, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Character, int?, QQueryOperations> ageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'age');
    });
  }

  QueryBuilder<Character, int?, QQueryOperations> colorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'color');
    });
  }

  QueryBuilder<Character, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<Character, String?, QQueryOperations> hitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hit');
    });
  }

  QueryBuilder<Character, String, QQueryOperations> imageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'image');
    });
  }

  QueryBuilder<Character, int, QQueryOperations> matchesPlayedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'matchesPlayed');
    });
  }

  QueryBuilder<Character, int, QQueryOperations> matchesWonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'matchesWon');
    });
  }

  QueryBuilder<Character, String?, QQueryOperations> missProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'miss');
    });
  }

  QueryBuilder<Character, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}
