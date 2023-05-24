import 'dart:io';

import 'package:adifferentwaytoplay/app/provider/dwtp_provider.dart';
import 'package:adifferentwaytoplay/app/widgets/team/team_column.dart';
import 'package:adifferentwaytoplay/data/constants.dart';
import 'package:adifferentwaytoplay/domain/entities/player.dart';
import 'package:adifferentwaytoplay/domain/entities/team.dart';
import 'package:flutter/material.dart';
import 'package:adifferentwaytoplay/app/widgets/utility/text.dart';

/// A selector for choosing a player's team affiliation;
/// goes inside a horizontal ListView
/// ```
///
/// ```
class TeamSelector extends StatefulWidget {
  List<Team?> teams;
  int numPlayers;
  int currentTeam;
  int playerIndex;
  TeamSelector({
    super.key,
    required this.teams,
    required this.numPlayers,
    required this.playerIndex,
    this.currentTeam = 0,
  });

  @override
  State<TeamSelector> createState() => _TeamSelectorState();
}

class _TeamSelectorState extends State<TeamSelector> {
  @override
  void initState() {
    // Inserting a null option as the default value
    widget.teams.insert(0, null);
    // Adding a random option to the list of characters
    // When the start button is pressed, a check is done to look for any random options
    // If any are found, the values in the respective categories get randomly selected
    widget.teams.add(Team()
      ..logo = 'assets/images/question_mark.png'
      ..name = RANDOM
      ..description = """Random's rise up!!!"""
      ..color = Colors.black.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Note that teams can ONLY be selected if teams is set to true in gamemode options
    return Row(
      children: [
        PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: PageController(
            viewportFraction: 1 / widget.numPlayers,
            initialPage: widget.currentTeam,
          ),
          itemBuilder: (context, index) {
            return (widget.teams[index] == null)
                ? Container()
                : TeamColumn(
                    teamName: widget.teams[index]!.name,
                    teamImageFilePath: widget.teams[index]!.logo);
          },
          onPageChanged: (value) {
            if (value == 0) {
              dwtpProvider.updateReady(false);
            }
            List<Player> players = dwtpProvider.players;
            players[widget.playerIndex].team.value = widget.teams[value];
            dwtpProvider.updatePlayers(players);
          },
        )
      ],
    );
  }
}
