import 'package:adifferentwaytoplay/domain/entities/player.dart';
import 'package:flutter/material.dart';

/// A controller-shaped cursor used for player selection
/// Color changes depending on player:
/// P1:
/// P2:
/// P3:
/// P4:
/// ```
///
/// ```
class ControllerSelector extends StatelessWidget {
  Player player;
  ControllerSelector({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    // switch (player.gamepad.value!.index) {
    //   case 0:
    //     return const Icon(
    //       Icons.gamepad,
    //       color: Colors.yellow,
    //     );
    //   case 1:
    //     return const Icon(
    //       Icons.gamepad,
    //       color: Colors.blue,
    //     );
    //   case 2:
    //     return const Icon(
    //       Icons.gamepad,
    //       color: Colors.green,
    //     );
    //   case 3:
    //     return const Icon(
    //       Icons.gamepad,
    //       color: Colors.red,
    //     );
    //   default:
    //     return const Icon(
    //       Icons.gamepad,
    //       color: Colors.black,
    //     );
    // }
    return Icon(
      Icons.gamepad,
      color: Color(player.color),
    );
  }
}
