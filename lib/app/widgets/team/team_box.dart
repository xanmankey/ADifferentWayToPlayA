import 'dart:io';

import 'package:adifferentwaytoplay/domain/entities/team.dart';
import 'package:flutter/material.dart';
import 'package:adifferentwaytoplay/app/widgets/text.dart';

/// A selector for choosing a player's team affiliation;
/// goes inside a horizontal ListView
/// ```
///
/// ```
class TeamBox extends StatelessWidget {
  Team team;
  TeamBox({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextWidget(
          text: team.name,
        ),
        Image(image: FileImage(File(team.logo))),
      ],
    );
  }
}
