import 'dart:async';

import 'package:adifferentwaytoplay/app/provider/dwtp_provider.dart';
import 'package:adifferentwaytoplay/app/utils/exposed_types.dart';
import 'package:adifferentwaytoplay/app/widgets/gamemode/gamemode_selector.dart';
import 'package:adifferentwaytoplay/app/widgets/ready_button.dart';
import 'package:adifferentwaytoplay/app/widgets/utility/custom_appbar.dart';
import 'package:adifferentwaytoplay/app/widgets/player_column.dart';
import 'package:adifferentwaytoplay/data/constants.dart';
import 'package:adifferentwaytoplay/data/utils/initial_vars.dart';
import 'package:adifferentwaytoplay/domain/entities/gamemode.dart';
import 'package:adifferentwaytoplay/domain/entities/gamepad.dart';
import 'package:adifferentwaytoplay/domain/entities/player.dart';
import 'package:xinput_gamepad/xinput_gamepad.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// The player setup screen; x number columns equal to the number of players,
/// where players can choose among a couple things:
/// - Team
/// - Character
/// - A DWTP
/// DWTP and Team depend on the current gamemode, which can be selected
/// in a top horizontal scrollbar (perhaps a page view)
/// Provider data is passed in based on gamemode which changes how the player columns
/// are rendered
///
///

// TODO:
// Player data is written in the readyButton onPressed method
//
class DWTP extends StatefulWidget {
  const DWTP({super.key});

  @override
  State<DWTP> createState() => _DWTPState();
}

class _DWTPState extends State<DWTP> {
  late Timer timer;

  @override
  void initState() {
    // Listen for any new controller events in which numPlayers, gamepads, and players
    // should be updated
    timer = checkControllers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DWTPProvider>(
      builder: (context, value, child) {
        if (value.gameplay) {
          timer.cancel();
        } else {
          timer = checkControllers();
        }
        // Check if gameplay is running first
        // If so, dim screen
        return (value.gameplay)
            ? Theme(
                data: ThemeData(
                  brightness: Brightness.dark,
                ),
                child: Scaffold(
                  appBar: const CustomAppBar(),
                  body: Stack(
                    alignment: Alignment.center,
                    children: [
                      ReadyButton(
                          players: value.players, gamemode: value.gamemode),
                      Column(
                        children: [
                          GamemodeSelector(
                            gamemodes: gamemodes,
                            numPlayers: value.numPlayers,
                          ),
                          GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent:
                                        value.numPlayers as double),
                            itemBuilder: (context, index) {
                              return PlayerColumn(
                                gamemode: value.gamemode,
                                numPlayers: value.numPlayers,
                                playerIndex: index,
                                exposedDataTypes:
                                    const DataTypes.characterType(),
                              );
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            // Else, check if all players are readied-up
            // if so, stack the ready button on top
            : (value.ready)
                ? Scaffold(
                    appBar: const CustomAppBar(),
                    body: Stack(
                      alignment: Alignment.center,
                      children: [
                        ReadyButton(
                            players: value.players, gamemode: value.gamemode),
                        GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent:
                                      value.numPlayers as double),
                          itemBuilder: (context, index) {
                            return PlayerColumn(
                              gamemode: value.gamemode,
                              numPlayers: value.numPlayers,
                              playerIndex: index,
                              exposedDataTypes: const DataTypes.characterType(),
                            );
                          },
                        ),
                      ],
                    ))
                // Else just act normally
                : Scaffold(
                    appBar: const CustomAppBar(),
                    body: GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: value.numPlayers as double),
                      itemBuilder: (context, index) {
                        return PlayerColumn(
                          gamemode: value.gamemode,
                          numPlayers: value.numPlayers,
                          playerIndex: index,
                          exposedDataTypes: const DataTypes.characterType(),
                        );
                      },
                    ),
                  );
      },
    );
  }
}

/// A function for periodically checking to see if there are any new controllers
Timer checkControllers() {
  Timer timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
    if (ControllersManager.getIndexConnectedControllers().length !=
        dwtpProvider.gamepads.length) {
      List<Gamepad> gamepads = [];
      int numPlayers = 0;
      for (int index in ControllersManager.getIndexConnectedControllers()) {
        gamepads.add(
          Gamepad()
            ..connected = true
            ..index = index
            ..color = PlayerColors.indexToColor(index),
        );
        numPlayers += 1;
      }
      dwtpProvider.updateGamepads(gamepads);
      dwtpProvider.updateNumPlayers(numPlayers);
    }
  });
  return timer;
}
