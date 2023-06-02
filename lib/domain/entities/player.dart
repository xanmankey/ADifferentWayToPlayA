// import 'dart:convert';
import 'dart:convert';

import 'package:adifferentwaytoplay/domain/entities/character.dart';
import 'package:adifferentwaytoplay/domain/entities/gamemode.dart';
import 'package:adifferentwaytoplay/domain/entities/gamepad.dart';
import 'package:adifferentwaytoplay/domain/entities/program.dart';
import 'package:adifferentwaytoplay/domain/entities/team.dart';
import 'package:adifferentwaytoplay/domain/utils/utils.dart';
import 'package:isar/isar.dart';

part 'player.g.dart';

/// An entity for player objects, which hold character, program,
/// gamepad, and team information
///
/// ```
/// Player()
/// ..color = Colors.red
/// ..score = 0;
/// ```
///
/// Links to Gamepad, Character, Program, and Team
///
/// Backlinks to gamemode
///
/// Indexes color, score
@collection
class Player {
  Id id = Isar.autoIncrement;

  // Properties
  var gamepad = IsarLink<Gamepad>();
  var character = IsarLink<Character>();
  var program = IsarLink<Program>();

  // Note that IsarLink CAN be null
  var team = IsarLink<Team>();

  @Index()
  late int color;

  // Initialized to a default value of 0
  @Index()
  int score = 0;

  @Index()
  bool ready = false;

  // Getters
  // Not really necessary because you can access these properties via isar links
  // int get index => gamepad.index;

  @Backlink(to: 'players')
  var gamemode = IsarLink<Gamemode>();

  @override
  String toString() {
    return '''$id: {score: $score, color: $color}''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return (other is Player &&
            score == other.score &&
            ready == other.ready &&
            color == other.color &&
            gamepad.value == other.gamepad.value
        // character.value == other.character.value &&
        // program.value == other.program.value &&
        // team.value == other.team.value);
        );
  }

  @override
  int get hashCode => gamepad.value?.index.hashCode ?? color.hashCode;

  // Converting to a map for running the python script
  Map<String, Object?> toMap() {
    return {
      "index": gamepad.value?.index,
      "program": program.value?.abbreviation,
      "team": team.value?.name,
    };
  }

  /*
  // Constructor
  Player({
    required this.gamepad,
    required this.character,
    required this.program,
    required this.color,
    this.team,
  });

  // From Player
  Player.fromPlayer(Player player)
      : this(
          gamepad: player.gamepad,
          character: player.character,
          program: player.program,
          color: player.color,
          team: player.team,
        );

  // To json
  Map<String, dynamic> toJson() => {
        'gamepad': gamepad,
        'character': character,
        'program': program,
        'color': color,
        'team': team,
      };

  // // All json
  // String toAllJson() => jsonEncode({
  //       'gamepad': gamepad,
  //       'character': character,
  //       'program': program,
  //       'color': color,
  //     });

  // From json
  factory Player.fromJson(Map<String, dynamic> map) {
    final gamepad = map['gamepad'] as Gamepad;
    final character = map['character'] as Character;
    final program = map['program'] as Program;
    final color = map['color'] as String;
    final team = map['team'] as Team?;

    return Player(
      gamepad: gamepad,
      character: character,
      program: program,
      color: color,
      team: team,
    );
  }

  // // From all json (TODO: not sure if this func is necessary)
  // Player.fromAllJson(Map<String, String> map)
  //     : this(
  //         gamepad: jsonDecode(map['gamepad']!),
  //         character: jsonDecode(map['character']!),
  //         program: jsonDecode(map['program']!),
  //         color: jsonDecode(map['color']!),
  //       );

  Map<String, dynamic> toDatabaseJson() => {
        'teamName': (team != null) ? team!.name : null,
        'color': color,
        'abbreviation': program.abbreviation,
        'characterName': character.name,
        'number': gamepad.number,
        'gamepad': jsonEncode(gamepad),
        'program': jsonEncode(program),
        'character': jsonEncode(character),
        'team': jsonEncode(team),
      };

  Player.fromDatabaseJson(Map<String, dynamic> map)
      : this(
          team: (map.containsKey('team')) ? jsonDecode(map['team']) : null,
          color: map['color'],
          gamepad: jsonDecode(map['gamepad']),
          character: jsonDecode(map['character']),
          program: jsonDecode(map['program']),
        );
  */
}
