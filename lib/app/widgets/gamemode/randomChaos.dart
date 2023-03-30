import 'package:flutter/material.dart';

/// A widget for displaying the CustomGame gamemode.
/// Most of the heavy lifting is done by the GamemodeEntry
/// widget, but as gamemodeOptions need to be provided on a per-
/// gamemode basis and seeing that there is an enum linking code
/// to the database, specific code must exist to account for the dynamism
/// of the program
/// ```
///
/// ```
class CustomGameGamemodeOptions extends StatefulWidget {
  const CustomGameGamemodeOptions({super.key});

  @override
  State<CustomGameGamemodeOptions> createState() =>
      _CustomGameGamemodeOptionsState();
}

class _CustomGameGamemodeOptionsState extends State<CustomGameGamemodeOptions> {
  @override
  Widget build(BuildContext context) {
    // Random chaos gamemode options are below
    return;
  }
}
