import 'package:adifferentwaytoplay/app/utils/controllers.dart';
import 'package:adifferentwaytoplay/domain/entities/player.dart';
import 'package:flutter/material.dart';
import 'package:xinput_gamepad/xinput_gamepad.dart';

/// A simple widget for handling GUI navigation and selection
/// Color changes depending on player:
/// P1: yellow
/// P2: blue
/// P3: green
/// P4: red
class DWTPCursor extends StatefulWidget {
  Player player;
  // void Function(void Function()) setState;
  DWTPCursor({
    super.key,
    required this.player,
  });

  @override
  State<DWTPCursor> createState() => _DWTPCursorState();
}

class _DWTPCursorState extends State<DWTPCursor> {
  late Controller controller;

  @override
  void initState() {
    /// Listen to controller
    controller = DWTPController.createController(
      index: widget.player.gamepad.value!.index,
    );
    controller.listen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.gamepad,
      color: Color(widget.player.color),
    );
  }
}
