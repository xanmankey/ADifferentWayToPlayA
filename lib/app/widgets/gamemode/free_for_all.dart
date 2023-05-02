import 'package:adifferentwaytoplay/domain/entities/gamemode.dart';
import 'package:flutter/material.dart';

/// A widget for displaying the options of the FreeForAll gamemode.
/// Most of the heavy lifting is done by the GamemodeEntry
/// widget, but as gamemodeOptions need to be provided on a per-
/// gamemode basis and seeing that there is an enum linking code
/// to the database, specific code must exist to account for the dynamism
/// of the program
/// ```
///
/// ```
class FreeForAllGamemodeOptions extends StatefulWidget {
  Gamemode gamemode;
  FreeForAllGamemodeOptions({super.key, required this.gamemode});

  @override
  State<FreeForAllGamemodeOptions> createState() =>
      _FreeForAllGamemodeOptionsState();
}

class _FreeForAllGamemodeOptionsState extends State<FreeForAllGamemodeOptions> {
  @override
  Widget build(BuildContext context) {
    // Free for all gamemode options are below
    return;
  }
}
