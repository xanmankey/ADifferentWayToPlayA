import 'package:adifferentwaytoplay/app/pages/exception_view.dart';
import 'package:adifferentwaytoplay/app/constants.dart';
import 'package:adifferentwaytoplay/app/utils/exposed_types.dart';
import 'package:adifferentwaytoplay/app/widgets/character/character_entry.dart';
import 'package:adifferentwaytoplay/app/widgets/utility/custom_appbar.dart';
import 'package:adifferentwaytoplay/app/widgets/gamemode/gamemode_entry.dart';
import 'package:adifferentwaytoplay/app/widgets/program/program_entry.dart';
import 'package:adifferentwaytoplay/app/widgets/team/team_entry.dart';
import 'package:adifferentwaytoplay/data/utils/utils.dart';
import 'package:adifferentwaytoplay/domain/entities/character.dart';
import 'package:adifferentwaytoplay/domain/entities/gamemode.dart';
import 'package:adifferentwaytoplay/domain/entities/program.dart';
import 'package:adifferentwaytoplay/domain/entities/team.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

/// A multipurpose PageView widget for displaying all available:
/// characters
/// gamemodes
/// teams
/// or programs.
/// Characters and teams take data and follow predetermined layouts;
/// gamemodes and programs are more dynamic and require user-specified data and layouts
///
///
/// ```
/// ```
class DWTPListView extends StatefulWidget {
  DataTypes exposedDataTypes;
  DWTPListView({
    super.key,
    required this.exposedDataTypes,
  });

  @override
  State<DWTPListView> createState() => _DWTPListViewState();
}

class _DWTPListViewState extends State<DWTPListView> {
  late List<Character> characters;
  late List<Team> teams;
  late List<Gamemode> gamemodes;
  late List<Program> programs;

  @override
  void initState() {
    characters = storage.isarDB.characters.where().findAllSync();
    teams = storage.isarDB.teams.where().findAllSync();
    gamemodes = storage.isarDB.gamemodes.where().findAllSync();
    programs = storage.isarDB.programs.where().findAllSync();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: PageView.builder(
        itemBuilder: (context, index) {
          return widget.exposedDataTypes.when(
            characterType: () => [
              for (Character character in characters)
                CharacterEntry(character: character)
            ][index],
            gamemodeType: () => [
              for (Gamemode gamemode in gamemodes)
                GamemodeEntry(gamemode: gamemode)
            ][index],
            programType: () => [
              for (Program program in programs) ProgramEntry(program: program)
            ][index],
            teamType: () =>
                [for (Team team in teams) TeamEntry(team: team)][index],
          );
        },
      ),
    );
  }
}
