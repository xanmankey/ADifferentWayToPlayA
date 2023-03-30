// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetSettingCollection on Isar {
  IsarCollection<Setting> get settings => this.collection();
}

const SettingSchema = CollectionSchema(
  name: r'Setting',
  id: 2542600759502230801,
  properties: {
    r'description': PropertySchema(
      id: 0,
      name: r'description',
      type: IsarType.string,
    ),
    r'enabled': PropertySchema(
      id: 1,
      name: r'enabled',
      type: IsarType.bool,
    ),
    r'group': PropertySchema(
      id: 2,
      name: r'group',
      type: IsarType.longList,
    ),
    r'individual': PropertySchema(
      id: 3,
      name: r'individual',
      type: IsarType.bool,
    ),
    r'inputType': PropertySchema(
      id: 4,
      name: r'inputType',
      type: IsarType.int,
      enumMap: _SettinginputTypeEnumValueMap,
    ),
    r'ready': PropertySchema(
      id: 5,
      name: r'ready',
      type: IsarType.bool,
    ),
    r'title': PropertySchema(
      id: 6,
      name: r'title',
      type: IsarType.string,
    ),
    r'values': PropertySchema(
      id: 7,
      name: r'values',
      type: IsarType.string,
    ),
    r'widget': PropertySchema(
      id: 8,
      name: r'widget',
      type: IsarType.byte,
      enumMap: _SettingwidgetEnumValueMap,
    )
  },
  estimateSize: _settingEstimateSize,
  serialize: _settingSerialize,
  deserialize: _settingDeserialize,
  deserializeProp: _settingDeserializeProp,
  idName: r'id',
  indexes: {
    r'title': IndexSchema(
      id: -7636685945352118059,
      name: r'title',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'title',
          type: IndexType.hash,
          caseSensitive: true,
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
    r'individual': IndexSchema(
      id: -7315766375308436363,
      name: r'individual',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'individual',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {
    r'program': LinkSchema(
      id: -9161408576252289800,
      name: r'program',
      target: r'Program',
      single: true,
      linkName: r'settings',
    ),
    r'gamemode': LinkSchema(
      id: -3875359745061251270,
      name: r'gamemode',
      target: r'Gamemode',
      single: true,
      linkName: r'settings',
    )
  },
  embeddedSchemas: {},
  getId: _settingGetId,
  getLinks: _settingGetLinks,
  attach: _settingAttach,
  version: '3.0.5',
);

int _settingEstimateSize(
  Setting object,
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
    final value = object.group;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  bytesCount += 3 + object.title.length * 3;
  bytesCount += 3 + object.values.length * 3;
  return bytesCount;
}

void _settingSerialize(
  Setting object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.description);
  writer.writeBool(offsets[1], object.enabled);
  writer.writeLongList(offsets[2], object.group);
  writer.writeBool(offsets[3], object.individual);
  writer.writeInt(offsets[4], object.inputType?.index);
  writer.writeBool(offsets[5], object.ready);
  writer.writeString(offsets[6], object.title);
  writer.writeString(offsets[7], object.values);
  writer.writeByte(offsets[8], object.widget.index);
}

Setting _settingDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Setting();
  object.description = reader.readStringOrNull(offsets[0]);
  object.enabled = reader.readBool(offsets[1]);
  object.group = reader.readLongList(offsets[2]);
  object.id = id;
  object.individual = reader.readBool(offsets[3]);
  object.inputType =
      _SettinginputTypeValueEnumMap[reader.readIntOrNull(offsets[4])];
  object.ready = reader.readBool(offsets[5]);
  object.title = reader.readString(offsets[6]);
  object.values = reader.readString(offsets[7]);
  object.widget =
      _SettingwidgetValueEnumMap[reader.readByteOrNull(offsets[8])] ??
          SettingsWidgets.checkbox;
  return object;
}

P _settingDeserializeProp<P>(
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
      return (reader.readLongList(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (_SettinginputTypeValueEnumMap[reader.readIntOrNull(offset)]) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (_SettingwidgetValueEnumMap[reader.readByteOrNull(offset)] ??
          SettingsWidgets.checkbox) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _SettinginputTypeEnumValueMap = {
  'button': 0,
  'trigger': 1,
  'stick': 2,
};
const _SettinginputTypeValueEnumMap = {
  0: InputTypes.button,
  1: InputTypes.trigger,
  2: InputTypes.stick,
};
const _SettingwidgetEnumValueMap = {
  'checkbox': 0,
  'card': 1,
  'numField': 2,
  'inputsDropdown': 3,
  'inputTypesDropdown': 4,
  'filtersDropdown': 5,
  'devicesDropdown': 6,
  'layoutDropdown': 7,
  'textField': 8,
};
const _SettingwidgetValueEnumMap = {
  0: SettingsWidgets.checkbox,
  1: SettingsWidgets.card,
  2: SettingsWidgets.numField,
  3: SettingsWidgets.inputsDropdown,
  4: SettingsWidgets.inputTypesDropdown,
  5: SettingsWidgets.filtersDropdown,
  6: SettingsWidgets.devicesDropdown,
  7: SettingsWidgets.layoutDropdown,
  8: SettingsWidgets.textField,
};

Id _settingGetId(Setting object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _settingGetLinks(Setting object) {
  return [object.program, object.gamemode];
}

void _settingAttach(IsarCollection<dynamic> col, Id id, Setting object) {
  object.id = id;
  object.program.attach(col, col.isar.collection<Program>(), r'program', id);
  object.gamemode.attach(col, col.isar.collection<Gamemode>(), r'gamemode', id);
}

extension SettingQueryWhereSort on QueryBuilder<Setting, Setting, QWhere> {
  QueryBuilder<Setting, Setting, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Setting, Setting, QAfterWhere> anyEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'enabled'),
      );
    });
  }

  QueryBuilder<Setting, Setting, QAfterWhere> anyIndividual() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'individual'),
      );
    });
  }
}

extension SettingQueryWhere on QueryBuilder<Setting, Setting, QWhereClause> {
  QueryBuilder<Setting, Setting, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Setting, Setting, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Setting, Setting, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Setting, Setting, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Setting, Setting, QAfterWhereClause> idBetween(
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

  QueryBuilder<Setting, Setting, QAfterWhereClause> titleEqualTo(String title) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'title',
        value: [title],
      ));
    });
  }

  QueryBuilder<Setting, Setting, QAfterWhereClause> titleNotEqualTo(
      String title) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'title',
              lower: [],
              upper: [title],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'title',
              lower: [title],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'title',
              lower: [title],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'title',
              lower: [],
              upper: [title],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Setting, Setting, QAfterWhereClause> enabledEqualTo(
      bool enabled) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'enabled',
        value: [enabled],
      ));
    });
  }

  QueryBuilder<Setting, Setting, QAfterWhereClause> enabledNotEqualTo(
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

  QueryBuilder<Setting, Setting, QAfterWhereClause> individualEqualTo(
      bool individual) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'individual',
        value: [individual],
      ));
    });
  }

  QueryBuilder<Setting, Setting, QAfterWhereClause> individualNotEqualTo(
      bool individual) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'individual',
              lower: [],
              upper: [individual],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'individual',
              lower: [individual],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'individual',
              lower: [individual],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'individual',
              lower: [],
              upper: [individual],
              includeUpper: false,
            ));
      }
    });
  }
}

extension SettingQueryFilter
    on QueryBuilder<Setting, Setting, QFilterCondition> {
  QueryBuilder<Setting, Setting, QAfterFilterCondition> descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> descriptionEqualTo(
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

  QueryBuilder<Setting, Setting, QAfterFilterCondition> descriptionGreaterThan(
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

  QueryBuilder<Setting, Setting, QAfterFilterCondition> descriptionLessThan(
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

  QueryBuilder<Setting, Setting, QAfterFilterCondition> descriptionBetween(
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

  QueryBuilder<Setting, Setting, QAfterFilterCondition> descriptionStartsWith(
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

  QueryBuilder<Setting, Setting, QAfterFilterCondition> descriptionEndsWith(
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

  QueryBuilder<Setting, Setting, QAfterFilterCondition> descriptionContains(
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

  QueryBuilder<Setting, Setting, QAfterFilterCondition> descriptionMatches(
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

  QueryBuilder<Setting, Setting, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> enabledEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enabled',
        value: value,
      ));
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> groupIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'group',
      ));
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> groupIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'group',
      ));
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> groupElementEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'group',
        value: value,
      ));
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> groupElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'group',
        value: value,
      ));
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> groupElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'group',
        value: value,
      ));
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> groupElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'group',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> groupLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'group',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> groupIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'group',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> groupIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'group',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> groupLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'group',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> groupLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'group',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> groupLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'group',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Setting, Setting, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Setting, Setting, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Setting, Setting, QAfterFilterCondition> individualEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'individual',
        value: value,
      ));
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> inputTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'inputType',
      ));
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> inputTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'inputType',
      ));
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> inputTypeEqualTo(
      InputTypes? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inputType',
        value: value,
      ));
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> inputTypeGreaterThan(
    InputTypes? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'inputType',
        value: value,
      ));
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> inputTypeLessThan(
    InputTypes? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'inputType',
        value: value,
      ));
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> inputTypeBetween(
    InputTypes? lower,
    InputTypes? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'inputType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> readyEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ready',
        value: value,
      ));
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> valuesEqualTo(
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

  QueryBuilder<Setting, Setting, QAfterFilterCondition> valuesGreaterThan(
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

  QueryBuilder<Setting, Setting, QAfterFilterCondition> valuesLessThan(
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

  QueryBuilder<Setting, Setting, QAfterFilterCondition> valuesBetween(
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

  QueryBuilder<Setting, Setting, QAfterFilterCondition> valuesStartsWith(
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

  QueryBuilder<Setting, Setting, QAfterFilterCondition> valuesEndsWith(
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

  QueryBuilder<Setting, Setting, QAfterFilterCondition> valuesContains(
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

  QueryBuilder<Setting, Setting, QAfterFilterCondition> valuesMatches(
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

  QueryBuilder<Setting, Setting, QAfterFilterCondition> valuesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'values',
        value: '',
      ));
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> valuesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'values',
        value: '',
      ));
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> widgetEqualTo(
      SettingsWidgets value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'widget',
        value: value,
      ));
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> widgetGreaterThan(
    SettingsWidgets value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'widget',
        value: value,
      ));
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> widgetLessThan(
    SettingsWidgets value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'widget',
        value: value,
      ));
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> widgetBetween(
    SettingsWidgets lower,
    SettingsWidgets upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'widget',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SettingQueryObject
    on QueryBuilder<Setting, Setting, QFilterCondition> {}

extension SettingQueryLinks
    on QueryBuilder<Setting, Setting, QFilterCondition> {
  QueryBuilder<Setting, Setting, QAfterFilterCondition> program(
      FilterQuery<Program> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'program');
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> programIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'program', 0, true, 0, true);
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> gamemode(
      FilterQuery<Gamemode> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'gamemode');
    });
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> gamemodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'gamemode', 0, true, 0, true);
    });
  }
}

extension SettingQuerySortBy on QueryBuilder<Setting, Setting, QSortBy> {
  QueryBuilder<Setting, Setting, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortByEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabled', Sort.asc);
    });
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortByEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabled', Sort.desc);
    });
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortByIndividual() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'individual', Sort.asc);
    });
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortByIndividualDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'individual', Sort.desc);
    });
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortByInputType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inputType', Sort.asc);
    });
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortByInputTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inputType', Sort.desc);
    });
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortByReady() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ready', Sort.asc);
    });
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortByReadyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ready', Sort.desc);
    });
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortByValues() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'values', Sort.asc);
    });
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortByValuesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'values', Sort.desc);
    });
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortByWidget() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widget', Sort.asc);
    });
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortByWidgetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widget', Sort.desc);
    });
  }
}

extension SettingQuerySortThenBy
    on QueryBuilder<Setting, Setting, QSortThenBy> {
  QueryBuilder<Setting, Setting, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenByEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabled', Sort.asc);
    });
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenByEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabled', Sort.desc);
    });
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenByIndividual() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'individual', Sort.asc);
    });
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenByIndividualDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'individual', Sort.desc);
    });
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenByInputType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inputType', Sort.asc);
    });
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenByInputTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inputType', Sort.desc);
    });
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenByReady() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ready', Sort.asc);
    });
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenByReadyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ready', Sort.desc);
    });
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenByValues() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'values', Sort.asc);
    });
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenByValuesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'values', Sort.desc);
    });
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenByWidget() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widget', Sort.asc);
    });
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenByWidgetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'widget', Sort.desc);
    });
  }
}

extension SettingQueryWhereDistinct
    on QueryBuilder<Setting, Setting, QDistinct> {
  QueryBuilder<Setting, Setting, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Setting, Setting, QDistinct> distinctByEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enabled');
    });
  }

  QueryBuilder<Setting, Setting, QDistinct> distinctByGroup() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'group');
    });
  }

  QueryBuilder<Setting, Setting, QDistinct> distinctByIndividual() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'individual');
    });
  }

  QueryBuilder<Setting, Setting, QDistinct> distinctByInputType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'inputType');
    });
  }

  QueryBuilder<Setting, Setting, QDistinct> distinctByReady() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ready');
    });
  }

  QueryBuilder<Setting, Setting, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Setting, Setting, QDistinct> distinctByValues(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'values', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Setting, Setting, QDistinct> distinctByWidget() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'widget');
    });
  }
}

extension SettingQueryProperty
    on QueryBuilder<Setting, Setting, QQueryProperty> {
  QueryBuilder<Setting, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Setting, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<Setting, bool, QQueryOperations> enabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enabled');
    });
  }

  QueryBuilder<Setting, List<int>?, QQueryOperations> groupProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'group');
    });
  }

  QueryBuilder<Setting, bool, QQueryOperations> individualProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'individual');
    });
  }

  QueryBuilder<Setting, InputTypes?, QQueryOperations> inputTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'inputType');
    });
  }

  QueryBuilder<Setting, bool, QQueryOperations> readyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ready');
    });
  }

  QueryBuilder<Setting, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<Setting, String, QQueryOperations> valuesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'values');
    });
  }

  QueryBuilder<Setting, SettingsWidgets, QQueryOperations> widgetProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'widget');
    });
  }
}
