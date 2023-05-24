import 'dart:io';

import 'package:adifferentwaytoplay/app/widgets/utility/text.dart';
import 'package:flutter/material.dart';

class CharacterColumn extends StatelessWidget {
  String? playerIndex;
  String characterName;
  String characterFilePath;
  CrossAxisAlignment crossAxisAlignment;
  MainAxisAlignment mainAxisAlignment;
  CharacterColumn({
    super.key,
    required this.characterName,
    required this.characterFilePath,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.playerIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      children: [
        TextWidget(text: playerIndex.toString()),
        TextWidget(
          text: characterName,
        ),
        Image(image: FileImage(File(characterFilePath))),
      ],
    );
  }
}
