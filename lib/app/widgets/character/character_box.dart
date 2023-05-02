import 'dart:io';
import 'package:adifferentwaytoplay/data/constants.dart';
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
class CharacterBox extends StatelessWidget {
  List<Character> characters;
  CharacterBox({super.key, required this.characters});

  @override
  Widget build(BuildContext context) {
    // Adding a random option to the list of characters
    // When the start button is pressed, a check is done to look for any random options
    // If any are found, the values in the respective categories get randomly selected
    characters.add(Character()
      ..image = 'assets/images/question_mark.png'
      ..name = RANDOM
      ..hit = 'Random'
      ..miss = 'Not Random'
      ..description = """You never know what random's gonna do next!"""
      ..color = Colors.black.value);
    return Row(
      children: [
        PageView(
          children: [
            for (Character character in characters)
              Column(
                children: [
                  TextWidget(
                    text: character.name,
                  ),
                  Image(image: FileImage(File(character.image))),
                ],
              )
          ],
        )
      ],
    );
  }
}
