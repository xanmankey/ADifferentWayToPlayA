import 'package:adifferentwaytoplay/app/provider/dwtp_provider.dart';
import 'package:adifferentwaytoplay/app/widgets/utility/text.dart';
import 'package:adifferentwaytoplay/domain/entities/gamemode.dart';
import 'package:flutter/material.dart';
import 'package:adifferentwaytoplay/app/provider/dwtp_provider.dart';

/// A widget for displaying and selecting a custom gamemode
/// ```
///
/// ```
class GamemodeSelector extends StatefulWidget {
  List<Gamemode> gamemodes;
  GamemodeSelector({super.key, required this.gamemodes});

  @override
  State<GamemodeSelector> createState() => _GamemodeSelectorState();
}

class _GamemodeSelectorState extends State<GamemodeSelector> {
  @override
  Widget build(BuildContext context) {
    Gamemode lastGamemode = widget.gamemodes[0];
    // Custom game gamemode options are below
    // A gamemode can be selected via it's name
    return PageView(
      children: [
        for (Gamemode gamemode in widget.gamemodes)
          TextWidget(text: gamemode.name)
      ],
      onPageChanged: (value) {
        // Retrieve the currently selected gamemode
        Gamemode currentGamemode = widget.gamemodes[value - 1];
        // Update DWTP accordingly
        if (currentGamemode.teams == true && lastGamemode.teams != true) {
          // Use Provider to change from no teams to teams
          dwtpProvider.updateTeams(true);
        } else if (currentGamemode.teams == false &&
            lastGamemode.teams != false) {
          // Use Provider to change from teams to no teams
          dwtpProvider.updateTeams(false);
        }
        // Set the last gamemode
        lastGamemode = widget.gamemodes[value - 1];
      },
    );
  }
}
