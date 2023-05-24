import 'package:adifferentwaytoplay/app/constants.dart';
import 'package:adifferentwaytoplay/app/provider/dwtp_provider.dart';
import 'package:adifferentwaytoplay/app/widgets/character/character_column.dart';
import 'package:adifferentwaytoplay/app/widgets/team/team_column.dart';
import 'package:adifferentwaytoplay/app/widgets/utility/custom_appbar.dart';
import 'package:adifferentwaytoplay/app/widgets/utility/text.dart';
import 'package:adifferentwaytoplay/data/constants.dart';
import 'package:adifferentwaytoplay/domain/entities/player.dart';
import 'package:adifferentwaytoplay/domain/entities/team.dart';
import 'package:flutter/material.dart';

/// A widget that allows players to tell the GUI the results of the DWTP session
class ResultsInputView extends StatefulWidget {
  const ResultsInputView({super.key});

  @override
  State<ResultsInputView> createState() => _ResultsInputViewState();
}

class _ResultsInputViewState extends State<ResultsInputView> {
  List<Team> teams = [];
  List<Player> players = [];

  @override
  void initState() {
    for (Player player in dwtpProvider.players) {
      if (player.team.value != null) {
        if (!teams.contains(player.team.value)) {
          teams.add(player.team.value!);
        }
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          ReorderableListView(
              onReorder: (oldIndex, newIndex) {
                // Swap
                if (dwtpProvider.gamemode.teams == true) {
                  Team team = teams.removeAt(oldIndex);
                  teams.insert(newIndex, team);
                } else {
                  Player player = players.removeAt(oldIndex);
                  players.insert(newIndex, player);
                }
              },
              children: (dwtpProvider.gamemode.teams == true)
                  ? [
                      for (Team team in teams)
                        TeamColumn(
                          teamName: team.name,
                          teamImageFilePath: team.logo,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                        )
                    ]
                  : [
                      for (Player player in players)
                        Column(
                          children: [
                            TextWidget(
                              text: player.gamepad.value!.index.toString(),
                              color: Color(player.color),
                            ),
                            CharacterColumn(
                              characterName: player.character.value!.name,
                              characterFilePath: player.character.value!.image,
                            )
                          ],
                        )
                    ]),
          // Submit results using below button
          ElevatedButton(
            onPressed: () {
              // Update player or team score depending
              if (dwtpProvider.gamemode.teams == true) {
                for (Player player in players) {
                  player.score = calculateScore(
                      player.score, teams.indexOf(player.team.value!));
                }
              } else {
                for (Player player in players) {
                  player.score =
                      calculateScore(player.score, players.indexOf(player));
                }
              }
              dwtpProvider.updatePlayers(players);
              if (dwtpProvider.gamemode.settings.any((setting) =>
                  setting.title == GamemodeOptionsValues.score.toString())) {
                int toWin = int.parse(dwtpProvider.gamemode.settings
                    .where((setting) =>
                        setting.title == GamemodeOptionsValues.score.toString())
                    .first
                    .values);
                // sort players by score
                players.sort((player1, player2) =>
                    player2.score.compareTo(player1.score));
                if (players[0].score >= toWin) {
                  if (dwtpProvider.gamemode.teams == true) {
                    Navigator.pushNamed(context, Pages.victory,
                        arguments: {'team': players[0].team.value!});
                  } else {
                    Navigator.pushNamed(context, Pages.victory,
                        arguments: {'player': players[0]});
                  }
                }
              } else {
                Navigator.pushNamed(context, Pages.dwtpSetup);
              }
            },
            child: const TextWidget(text: "Submit Results"),
          ),
        ],
      ),
    );
  }
}

/// A function for calculating score
int calculateScore(int originalScore, int place) {
  switch (place) {
    case 0:
      return (originalScore * 2).round();
    case 1:
      return (originalScore * 1.25).round();
    case 2:
      return (originalScore * 1).round();
    case 3:
      return (originalScore * 0.5).round();
    default:
      return (originalScore * 0.25).round();
  }
}
