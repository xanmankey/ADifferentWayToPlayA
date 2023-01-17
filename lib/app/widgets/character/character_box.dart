import 'dart:io';

import 'package:adifferentwaytoplay/domain/entities/character.dart';
import 'package:flutter/material.dart';
import 'package:adifferentwaytoplay/app/widgets/text.dart';

// This goes inside a horizontal ListView
class CharacterBox extends StatelessWidget {
  Character character;
  CharacterBox({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextWidget(
          text: character.name,
        ),
        Image(image: FileImage(File(character.image))),
      ],
    );
  }
}
