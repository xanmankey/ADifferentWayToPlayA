import 'dart:convert';

import 'package:adifferentwaytoplay/app/utils/constants.dart';
import 'package:adifferentwaytoplay/domain/entities/player.dart';
import 'package:adifferentwaytoplay/domain/utils/utils.dart';
import 'package:isar/isar.dart';

part 'gamemode.g.dart';

/// An entity outlining Gamemode objects, which define how the gameplay functions.
///
/// ```
/// Gamemode()
///   ..name = "Custom";
/// ```
///
/// Backlinks to "Player" and "Settings"
///
/// Indexes: name, timesPlayed
@collection
class Gamemode {
  Id id = Isar.autoIncrement;

  var players = IsarLinks<Player>();

  @Index(unique: true, caseSensitive: false)
  late String name;

  @Index()
  int timesPlayed = 0;

  @Index()
  late bool teams;

  @enumerated
  late GamemodeOptions gamemodeOptions;

  /// mapValues is a {key:value} dict. for writing dynamic data
  /// Object is used (at the cost of the safety of static typing)
  /// so the value can potentially be anything and can
  /// be cast by the user accordingly
  @Ignore()
  Map<String, Setting> mapValues = {};

  String get values => jsonEncode(mapValues);
  set values(String json) => mapValues = jsonDecode(json);

  @override
  String toString() {
    return '''$id: {name: $name, timesPlayed: $timesPlayed, values: ${mapValues.toString()}}''';
  }

  /* 
  Gamemode({
    this.players,
    required this.settings,
    required this.name,
  });

  // From Gamemode
  Gamemode.fromGamemode(Gamemode gamemode)
      : this(
          players: gamemode.players,
          settings: gamemode.settings,
          name: gamemode.name,
        );

  // To json
  Map<String, dynamic> toJson() => {
        'players': players,
        'settings': settings,
        'name': name,
      };

  // From json
  factory Gamemode.fromJson(Map<String, dynamic> map) {
    final players = (map['players'] != 'null')
        // ? [
        //     for (Map<String, dynamic> player in map['players'])
        //       Player.fromJson(player)
        //   ]
        ? List.generate(
            (map['players'] as List<Map<String, dynamic>>).length,
            (i) => Player(
              gamepad: map['players'][i]['gamepad'],
              character: map['players'][i]['characater'],
              program: map['players'][i]['program'],
              color: map['players'][i]['color'],
            ),
          )
        : null;
    final settings = map['settings'] as Map<String, dynamic>;
    final name = map['name'] as String;

    return Gamemode(settings: settings, name: name, players: players);
  }

  Map<String, dynamic> toDatabaseJson() => {
        'players': jsonEncode(players),
        'settings': jsonEncode(settings),
        'name': name,
      };

  Gamemode.fromDatabaseJson(Map<String, dynamic> map)
      : this(
          players: jsonDecode(map['players']),
          settings: jsonDecode(map['settings']),
          name: map['name'],
        );
  */
}
