import 'package:adifferentwaytoplay/app/widgets/custom_appbar.dart';
import 'package:adifferentwaytoplay/app/widgets/gamemode/gamemode_entry.dart';
import 'package:adifferentwaytoplay/data/utils/utils.dart';
import 'package:adifferentwaytoplay/domain/entities/gamemode.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

class GamemodeList extends StatefulWidget {
  const GamemodeList({super.key});

  @override
  State<GamemodeList> createState() => _GamemodeListState();
}

class _GamemodeListState extends State<GamemodeList> {
  late List<Gamemode> gamemodes;
  Storage storage = Storage();
  @override
  void initState() async {
    gamemodes = await storage.getGamemodeList([
      {"name": Sort.asc}
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: PageView(
        children: [
          for (Gamemode gamemode in gamemodes) GamemodeEntry(gamemode: gamemode)
        ],
      ),
    );
  }
}
