import 'dart:io';

import 'package:adifferentwaytoplay/app/widgets/utility/text.dart';
import 'package:flutter/material.dart';

class ProgramColumn extends StatelessWidget {
  String programName;
  String programImageFilePath;
  List<Widget>? individualSettingsWidgets;
  CrossAxisAlignment crossAxisAlignment;
  MainAxisAlignment mainAxisAlignment;
  ProgramColumn({
    super.key,
    required this.programName,
    required this.programImageFilePath,
    this.individualSettingsWidgets,
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
          text: programName,
        ),
        Image(image: FileImage(File(programImageFilePath))),
        for (Widget widget in individualSettingsWidgets ?? []) widget,
      ],
    );
  }
}
