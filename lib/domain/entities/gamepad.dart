// import 'dart:convert';
import 'package:adifferentwaytoplay/domain/entities/player.dart';
import 'package:adifferentwaytoplay/domain/utils/utils.dart';
import 'package:isar/isar.dart';

part 'gamepad.g.dart';

/// An entity for gamepad objects, which hold controller information
///
/// ```Gamepad()
/// ..index = 0
/// ..connected = true
/// ..color = Colors.red;```
///
/// Backlinks to player
///
/// Indexes connected, color
@collection
class Gamepad {
  // Can't use an autoincrement id because I need to manually handle
  // creating and destroying gamepads because of the index relationship
  late Id index;

  @Index()
  late bool connected;

  @Index()
  late int color;

  // Adding backlinks for extra functionality
  // (They have no extra cost besides added complexity)
  @Backlink(to: 'gamepad')
  var player = IsarLink<Player>();

  @override
  String toString() {
    return '''$index: {connected: $connected, color: $color}''';
  }

  // Constructor
  /* 
  Gamepad({required this.index, required this.color, this.connected = true});

  // From gamepad
  Gamepad.fromGamepad(Gamepad gamepad)
      : this(d
          index: gamepad.index + 1,
          connected: gamepad.connected,
          color: gamepad.color,
        );

  // To json
  Map<String, dynamic> toJson() => {
        'number': number,
        'connected': connected,
      };

  // All json
  // String toAllJson() => jsonEncode({
  //       'index': index,
  //       'connected': connected,
  //     });

  // From json
  factory Gamepad.fromJson(Map<String, dynamic> map) {
    final number = map['number'] as int;
    final connected = (map['connected'] == 1) ? true : false;

    return Gamepad(number: number, connected: connected);
  }

  // Gamepad.fromAllJson(Map<String, String> map)
  //     : this(
  //           index: jsonDecode(map['index']!),
  //           connected: jsonDecode(map['connected']!));

  // Something I learned; 1 does not evaluate to true in dart.
  // Anything not 'true' equivilates to false
  Map<String, dynamic> toDatabaseJson() => {
        'number': number,
        'connected': (connected) ? 1 : 0,
      };

  Gamepad.fromDatabaseJson(Map<String, dynamic> map)
      : this(
          number: map['number'],
          connected: (map['connected'] == 1) ? true : false,
        );
  */
}
