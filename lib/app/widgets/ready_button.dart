import 'dart:convert';
import 'dart:io';

import 'package:adifferentwaytoplay/app/constants.dart';
import 'package:adifferentwaytoplay/app/provider/dwtp_provider.dart';
import 'package:adifferentwaytoplay/app/utils/utils.dart';
import 'package:adifferentwaytoplay/app/widgets/utility/text.dart';
import 'package:adifferentwaytoplay/data/utils/utils.dart';
import 'package:adifferentwaytoplay/domain/constants.dart';
import 'package:adifferentwaytoplay/domain/entities/gamemode.dart';
import 'package:adifferentwaytoplay/domain/entities/player.dart';
import 'package:adifferentwaytoplay/domain/entities/setting.dart';
import 'package:adifferentwaytoplay/domain/entities/team.dart';
import 'package:flutter/material.dart';

/// ```
///
/// ```
class ReadyButton extends StatefulWidget {
  List<Player> players;
  Gamemode gamemode;
  ReadyButton({super.key, required this.players, required this.gamemode});

  @override
  State<ReadyButton> createState() => _ReadyButtonState();
}

class _ReadyButtonState extends State<ReadyButton> {
  IconData readyIcon = Icons.close_sharp;
  late List<Setting> individualSettings;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Player_column.dart handles provider and rendering the button appropriately
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return Theme.of(context).colorScheme.primary.withOpacity(0.5);
                }
                return null; // Use the component's default.
              },
            ),
          ),
          onPressed: () async {
            // Destroy ready button and dim screen to indicate gameplay
            dwtpProvider.updateGameplay(true);
            // Redirect to results input screen
            Navigator.pushNamed(context, Pages.resultsInput);
            // Run the DWTP code until results have been inputted
            runCode();
          },
          child: const TextWidget(text: "Play in a different way?"),
        ),
      ),
    );
  }
}

/// Runs scripts w/ arguments through the use of processes
Future<void>? runCode() {
  // Note that TEAM SCRIPTS ONLY GET RUN ONCE PER TEAM
  // While player scripts get run once per player
  if (dwtpProvider.gamemode.teams == true) {
    List<Team> teams = [];
    for (Player player in dwtpProvider.players) {
      if (player.team.value != null) {
        if (!teams.contains(player.team.value)) {
          teams.add(player.team.value!);
        }
      }
    }
    for (Player player in dwtpProvider.players) {
      switch (Scripts.toScript(player.program.value!.abbreviation)) {
        // If you want to add custom scripts and programs,
        // you'll want to add your own case expression below,
        // as well as your own process call
        case Scripts.fc:
          Process.run(Scripts.fc.toPath(), []);
          break;
        case Scripts.miop:
          Process.run(Scripts.miop.toPath(), []);
          break;
        case Scripts.rc:
          Process.run(Scripts.rc.toPath(), []);
          break;
        case Scripts.tc:
          Process.run(Scripts.tc.toPath(), []);
          break;
        default:
          logger.warning(
              "Make sure to add your own case expression if you add a program!");
      }
    }
  } else {
    for (Player player in dwtpProvider.players) {
      // Little bit of Json Command Line Args :)
      Process.run(player.program.value!.script, []);
    }
  }
}

/// A utility function for formatting the command line arguments
/// for running the scripts
String createCLIArguments(Player player, List<Team> teams) {
  return jsonEncode({
    'settings': jsonEncode(player.program.value?.settings),
    'index': '${player.gamepad.value!.index}',
    'teamsEnabled': '${dwtpProvider.gamemode.teams ?? false}',
    'teams': jsonEncode({
      for (Team team in teams) team.name: [team.player.toList()]
    }),
  });
}
