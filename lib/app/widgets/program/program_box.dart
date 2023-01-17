import 'dart:io';

import 'package:adifferentwaytoplay/domain/entities/program.dart';
import 'package:flutter/material.dart';
import 'package:adifferentwaytoplay/app/widgets/text.dart';

// This goes inside a horizontal ListView
class ProgramBox extends StatelessWidget {
  Program program;
  ProgramBox({super.key, required this.program});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextWidget(
          text: program.abbreviation,
        ),
        Image(image: FileImage(File(program.image))),
      ],
    );
  }
}
