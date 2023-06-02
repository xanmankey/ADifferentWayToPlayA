// Each player_column has a couple things:
// 1. a scrollable (Horiz) character selector
// 2. a scrollable (Horiz) team selector
// 3. a scrollable (Horiz) program selector
// 4. a specific background color and location depending on gamepad index
// 5. a score
// Note that for 1, 2, and 3 a RANDOM SELECTION option is appended onto the end of
// the list

// When everybody has their player set up accordingly, you can run the code

// If a controller is disconnected at ANY TIME, the code won't pause,
// but an event is sent to remove that controller and replace the value with null
// as well as disconnect the virtual gamepad (meaning the DWTP programs need
// to be event-driven), basically allowing the code to still run but removing
// that person's input. They can join back in because if they reconnect the controller
// their index will be saved
// If all the controllers are disconnected, the program will close though
// (because then the index order resets in the gamepad API)
import 'package:adifferentwaytoplay/app/pages/exception_view.dart';
import 'package:adifferentwaytoplay/app/provider/dwtp_provider.dart';
import 'package:adifferentwaytoplay/app/utils/controllers.dart';
import 'package:adifferentwaytoplay/app/utils/exposed_types.dart';
import 'package:adifferentwaytoplay/app/widgets/character/character_selector.dart';
import 'package:adifferentwaytoplay/app/widgets/player_ready_button.dart';
import 'package:adifferentwaytoplay/app/widgets/program/program_selector.dart';
import 'package:adifferentwaytoplay/app/widgets/ready_button.dart';
import 'package:adifferentwaytoplay/app/widgets/team/team_selector.dart';
import 'package:adifferentwaytoplay/app/widgets/utility/controller_gesture_detector.dart';
import 'package:adifferentwaytoplay/app/widgets/utility/cursor.dart';
import 'package:adifferentwaytoplay/app/widgets/utility/text.dart';
import 'package:adifferentwaytoplay/data/utils/utils.dart';
import 'package:adifferentwaytoplay/domain/entities/character.dart';
import 'package:adifferentwaytoplay/domain/entities/gamemode.dart';
import 'package:adifferentwaytoplay/domain/entities/player.dart';
import 'package:adifferentwaytoplay/domain/entities/program.dart';
import 'package:adifferentwaytoplay/domain/entities/team.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get_storage/get_storage.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';
import 'package:xinput_gamepad/xinput_gamepad.dart';

/// I decided I would write player data to the database
/// (it's easier to keep track of and manage that way)
/// If it ends up being too slow, I'll look for an alternative solution;
/// after all, the player_column widget is managing a lot, and probably needs to be refactored
/// This also handles readying up via provider
/// TODO: If ready, stack with partially seethrough jumbotron across screen over players
/// that is selectable and initiates gameplay

class PlayerColumn extends StatefulWidget {
  Gamemode gamemode;
  int numPlayers;
  DataTypes exposedDataTypes;
  int playerIndex;
  PlayerColumn({
    super.key,
    required this.gamemode,
    required this.numPlayers,
    required this.playerIndex,
    required this.exposedDataTypes,
  });

  @override
  State<PlayerColumn> createState() => _PlayerColumnState();
}

class _PlayerColumnState extends State<PlayerColumn> {
  late List<Character> characters;
  late List<Team> teams;
  late List<Gamemode> gamemodes;
  late List<Program> programs;
  late Player player;
  final GlobalKey _teamSelectorKey = GlobalKey();
  int teamSelectorIndex = 0;
  final GlobalKey _characterSelectorKey = GlobalKey();
  int characterSelectorIndex = 0;
  final GlobalKey _programSelectorKey = GlobalKey();
  int programSelectorIndex = 0;
  final GlobalKey _playerReadyButtonKey = GlobalKey();
  bool playerReady = false;

  /// Each player column has a controller
  late DWTPCursor cursor;

  @override
  void initState() {
    player = Player()
      ..ready = false
      ..score = 0
      ..gamemode.value = widget.gamemode
      ..gamepad.value = dwtpProvider.gamepads[widget.playerIndex];
    cursor = DWTPCursor(
      player: player,
    );
    characters = storage.isarDB.characters.where().findAllSync();
    teams = storage.isarDB.teams.where().findAllSync();
    gamemodes = storage.isarDB.gamemodes.where().findAllSync();
    programs = storage.isarDB.programs.where().findAllSync();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DWTPProvider>(
      builder: (context, provider, child) {
        return ControllerGestureDetector(
          index: player.gamepad.value!.index,
          onSelect: (Offset cursorOffset) {
            // Hit test for:
            // Team selector
            final RenderBox teamSelectorBox = _teamSelectorKey.currentContext!
                .findRenderObject() as RenderBox;
            final Offset teamSelectorOffset =
                teamSelectorBox.localToGlobal(Offset.zero);
            final Size teamSelectorSize = teamSelectorBox.size;
            final Rect teamSelectorRect = Rect.fromLTWH(
              teamSelectorOffset.dx,
              teamSelectorOffset.dy,
              teamSelectorSize.width,
              teamSelectorSize.height,
            );
            if (teamSelectorRect.contains(cursorOffset)) {
              // Update state accordingly;
              // scroll teamSelector right or left one depending on the
              // x coordinate of the click
              if (cursorOffset.dx <
                  (teamSelectorRect.left + teamSelectorRect.width) / 2) {
                if (teamSelectorIndex > 0) {
                  setState(() {
                    teamSelectorIndex -= 1;
                  });
                } else {
                  setState(() {
                    teamSelectorIndex = teams.length;
                  });
                }
              } else {
                if (teamSelectorIndex < teams.length + 1) {
                  setState(() {
                    teamSelectorIndex += 1;
                  });
                } else {
                  setState(() {
                    teamSelectorIndex = 0;
                  });
                }
              }
            }
            // Character selector
            final RenderBox characterSelectorBox =
                _characterSelectorKey.currentContext!.findRenderObject()
                    as RenderBox;
            final Offset characterSelectorOffset =
                characterSelectorBox.localToGlobal(Offset.zero);
            final Size characterSelectorSize = characterSelectorBox.size;
            final Rect characterSelectorRect = Rect.fromLTWH(
              characterSelectorOffset.dx,
              characterSelectorOffset.dy,
              characterSelectorSize.width,
              characterSelectorSize.height,
            );
            if (characterSelectorRect.contains(cursorOffset)) {
              // Update state accordingly;
              // scroll teamSelector right or left one depending on the
              // x coordinate of the click
              if (cursorOffset.dx <
                  (characterSelectorRect.left + characterSelectorRect.width) /
                      2) {
                if (characterSelectorIndex > 0) {
                  setState(() {
                    characterSelectorIndex -= 1;
                  });
                } else {
                  setState(() {
                    characterSelectorIndex = characters.length;
                  });
                }
              } else {
                if (characterSelectorIndex < characters.length + 1) {
                  setState(() {
                    characterSelectorIndex += 1;
                  });
                } else {
                  setState(() {
                    characterSelectorIndex = 0;
                  });
                }
              }
            }
            // Program selector
            final RenderBox programSelectorBox =
                _programSelectorKey.currentContext!.findRenderObject()
                    as RenderBox;
            final Offset programSelectorOffset =
                programSelectorBox.localToGlobal(Offset.zero);
            final Size programSelectorSize = programSelectorBox.size;
            final Rect programSelectorRect = Rect.fromLTWH(
              programSelectorOffset.dx,
              programSelectorOffset.dy,
              programSelectorSize.width,
              programSelectorSize.height,
            );
            if (programSelectorRect.contains(cursorOffset)) {
              // Update state accordingly;
              // scroll teamSelector right or left one depending on the
              // x coordinate of the click
              if (cursorOffset.dx <
                  (programSelectorRect.left + programSelectorRect.width) / 2) {
                if (programSelectorIndex > 0) {
                  setState(() {
                    programSelectorIndex -= 1;
                  });
                } else {
                  setState(() {
                    programSelectorIndex = programs.length;
                  });
                }
              } else {
                if (programSelectorIndex < programs.length + 1) {
                  setState(() {
                    programSelectorIndex += 1;
                  });
                } else {
                  setState(() {
                    programSelectorIndex = 0;
                  });
                }
              }
            }
            // PlayerReadyButton
            final RenderBox playerReadyButtonBox =
                _playerReadyButtonKey.currentContext!.findRenderObject()
                    as RenderBox;
            final Offset playerReadyButtonOffset =
                playerReadyButtonBox.localToGlobal(Offset.zero);
            final Size playerReadyButtonSize = playerReadyButtonBox.size;
            final Rect playerReadyButtonRect = Rect.fromLTWH(
              playerReadyButtonOffset.dx,
              playerReadyButtonOffset.dy,
              playerReadyButtonSize.width,
              playerReadyButtonSize.height,
            );
            if (playerReadyButtonRect.contains(cursorOffset)) {
              if ((teamSelectorIndex != 0) &&
                  (characterSelectorIndex != 0) &&
                  (programSelectorIndex != 0)) {
                setState(() {
                  playerReady = true;
                });
              }
            }
          },
          onBack: (Offset cursorOffset) {
            // In the case of the PlayerColumn,
            // hitting B only undoes the individual player ready-up button
            // No hit testing necessary :)
            setState(() {
              playerReady = false;
            });
            dwtpProvider.updateReady(false);
          },
          child: Column(
            children: [
              TextWidget(text: "Player ${player.gamepad.value!.index}"),
              (widget.gamemode.teams ?? false)
                  ? TeamSelector(
                      key: _teamSelectorKey,
                      teams: teams,
                      numPlayers: widget.numPlayers,
                      playerIndex: player.gamepad.value!.index,
                      currentTeam: (player.team.value != null)
                          ? teams.indexOf(player.team.value!)
                          : 0,
                    )
                  : Container(),
              CharacterSelector(
                key: _characterSelectorKey,
                characters: characters,
                numPlayers: widget.numPlayers,
                playerIndex: player.gamepad.value!.index,
                currentCharacter: (player.character.value != null)
                    ? characters.indexOf(player.character.value!)
                    : 0,
              ),
              ProgramSelector(
                key: _programSelectorKey,
                programs: programs,
                numPlayers: widget.numPlayers,
                playerIndex: player.gamepad.value!.index,
                currentProgram: (player.program.value != null)
                    ? programs.indexOf(player.program.value!)
                    : 0,
              ),
              Row(
                children: [
                  TextWidget(text: '${player.score}'),
                  PlayerReadyButton(
                    key: _playerReadyButtonKey,
                    ready: playerReady,
                    player: player,
                    gamemode: widget.gamemode,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
