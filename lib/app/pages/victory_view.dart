import 'dart:io';

import 'package:adifferentwaytoplay/app/provider/dwtp_provider.dart';
import 'package:adifferentwaytoplay/app/widgets/character/character_column.dart';
import 'package:adifferentwaytoplay/app/widgets/team/team_column.dart';
import 'package:adifferentwaytoplay/app/widgets/utility/custom_appbar.dart';
import 'package:adifferentwaytoplay/domain/entities/player.dart';
import 'package:adifferentwaytoplay/domain/entities/team.dart';
import 'package:flutter/material.dart';

/// A simple victory screen displayed if a victory condition has been reached
class Victory extends StatelessWidget {
  const Victory({super.key});

  @override
  Widget build(BuildContext context) {
    if (dwtpProvider.gamemode.teams == true) {
      Map<String, Team> arguments =
          ModalRoute.of(context)!.settings.arguments! as Map<String, Team>;
      return Scaffold(
        appBar: const CustomAppBar(),
        body: Stack(
          children: [
            TeamColumn(
              teamName: arguments['team']!.name,
              teamImageFilePath: arguments['team']!.logo,
            ),
            Expanded(
                child:
                    Image(image: FileImage(File('assets/images/trophy.png')))),
          ],
        ),
      );
    }
    Map<String, Player> arguments =
        ModalRoute.of(context)!.settings.arguments! as Map<String, Player>;
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Stack(
        children: [
          CharacterColumn(
            playerIndex: arguments['player']!.gamepad.value!.index.toString(),
            characterName: arguments['player']!.character.value!.name,
            characterFilePath: arguments['player']!.character.value!.image,
          ),
          Expanded(
              child: Image(image: FileImage(File('assets/images/trophy.png')))),
        ],
      ),
    );
  }
}
