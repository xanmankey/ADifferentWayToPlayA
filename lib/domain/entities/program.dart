// import 'dart:convert';
import 'dart:convert';

import 'package:adifferentwaytoplay/app/utils/constants.dart';
import 'package:adifferentwaytoplay/domain/entities/player.dart';
import 'package:adifferentwaytoplay/domain/utils/utils.dart';
import 'package:isar/isar.dart';

part 'program.g.dart';

/// An entity for program objects, which hold program details,
/// including a reference to program settings
///
/// ```
/// Program()
/// ..abbreviation = "Your string ID here"
/// ..name = "Your program name here"
/// ..image = "Your image path here"
/// ..description = "Your description here"
/// ```
///
/// IsarLinks to settings
///
/// Backlink to player
///
/// Indexes abbreviation, name
@collection
class Program {
  Id id = Isar.autoIncrement;

  @Index(unique: true, caseSensitive: false)
  late String abbreviation;

  @Index()
  late bool enabled;

  @Index(unique: true)
  late String name;

  late String image;

  // The script won't be run directly, but WILL be run by DWTP.py,
  // so if you create a program you need to supply the script parameter,
  // which will then add it to DWTP.py
  late String script;

  late int score;

  String? description;

  @enumerated
  late ProgramOptions programOptions;

  /// mapValues is a {key:value} dict. for writing dynamic data
  /// Object is used (at the cost of the safety of static typing)
  /// so the value can potentially be anything and can
  /// be cast by the user accordingly
  @Ignore()
  Map<String, Setting> mapValues = {};

  String get values => jsonEncode(mapValues);
  set values(String json) => mapValues = jsonDecode(json);

  @Backlink(to: 'program')
  var player = IsarLink<Player>();

  @override
  String toString() {
    return '''$id: {name: $name, image: $image, abbreviation: $abbreviation,
    description: $description, mapValues: ${mapValues.toString()}}''';
  }

  /*
  Program({
    required this.image,
    required this.name,
    required this.abbreviation,
    this.description,
    this.settings,
  });

  // From Player
  Program.fromProgram(Program program)
      : this(
          image: program.image,
          description: program.description,
          name: program.name,
          settings: program.settings,
          abbreviation: program.abbreviation,
        );

  // To json
  Map<String, dynamic> toJson() => {
        'image': image,
        'description': description,
        'name': name,
        'settings': settings,
        'abbreviation': abbreviation,
      };

  // A function for mirroring the "Programs" table database entry
  // (in particular, note how settings is removed)
  Map<String, dynamic> toDatabaseJson() => {
        'image': image,
        'description': description,
        'name': name,
        'abbreviation': abbreviation,
        'settings': jsonEncode(settings),
      };

  // // All json
  // String toAllJson() => jsonEncode({
  //       'image': image,
  //       'description': description,
  //       'name': name,
  //       'settings': settings,
  //       'abbreviation': abbreviation,
  //     });

  // From json
  factory Program.fromJson(Map<String, dynamic> map) {
    final image = map['image'] as String;
    final description = map['description'] as String?;
    final name = map['name'] as String;
    final settings = map['settings'] as List<Command>?;
    final abbreviation = map['abbreviation'] as String;

    return Program(
      image: image,
      name: name,
      abbreviation: abbreviation,
      settings: settings,
      description: description,
    );
  }

  // From all json (TODO: not sure if this func is necessary)
  // Program.fromAllJson(Map<String, String> map)
  //     : this(
  //         image: jsonDecode(map['image']!),
  //         description: jsonDecode(map['description']!),
  //         name: jsonDecode(map['name']!),
  //         settings: jsonDecode(map['settings']!),
  //         abbreviation: jsonDecode(map['abbreviation']!),
  //       );

  // This logic is a tad confusing, but I think it's worth it to be able
  // to convert database entries into objects
  // Recall that database objects will be equal to a "null" string if not initialized
  // TODO: avoid using jsonDecode as much as possible; I want strong-typing
  // e.g. functions that convert my data so I can have the specific type
  // and functionality I want
  Program.fromDatabaseJson(Map<String, dynamic> map)
      : this(
          image: map['image'],
          description: map['description'],
          name: map['name'],
          settings: (map["settings"] != "null")
              ? [
                  for (Map<String, dynamic> settings
                      in (jsonDecode(map['settings'])
                          as List<Map<String, dynamic>>))
                    Command.fromJson(settings)
                ]
              : null,
          abbreviation: map['abbreviation'],
        );
  */
}

abstract class TestEmbed {}
