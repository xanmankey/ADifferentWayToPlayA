import 'package:adifferentwaytoplay/app/widgets/utility/custom_appbar.dart';
import 'package:adifferentwaytoplay/app/widgets/player_column.dart';
import 'package:flutter/material.dart';

/// The player setup screen; x number columns equal to the number of players,
/// where players can choose among a couple things:
/// - Team
/// - Character
/// - A DWTP
/// DWTP and Team depend on the current gamemode, which can be selected
/// in a top horizontal scrollbar (perhaps a page view)
class DWTP extends StatefulWidget {
  const DWTP({super.key});

  @override
  State<DWTP> createState() => _DWTPState();
}

class _DWTPState extends State<DWTP> {
  int numPlayers = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: GridView.count(
        crossAxisCount: numPlayers,
        children: [
          PlayerColumn(),
        ],
      ),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   setState(() {
      //     numPlayers += 1;
      //   });
      // }),
    );
  }
}

void randomChaos() {
  throw UnimplementedError();
}
