import 'package:flutter/material.dart';

/// A widget for displaying the options of the FC program.
/// Most of the heavy lifting is done by the ProgramEntry
/// widget, but as programOptions need to be provided on a per-
/// program basis and seeing that there is an enum linking code
/// to the database, specific code must exist to account for the dynamism
/// of the program
/// ```
///
/// ```
class MIOPProgramOptions extends StatefulWidget {
  const MIOPProgramOptions({super.key});

  @override
  State<MIOPProgramOptions> createState() => _MIOPProgramOptionsState();
}

class _MIOPProgramOptionsState extends State<MIOPProgramOptions> {
  @override
  Widget build(BuildContext context) {
    // Program options for FC can be found below
    return;
  }
}
