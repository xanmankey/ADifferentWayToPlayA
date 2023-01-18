import 'package:adifferentwaytoplay/app/pages/program_list/program_list_view.dart';
import 'package:adifferentwaytoplay/app/widgets/character/character_entry.dart';
import 'package:adifferentwaytoplay/app/widgets/custom_appbar.dart';
import 'package:adifferentwaytoplay/data/utils/utils.dart';
import 'package:adifferentwaytoplay/domain/entities/character.dart';
import 'package:adifferentwaytoplay/domain/entities/program.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

class CharacterList extends StatefulWidget {
  const CharacterList({super.key});

  @override
  State<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  late List<Character> characters;
  Storage storage = Storage();
  @override
  void initState() async {
    characters = await storage.getCharacterList([
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
          for (Character character in characters)
            CharacterEntry(character: character)
        ],
      ),
    );
  }
}
