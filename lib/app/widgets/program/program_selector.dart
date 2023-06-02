import 'dart:io';
import 'package:adifferentwaytoplay/app/pages/exception_view.dart';
import 'package:adifferentwaytoplay/app/provider/dwtp_provider.dart';
import 'package:adifferentwaytoplay/app/widgets/program/program_column.dart';
import 'package:adifferentwaytoplay/data/constants.dart';
import 'package:adifferentwaytoplay/domain/entities/player.dart';
import 'package:adifferentwaytoplay/domain/entities/setting.dart';
import 'package:flutter/material.dart';

import 'package:adifferentwaytoplay/app/utils/utils.dart';
import 'package:adifferentwaytoplay/data/utils/utils.dart';
import 'package:adifferentwaytoplay/domain/entities/program.dart';
import 'package:adifferentwaytoplay/app/widgets/utility/text.dart';
import 'package:isar/isar.dart';

/// A widget that goes inside a horizontal list view in the
/// DWTP_view column; used for viewing and selecting a DWTP (a program).
class ProgramSelector extends StatefulWidget {
  List<Program?> programs;
  int numPlayers;
  int currentProgram;
  int playerIndex;
  ProgramSelector({
    super.key,
    required this.programs,
    required this.numPlayers,
    required this.playerIndex,
    this.currentProgram = 0,
  });

  @override
  State<ProgramSelector> createState() => _ProgramSelectorState();
}

class _ProgramSelectorState extends State<ProgramSelector> {
  @override
  void initState() {
    // Inserting a null option as the default value
    widget.programs.insert(0, null);
    // Adding a random option to the list of characters
    // When the start button is pressed, a check is done to look for any random options
    // If any are found, the values in the respective categories get randomly selected
    widget.programs.add(
      Program()
        ..image = 'assets/images/question_mark.png'
        ..name = RANDOM
        ..description = """Mixin' it up a little""",
    );
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
            initialPage: widget.currentProgram,
          ),
          itemBuilder: (context, index) {
            (widget.programs[index] == null)
                ? Container()
                // : Column(
                //     children: [
                //       TextWidget(
                //         text: widget.programs[index]!.abbreviation,
                //       ),
                //       Image(
                //           image: FileImage(
                //               File(widget.programs[index]!.image))),
                //       // In case the program has individualized settings per player
                //       for (Widget widget in generateSettingsWidgets(
                //           (snapshot.data!.where((element) =>
                //               element.program.value!.id ==
                //               widget.programs[index]!.id)).toList()))
                //         widget
                //     ],
                //   );
                : ProgramColumn(
                    programName: widget.programs[index]!.abbreviation,
                    programImageFilePath: widget.programs[index]!.image,
                    individualSettingsWidgets: [
                        for (Widget widget in generateSettingsWidgets((storage
                            .isarDB.settings
                            .where()
                            .individualEqualTo(true)
                            .findAllSync())))
                          widget,
                      ]);
          },
          onPageChanged: (value) {
            if (value == 0) {
              dwtpProvider.updateReady(false);
            }
            List<Player> players = dwtpProvider.players;
            players[widget.playerIndex].program.value = widget.programs[value];
            dwtpProvider.updatePlayers(players);
          },
        ),
      ],
    );
  }
}
