import 'package:adifferentwaytoplay/app/widgets/utility/text.dart';
import 'package:adifferentwaytoplay/data/utils/utils.dart';
import 'package:adifferentwaytoplay/domain/entities/gamemode.dart';
import 'package:adifferentwaytoplay/domain/entities/player.dart';
import 'package:flutter/material.dart';

// TODO: this has a lot of logic still to be implemented
// This and player_column will come later

/// Each player will have an individual "ready-up" button to start gameplay
/// Or perhaps I just make automatic checks to see if players are ready or not...
/// ```
///
/// ```
class ReadyWidget extends StatefulWidget {
  Player player;
  Gamemode gamemode;
  ReadyWidget({super.key, required this.player, required this.gamemode});

  @override
  State<ReadyWidget> createState() => _ReadyWidgetState();
}

class _ReadyWidgetState extends State<ReadyWidget> {
  IconData readyIcon = Icons.close_sharp;
  late List<Setting> individualSettings;

  @override
  void initState() async {
    individualSettings = await storage.getSetting({
      'program.abbreviation': widget.player.program.value!.abbreviation,
      "individual": true,
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        // Check if the player is allowed to ready up
        // Simply get all individual settings and check if they are defined or not
        // Check if the setting is filled out
        if (individualSettings.every((element) => element.ready == true)) {
          setState(() {
            readyIcon = Icons.check;
            widget.player.ready = true;
          });
        }
        // Otherwise return null
        return;
      },
      child: Icon(readyIcon),
    );
  }
}
