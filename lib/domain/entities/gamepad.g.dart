// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gamepad.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetGamepadCollection on Isar {
  IsarCollection<Gamepad> get gamepads => this.collection();
}

const GamepadSchema = CollectionSchema(
  name: r'Gamepad',
  id: 5852391766641584395,
  properties: {
    r'color': PropertySchema(
      id: 0,
      name: r'color',
      type: IsarType.long,
    ),
    r'connected': PropertySchema(
      id: 1,
      name: r'connected',
      type: IsarType.bool,
    )
  },
  estimateSize: _gamepadEstimateSize,
  serialize: _gamepadSerialize,
  deserialize: _gamepadDeserialize,
  deserializeProp: _gamepadDeserializeProp,
  idName: r'index',
  indexes: {
    r'connected': IndexSchema(
      id: -3674747827290195073,
      name: r'connected',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'connected',
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
    )
  },
  links: {
    r'player': LinkSchema(
      id: 6628420537653689455,
      name: r'player',
      target: r'Player',
      single: true,
      linkName: r'gamepad',
    )
  },
  embeddedSchemas: {},
  getId: _gamepadGetId,
  getLinks: _gamepadGetLinks,
  attach: _gamepadAttach,
  version: '3.0.5',
);

int _gamepadEstimateSize(
  Gamepad object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _gamepadSerialize(
  Gamepad object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.color);
  writer.writeBool(offsets[1], object.connected);
}

Gamepad _gamepadDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Gamepad();
  object.color = reader.readLong(offsets[0]);
  object.connected = reader.readBool(offsets[1]);
  object.index = id;
  return object;
}

P _gamepadDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _gamepadGetId(Gamepad object) {
  return object.index;
}

List<IsarLinkBase<dynamic>> _gamepadGetLinks(Gamepad object) {
  return [object.player];
}

void _gamepadAttach(IsarCollection<dynamic> col, Id id, Gamepad object) {
  object.index = id;
  object.player.attach(col, col.isar.collection<Player>(), r'player', id);
}

extension GamepadQueryWhereSort on QueryBuilder<Gamepad, Gamepad, QWhere> {
  QueryBuilder<Gamepad, Gamepad, QAfterWhere> anyIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Gamepad, Gamepad, QAfterWhere> anyConnected() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'connected'),
      );
    });
  }

  QueryBuilder<Gamepad, Gamepad, QAfterWhere> anyColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'color'),
      );
    });
  }
}

extension GamepadQueryWhere on QueryBuilder<Gamepad, Gamepad, QWhereClause> {
  QueryBuilder<Gamepad, Gamepad, QAfterWhereClause> indexEqualTo(Id index) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: index,
        upper: index,
      ));
    });
  }

  QueryBuilder<Gamepad, Gamepad, QAfterWhereClause> indexNotEqualTo(Id index) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: index, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: index, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: index, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: index, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Gamepad, Gamepad, QAfterWhereClause> indexGreaterThan(Id index,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: index, includeLower: include),
      );
    });
  }

  QueryBuilder<Gamepad, Gamepad, QAfterWhereClause> indexLessThan(Id index,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: index, includeUpper: include),
      );
    });
  }

  QueryBuilder<Gamepad, Gamepad, QAfterWhereClause> indexBetween(
    Id lowerIndex,
    Id upperIndex, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIndex,
        includeLower: includeLower,
        upper: upperIndex,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Gamepad, Gamepad, QAfterWhereClause> connectedEqualTo(
      bool connected) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'connected',
        value: [connected],
      ));
    });
  }

  QueryBuilder<Gamepad, Gamepad, QAfterWhereClause> connectedNotEqualTo(
      bool connected) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'connected',
              lower: [],
              upper: [connected],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'connected',
              lower: [connected],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'connected',
              lower: [connected],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'connected',
              lower: [],
              upper: [connected],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Gamepad, Gamepad, QAfterWhereClause> colorEqualTo(int color) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'color',
        value: [color],
      ));
    });
  }

  QueryBuilder<Gamepad, Gamepad, QAfterWhereClause> colorNotEqualTo(int color) {
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

  QueryBuilder<Gamepad, Gamepad, QAfterWhereClause> colorGreaterThan(
    int color, {
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

  QueryBuilder<Gamepad, Gamepad, QAfterWhereClause> colorLessThan(
    int color, {
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

  QueryBuilder<Gamepad, Gamepad, QAfterWhereClause> colorBetween(
    int lowerColor,
    int upperColor, {
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
}

extension GamepadQueryFilter
    on QueryBuilder<Gamepad, Gamepad, QFilterCondition> {
  QueryBuilder<Gamepad, Gamepad, QAfterFilterCondition> colorEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'color',
        value: value,
      ));
    });
  }

  QueryBuilder<Gamepad, Gamepad, QAfterFilterCondition> colorGreaterThan(
    int value, {
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

  QueryBuilder<Gamepad, Gamepad, QAfterFilterCondition> colorLessThan(
    int value, {
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

  QueryBuilder<Gamepad, Gamepad, QAfterFilterCondition> colorBetween(
    int lower,
    int upper, {
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

  QueryBuilder<Gamepad, Gamepad, QAfterFilterCondition> connectedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'connected',
        value: value,
      ));
    });
  }

  QueryBuilder<Gamepad, Gamepad, QAfterFilterCondition> indexEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'index',
        value: value,
      ));
    });
  }

  QueryBuilder<Gamepad, Gamepad, QAfterFilterCondition> indexGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'index',
        value: value,
      ));
    });
  }

  QueryBuilder<Gamepad, Gamepad, QAfterFilterCondition> indexLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'index',
        value: value,
      ));
    });
  }

  QueryBuilder<Gamepad, Gamepad, QAfterFilterCondition> indexBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'index',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension GamepadQueryObject
    on QueryBuilder<Gamepad, Gamepad, QFilterCondition> {}

extension GamepadQueryLinks
    on QueryBuilder<Gamepad, Gamepad, QFilterCondition> {
  QueryBuilder<Gamepad, Gamepad, QAfterFilterCondition> player(
      FilterQuery<Player> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'player');
    });
  }

  QueryBuilder<Gamepad, Gamepad, QAfterFilterCondition> playerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'player', 0, true, 0, true);
    });
  }
}

extension GamepadQuerySortBy on QueryBuilder<Gamepad, Gamepad, QSortBy> {
  QueryBuilder<Gamepad, Gamepad, QAfterSortBy> sortByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.asc);
    });
  }

  QueryBuilder<Gamepad, Gamepad, QAfterSortBy> sortByColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.desc);
    });
  }

  QueryBuilder<Gamepad, Gamepad, QAfterSortBy> sortByConnected() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'connected', Sort.asc);
    });
  }

  QueryBuilder<Gamepad, Gamepad, QAfterSortBy> sortByConnectedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'connected', Sort.desc);
    });
  }
}

extension GamepadQuerySortThenBy
    on QueryBuilder<Gamepad, Gamepad, QSortThenBy> {
  QueryBuilder<Gamepad, Gamepad, QAfterSortBy> thenByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.asc);
    });
  }

  QueryBuilder<Gamepad, Gamepad, QAfterSortBy> thenByColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.desc);
    });
  }

  QueryBuilder<Gamepad, Gamepad, QAfterSortBy> thenByConnected() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'connected', Sort.asc);
    });
  }

  QueryBuilder<Gamepad, Gamepad, QAfterSortBy> thenByConnectedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'connected', Sort.desc);
    });
  }

  QueryBuilder<Gamepad, Gamepad, QAfterSortBy> thenByIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'index', Sort.asc);
    });
  }

  QueryBuilder<Gamepad, Gamepad, QAfterSortBy> thenByIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'index', Sort.desc);
    });
  }
}

extension GamepadQueryWhereDistinct
    on QueryBuilder<Gamepad, Gamepad, QDistinct> {
  QueryBuilder<Gamepad, Gamepad, QDistinct> distinctByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'color');
    });
  }

  QueryBuilder<Gamepad, Gamepad, QDistinct> distinctByConnected() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'connected');
    });
  }
}

extension GamepadQueryProperty
    on QueryBuilder<Gamepad, Gamepad, QQueryProperty> {
  QueryBuilder<Gamepad, int, QQueryOperations> indexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'index');
    });
  }

  QueryBuilder<Gamepad, int, QQueryOperations> colorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'color');
    });
  }

  QueryBuilder<Gamepad, bool, QQueryOperations> connectedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'connected');
    });
  }
}
