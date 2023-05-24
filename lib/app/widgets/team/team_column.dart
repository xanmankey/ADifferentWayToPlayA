import 'dart:io';

import 'package:adifferentwaytoplay/app/widgets/utility/text.dart';
import 'package:flutter/material.dart';

class TeamColumn extends StatelessWidget {
  String teamName;
  String teamImageFilePath;
  CrossAxisAlignment crossAxisAlignment;
  MainAxisAlignment mainAxisAlignment;
  TeamColumn({
    super.key,
    required this.teamName,
    required this.teamImageFilePath,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      children: [
        TextWidget(
          text: teamName,
        ),
        Image(image: FileImage(File(teamImageFilePath))),
      ],
    );
  }
}
