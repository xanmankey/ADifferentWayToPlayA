import 'dart:io';
import 'package:adifferentwaytoplay/app/provider/dwtp_provider.dart';
import 'package:adifferentwaytoplay/app/widgets/character/character_column.dart';
import 'package:adifferentwaytoplay/data/constants.dart';
import 'package:adifferentwaytoplay/domain/entities/player.dart';
import 'package:flutter/material.dart';

import 'package:adifferentwaytoplay/domain/entities/character.dart';
import 'package:adifferentwaytoplay/app/widgets/utility/text.dart';

/// A widget that goes inside a horizontal list view in the
/// DWTP_view column; used for viewing and selecting a character.
/// ```
/// class CharacterBox extends StatelessWidget {
///   Character character;
///   CharacterBox({super.key, required this.character});
///
///   @override
///   Widget build(BuildContext context) {
///     return Column(
///       children: [
///         TextWidget(
///           text: character.name,
///         ),
///         Image(image: FileImage(File(character.image))),
///       ],
///     );
///   }
/// }
///
/// ```
///
class CharacterSelector extends StatefulWidget {
  List<Character?> characters;
  int numPlayers;
  int currentCharacter;
  int playerIndex;
  CharacterSelector({
    super.key,
    required this.characters,
    required this.numPlayers,
    required this.playerIndex,
    this.currentCharacter = 0,
  });

  @override
  State<CharacterSelector> createState() => _CharacterSelectorState();
}

class _CharacterSelectorState extends State<CharacterSelector> {
  @override
  void initState() {
    // Inserting a null option as the default value
    widget.characters.insert(0, null);
    // Adding a random option to the list of characters
    // When the start button is pressed, a check is done to look for any random options
    // If any are found, the values in the respective categories get randomly selected
    widget.characters.add(Character()
      ..image = 'assets/images/question_mark.png'
      ..name = RANDOM
      ..hit = 'Random'
      ..miss = 'Not Random'
      ..description = """You never know what random's gonna do next!"""
      ..color = Colors.black.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: PageController(
            viewportFraction: 1 / widget.numPlayers,
            initialPage: widget.currentCharacter,
          ),
          onPageChanged: (value) {
            if (value == 0) {
              dwtpProvider.updateReady(false);
            }
            List<Player> players = dwtpProvider.players;
            players[widget.playerIndex].character.value =
                widget.characters[value];
            dwtpProvider.updatePlayers(players);
          },
          itemBuilder: (context, index) {
            (widget.characters[index] == null)
                ? Container()
                : CharacterColumn(
                    characterName: widget.characters[index]!.name,
                    characterFilePath: widget.characters[index]!.image);
          },
        )
      ],
    );
  }
}
