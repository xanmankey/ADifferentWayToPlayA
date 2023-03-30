import 'package:adifferentwaytoplay/app/pages/exception_view.dart';
import 'package:adifferentwaytoplay/app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import 'package:adifferentwaytoplay/app/widgets/text.dart';
import 'package:adifferentwaytoplay/data/utils/utils.dart';
import 'package:adifferentwaytoplay/data/utils/vars.dart';
import 'package:adifferentwaytoplay/domain/entities/gamemode.dart';

/// A widget for selecting the desired gamemode;
/// rendered as a small horizontal page view at the top of DWTP_view.dart
/// ```
/// class GamemodeSelector extends StatefulWidget {
///   GamemodeSelector({super.key});
///
///   @override
///   State<GamemodeSelector> createState() => _GamemodeSelectorState();
/// }
///
/// class _GamemodeSelectorState extends State<GamemodeSelector> {
///   Storage storage = Storage();
///   late Future<List<Gamemode>> gamemodesFuture;
///   late List<Gamemode> gamemodes;
///   late PageController gamemodeController = PageController(initialPage: 0);
///   @override
///   void initState() {
///     gamemodesFuture = storage.getGamemodeList([
///       {'name': Sort.asc}
///     ]);
///     super.initState();
///   }
///
///   @override
///   Widget build(BuildContext context) {
///     return FutureBuilder(
///       future: gamemodesFuture,
///       builder: (context, snapshot) {
///         if (snapshot.hasData) {
///           gamemodes = [
///             for (Gamemode gamemode in snapshot.data as List<Gamemode>) gamemode
///           ];
///           return Scaffold(
///               appBar: const CustomAppBar(),
///               body: PageView(
///                 scrollDirection: Axis.horizontal,
///                 controller: gamemodeController,
///                 children: [
///                   for (Gamemode gamemode in gamemodes)
///                     TextWidget(text: gamemode.name)
///                 ],
///               ));
///         } else if (snapshot.hasError) {
///           return ExceptionWidget(error: snapshot.error.toString());
///         } else {
///           return const Scaffold(
///               appBar: CustomAppBar(), body: CircularProgressIndicator());
///         }
///       },
///     );
///   }
/// }
/// ```
class GamemodeSelector extends StatefulWidget {
  GamemodeSelector({super.key});

  @override
  State<GamemodeSelector> createState() => _GamemodeSelectorState();
}

class _GamemodeSelectorState extends State<GamemodeSelector> {
  late Future<List<Gamemode>> gamemodesFuture;
  late List<Gamemode> gamemodes;
  late PageController gamemodeController = PageController(initialPage: 0);
  @override
  void initState() {
    gamemodesFuture = storage.getGamemodeList([
      {'name': Sort.asc}
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: gamemodesFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          gamemodes = [
            for (Gamemode gamemode in snapshot.data as List<Gamemode>) gamemode
          ];
          return Scaffold(
              appBar: const CustomAppBar(),
              body: PageView(
                scrollDirection: Axis.horizontal,
                controller: gamemodeController,
                children: [
                  for (Gamemode gamemode in gamemodes)
                    TextWidget(text: gamemode.name)
                ],
              ));
        } else if (snapshot.hasError) {
          return ExceptionWidget(error: snapshot.error.toString());
        } else {
          return const Scaffold(
              appBar: CustomAppBar(), body: CircularProgressIndicator());
        }
      },
    );
  }
}
