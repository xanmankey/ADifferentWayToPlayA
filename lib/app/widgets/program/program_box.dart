import 'dart:io';
import 'package:flutter/material.dart';

import 'package:adifferentwaytoplay/app/utils/utils.dart';
import 'package:adifferentwaytoplay/data/utils/utils.dart';
import 'package:adifferentwaytoplay/domain/entities/program.dart';
import 'package:adifferentwaytoplay/app/widgets/text.dart';
import 'package:isar/isar.dart';

/// A widget that goes inside a horizontal list view in the
/// DWTP_view column; used for viewing and selecting a DWTP (a program).
/// ```
///
/// ```
class ProgramBox extends StatefulWidget {
  Program program;
  Widget programSettings;
  ProgramBox({super.key, required this.program, required this.programSettings});

  @override
  State<ProgramBox> createState() => _ProgramBoxState();
}

class _ProgramBoxState extends State<ProgramBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextWidget(
          text: widget.program.abbreviation,
        ),
        Image(image: FileImage(File(widget.program.image))),
        widget.programSettings,
      ],
    );
  }
}
