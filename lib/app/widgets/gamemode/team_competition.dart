import 'package:adifferentwaytoplay/app/widgets/utility/text.dart';
import 'package:adifferentwaytoplay/data/constants.dart';
import 'package:adifferentwaytoplay/domain/entities/gamemode.dart';
import 'package:flutter/material.dart';

/// A widget for displaying the options of the TeamCompetition gamemode.
/// Most of the heavy lifting is done by the GamemodeEntry
/// widget, but as gamemodeOptions need to be provided on a per-
/// gamemode basis and seeing that there is an enum linking code
/// to the database, specific code must exist to account for the dynamism
/// of the program
/// ```
///
/// ```
class TeamCompetitionGamemodeOptions extends StatefulWidget {
  Gamemode gamemode;
  TeamCompetitionGamemodeOptions({super.key, required this.gamemode});

  @override
  State<TeamCompetitionGamemodeOptions> createState() =>
      _TeamCompetitionGamemodeOptionsState();
}

class _TeamCompetitionGamemodeOptionsState
    extends State<TeamCompetitionGamemodeOptions> {
  @override
  Widget build(BuildContext context) {
    String weightedPrograms = widget.gamemode
        .mapValues[GamemodeOptionsValues.weightedPrograms.toString()]!.value
        .toString();
    // Team competition gamemode options are below
    return Column(
      children: [
        Row(
          children: [
            // TODO: I would like to use a DWTP field here to ensure that it's numeric
            // TODO: implement onChanged for both to write value to db
            TextField(
                controller: TextEditingController(
                    text:
                        '${widget.gamemode.mapValues[GamemodeOptionsValues.score.toString()]!.value}'), 
                onChanged: ,),
            Column(
              children: [
                const TextWidget(
                  text: "Weight program scores",
                ),
                DropdownButton(
                  value: DropdownMenuItem(
                      child: TextWidget(text: weightedPrograms)),
                  items: const [
                    DropdownMenuItem(child: Text("true")),
                    DropdownMenuItem(child: TextWidget(text: "false"))
                  ],
                  onChanged: (value) {
                    setState(() {
                      // Update the value in the GUI
                      weightedPrograms = value;
                      // Update the value in the database
                      // TODO: figure out how to write the value to the db
                    });
                  },
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
