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
  int numPlayers;
  int currentGamemode;
  GamemodeSelector({
    super.key,
    required this.gamemodes,
    required this.numPlayers,
    this.currentGamemode = 0,
  });

  @override
  State<GamemodeSelector> createState() => _GamemodeSelectorState();
}

class _GamemodeSelectorState extends State<GamemodeSelector> {
  // late Gamemode lastGamemode;

  @override
  void initState() {
    // lastGamemode = widget.gamemodes[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Custom game gamemode options are below
    // A gamemode can be selected via it's name
    return PageView.builder(
      scrollDirection: Axis.horizontal,
      controller: PageController(
        viewportFraction: 1 / widget.numPlayers,
        initialPage: widget.currentGamemode,
      ),
      itemBuilder: (context, index) {
        return TextWidget(text: widget.gamemodes[index].name);
      },
      onPageChanged: (value) {
        // // Retrieve the currently selected gamemode
        // Gamemode currentGamemode = widget.gamemodes[value - 1];
        // // Update DWTP accordingly
        // if (currentGamemode.teams == true && lastGamemode.teams != true) {
        //   // Use Provider to change from no teams to teams
        //   dwtpProvider.updateTeams(true);
        // } else if (currentGamemode.teams == false &&
        //     lastGamemode.teams != false) {
        //   // Use Provider to change from teams to no teams
        //   dwtpProvider.updateTeams(false);
        // }
        // // Set the last gamemode
        // setState(() {
        //   lastGamemode = widget.gamemodes[value - 1];
        // });
        dwtpProvider.updateGamemode(widget.gamemodes[value - 1]);
      },
    );
  }
}
