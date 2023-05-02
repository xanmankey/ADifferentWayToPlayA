// import 'dart:convert';
import 'dart:convert';

import 'package:adifferentwaytoplay/domain/constants.dart';
import 'package:adifferentwaytoplay/domain/entities/gamemode.dart';
import 'package:adifferentwaytoplay/domain/entities/program.dart';
import 'package:adifferentwaytoplay/domain/utils/utils.dart';
import 'package:isar/isar.dart';

part 'setting.g.dart';

/// An entity for setting objects, which hold settings information
/// and can be easily represented in a GUI
/// Map type isn't supported in Isar, so make sure you write your settings
/// in the order you want them, encode them, and decode and retrieve them
/// accordingly!
///
/// ```
/// Setting()
/// ..title = "Your title here"
/// ..description = "Your description here"
/// ..type = SettingsType.checkbox
/// ..enabled = true
/// ..values = [Value('myStringValue')]
/// ```
///
/// Backlinks to program and gamemode
@collection
class Setting {
  // Remember that isar AUTOMATICALLY indexes id
  // @Index(unique: true)
  Id id = Isar.autoIncrement;

  // This is initialized to a random string
  @Index()
  late String title;

  String? description;

  @Index()
  bool enabled = true;

  // Grouping settings is for layout purposes (specifically for cards, settings
  // that you want to encompass together inside a card)
  // Note that the settings need to be written first,
  // and the group data specified LATER (after first being written)
  List<Id>? group;

  @Enumerated(EnumType.ordinal32)
  SortProperties? sortProperty;

  @enumerated
  late SettingsWidgets settingsWidget;

  // Map type isn't supported, so an embed workaround is necessary.
  // A custom setter and getter is used so values can be added and immediately
  // encoded for convenience
  @Ignore()
  Object mapValues = {};

  String get values => jsonEncode(mapValues);
  set values(String json) => mapValues = jsonDecode(json);

  @Backlink(to: 'settings')
  var program = IsarLink<Program>();

  @Backlink(to: 'settings')
  var gamemode = IsarLink<Gamemode>();

  @override
  String toString() {
    return '''$id: {title: $title, enabled: $enabled, value: $values,
    description: $description}''';
  }

  /*
  Command({
    required this.title,
    required this.enabled,
    required this.type,
    required this.abbreviation,
    this.commands,
  });

  // From Command
  Command.fromCommand(Command command)
      : this(
          title: command.title,
          enabled: command.enabled,
          commands: command.commands,
          type: command.type,
          abbreviation: command.abbreviation,
        );

  // To json
  Map<String, dynamic> toJson() => {
        'title': title,
        'enabled': enabled,
        'commands': commands,
        'type': type,
        'abbreviation': abbreviation,
      };

  // From json
  factory Command.fromJson(Map<String, dynamic> map) {
    final title = map['title'] as String;
    final enabled = (map['enabled'].runtimeType == int)
        ? intToBool(map['enabled'])
        : map['enabled'] as bool;
    final commands = map['commands'] as List<Map<String, dynamic>>?;
    final type = map['type'] as String;
    final abbreviation = map['abbreviation'] as String;

    return Command(
      title: title,
      enabled: enabled,
      type: type,
      abbreviation: abbreviation,
      commands: commands,
    );
  }

  // // To database data
  // Map<String, dynamic> toDatabaseJson() => {
  //       'title': title,
  //       'enabled': (enabled) ? 1 : 0,
  //       'commands': jsonEncode(commands),
  //       'type': type,
  //       'abbreviation': abbreviation,
  //     };

  // // From database data
  // Command.fromDatabaseJson(Map<String, dynamic> map)
  //     : this(
  //         title: map['title'],
  //         enabled: (map['enabled'] == 1) ? true : false,
  //         commands: (map['commands'] is String)
  //             ? jsonDecode(map['commands'])
  //             : map['commands'],
  //         type: map['type'],
  //         abbreviation: map['abbreviation'],
  //       );
  */
}
