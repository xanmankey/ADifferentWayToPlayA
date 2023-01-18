import 'package:adifferentwaytoplay/app/widgets/custom_appbar.dart';
import 'package:adifferentwaytoplay/app/widgets/team/team_entry.dart';
import 'package:adifferentwaytoplay/data/utils/utils.dart';
import 'package:adifferentwaytoplay/data/utils/vars.dart';
import 'package:adifferentwaytoplay/domain/entities/team.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

class TeamList extends StatefulWidget {
  const TeamList({super.key});

  @override
  State<TeamList> createState() => _TeamListState();
}

class _TeamListState extends State<TeamList> {
  late List<Team> teams;
  Storage storage = Storage();
  @override
  void initState() async {
    teams = await storage.getTeamList([
      {"name": Sort.asc}
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: PageView(
        children: [for (Team team in teams) TeamEntry(team: team)],
      ),
    );
  }
}
