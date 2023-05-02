import 'dart:io';

import 'package:adifferentwaytoplay/domain/entities/team.dart';
import 'package:flutter/material.dart';
import 'package:adifferentwaytoplay/app/widgets/utility/text.dart';

/// A selector for choosing a player's team affiliation;
/// goes inside a horizontal ListView
/// ```
///
/// ```
class TeamBox extends StatelessWidget {
  List<Team> teams;
  TeamBox({super.key, required this.teams});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PageView(
          children: [
            for (Team team in teams)
              Column(
                children: [
                  TextWidget(
                    text: team.name,
                  ),
                  Image(image: FileImage(File(team.logo))),
                ],
              )
          ],
        )
      ],
    );
  }
}
