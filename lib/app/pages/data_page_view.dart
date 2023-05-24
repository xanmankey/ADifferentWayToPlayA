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
/// class DWTPListView extends StatefulWidget {
///   DataTypes exposedDataTypes;
///   DWTPListView({
///     super.key,
///     required this.exposedDataTypes,
///   });
///
///   @override
///   State<DWTPListView> createState() => _DWTPListViewState();
/// }
///
/// class _DWTPListViewState extends State<DWTPListView> {
///   late Future<List<DataTypes>> dataTypesFuture;
///   Storage storage = Storage();
///
///   @override
///   Widget build(BuildContext context) {
///     return FutureBuilder(
///       future: widget.exposedDataTypes.when(
///         characterType: () => storage.getCharacterList([
///           {"name": Sort.asc}
///         ]),
///         gamemodeType: () => storage.getGamemodeList([
///           {"name": Sort.asc}
///         ]),
///         programType: () => storage.getProgramList([
///           {"abbreviation": Sort.asc}
///         ]),
///         teamType: () => storage.getTeamList([
///           {"name": Sort.asc}
///         ]),
///       ),
///       builder: (context, snapshot) {
///         if (snapshot.hasData) {
///           return Scaffold(
///             appBar: const CustomAppBar(),
///             body: PageView.builder(
///               itemBuilder: (context, index) {
///                 return widget.exposedDataTypes.when(
///                   characterType: () => [
///                     for (Character character
///                         in snapshot.data as List<Character>)
///                       CharacterEntry(character: character)
///                   ][index],
///                   gamemodeType: () => [
///                     for (Gamemode gamemode in snapshot.data as List<Gamemode>)
///                       GamemodeEntry(gamemode: gamemode)
///                   ][index],
///                   programType: () => [
///                     for (Program program in snapshot.data as List<Program>)
///                       ProgramEntry(program: program)
///                   ][index],
///                   teamType: () => [
///                     for (Team team in snapshot.data as List<Team>)
///                       TeamEntry(team: team)
///                   ][index],
///                 );
///               },
///             ),
///           );
///         } else if (snapshot.hasError) {
///           return ExceptionWidget(error: snapshot.error.toString());
///         } else {
///           return const Scaffold(
///               appBar: CustomAppBar(), body: CircularProgressIndicator());
///         }
///       },
///     );
///   }
/// }
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
  late Future<List<DataTypes>> dataTypesFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.exposedDataTypes.when(
        characterType: () => storage.getCharacterList([
          {"name": Sort.asc}
        ]),
        gamemodeType: () => storage.getGamemodeList([
          {"name": Sort.asc}
        ]),
        programType: () => storage.getProgramList([
          {"abbreviation": Sort.asc}
        ]),
        teamType: () => storage.getTeamList([
          {"name": Sort.asc}
        ]),
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: const CustomAppBar(),
            body: PageView.builder(
              itemBuilder: (context, index) {
                return widget.exposedDataTypes.when(
                  characterType: () => [
                    for (Character character
                        in snapshot.data as List<Character>)
                      CharacterEntry(character: character)
                  ][index],
                  gamemodeType: () => [
                    for (Gamemode gamemode in snapshot.data as List<Gamemode>)
                      GamemodeEntry(gamemode: gamemode)
                  ][index],
                  programType: () => [
                    for (Program program in snapshot.data as List<Program>)
                      ProgramEntry(program: program)
                  ][index],
                  teamType: () => [
                    for (Team team in snapshot.data as List<Team>)
                      TeamEntry(team: team)
                  ][index],
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return ExceptionPage(error: snapshot.error.toString());
        } else {
          return const Scaffold(
              appBar: CustomAppBar(), body: CircularProgressIndicator());
        }
      },
    );
  }
}
