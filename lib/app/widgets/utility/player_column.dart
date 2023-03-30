// Each player_column has a couple things:
// 1. a scrollable (Horiz) character selector
// 2. a scrollable (Horiz) team selector
// 3. a scrollable (Horiz) program selector
// 4. a specific background color and location depending on gamepad index
// 5. a score

// When everybody has their player set up accordingly, you can run the code

// If a controller is disconnected at ANY TIME, the code won't pause,
// but an event is sent to remove that controller and replace the value with null
// as well as disconnect the virtual gamepad (meaning the DWTP programs need
// to be event-driven), basically allowing the code to still run but removing
// that person's input. They can join back in because if they reconnect the controller
// their index will be saved
// If all the controllers are disconnected, the program will close though
// (because then the index order resets in the gamepad API)
import 'package:adifferentwaytoplay/app/widgets/character/character_box.dart';
import 'package:adifferentwaytoplay/app/widgets/program/program_box.dart';
import 'package:adifferentwaytoplay/app/widgets/utility/ready_button.dart';
import 'package:adifferentwaytoplay/app/widgets/team/team_box.dart';
import 'package:adifferentwaytoplay/app/widgets/utility/text.dart';
import 'package:adifferentwaytoplay/data/utils/utils.dart';
import 'package:adifferentwaytoplay/domain/entities/character.dart';
import 'package:adifferentwaytoplay/domain/entities/gamemode.dart';
import 'package:adifferentwaytoplay/domain/entities/player.dart';
import 'package:adifferentwaytoplay/domain/entities/program.dart';
import 'package:adifferentwaytoplay/domain/entities/team.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

class PlayerColumn extends StatefulWidget {
  Gamemode gamemode;
  Player player;
  int numPlayers;
  PlayerColumn(
      {super.key,
      required this.gamemode,
      required this.player,
      required this.numPlayers});

  @override
  State<PlayerColumn> createState() => _PlayerColumnState();
}

class _PlayerColumnState extends State<PlayerColumn> {
  late List<Team> teams;
  late List<Program> programs;
  late List<Character> characters;

  @override
  void initState() async {
    teams = await storage.getTeamList([
      {'name': Sort.asc}
    ]);
    programs = await storage.getProgramList([
      {'abbreviation': Sort.asc}
    ]);
    characters = await storage.getCharacterList([
      {'name': Sort.asc}
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextWidget(text: "Player ${widget.player.gamepad.value!.index}"),
        (widget.gamemode.teams)
            ? PageView.builder(
                itemBuilder: (context, index) {
                  for (Team team in teams) {
                    return TeamBox(team: team);
                  }
                  return Container();
                },
                scrollDirection: Axis.horizontal,
                onPageChanged: (index) {
                  widget.player.team.value = teams[index];
                },
                controller: PageController(
                  initialPage: teams.indexWhere((team) =>
                      (widget.player.team.value != null)
                          ? (team.name == widget.player.team.value!.name)
                          : team.id == 0),
                  viewportFraction: 1 / widget.numPlayers,
                ),
              )
            : removeTeam(widget.player),
        PageView.builder(
          itemBuilder: (context, index) {
            for (Character character in characters) {
              return CharacterBox(character: character);
            }
            return Container();
          },
          scrollDirection: Axis.horizontal,
          onPageChanged: (index) {
            widget.player.character.value = characters[index];
          },
          controller: PageController(
            initialPage: characters.indexWhere((character) =>
                (widget.player.team.value != null)
                    ? (character.name == widget.player.character.value!.name)
                    : character.id == 0),
            viewportFraction: 1 / widget.numPlayers,
          ),
        ),
        PageView.builder(
          itemBuilder: (context, index) {
            for (Program program in programs) {
              return ProgramBox(program: program);
            }
            return Container();
          },
          scrollDirection: Axis.horizontal,
          onPageChanged: (index) {
            widget.player.program.value = programs[index];
          },
          controller: PageController(
            initialPage: programs.indexWhere((program) =>
                (widget.player.program.value != null)
                    ? (program.abbreviation ==
                        widget.player.program.value!.abbreviation)
                    : program.id == 0),
            viewportFraction: 1 / widget.numPlayers,
          ),
        ),
        Row(
          children: [
            TextWidget(text: '${widget.player.score}'),
            ReadyWidget(player: widget.player, gamemode: widget.gamemode),
          ],
        ),
      ],
    );
  }
}

Widget removeTeam(Player player) {
  player.team.value = null;
  return Container();
}
