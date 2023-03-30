// A static class for easy-access routing
import 'package:flutter/material.dart';

class Pages {
  static String home = '/home';
  static String gamemodeSelection = '/gamemodeSelection';
  static String programSelection = '/programSelection';
  static String miop = '/MIOP';
  static String tc = '/TC';
  static String fc = '/FC';
  static String rc = '/RC';
  static String dc = '/DC';
  static String playerSelection = '/playerSelection';
  static String tournamentSelection = '/tournamentSelection';
  static String tournamentBracket = '/tournamentBracket';
  static String victory = '/victory';
}

/// An enum containing predefined gamemodeOptions
/// If you define your own gamemode, you will need to recognize
/// your gamemodeOptions Widget here
/// ```
///
/// ```
enum GamemodeOptions {
  freeForAllOptions,
  teamCompetitionOptions,
  randomChaosOptions,
  customGameOptions;

  Widget toWidget() {
    switch (this) {
      case freeForAllOptions:
        return FreeForAllGamemodeOptions();
      case teamCompetitionOptions:
        return TeamCompetitionGamemodeOptions();
      case randomChaosOptions:
        return RandomChaosGamemodeOptions();
      case customGameOptions:
        return CustomGameGamemodeOptions();
      default:
        return Container();
    }
  }
}

/// An enum containing predefined programOptions
/// If you define your own program, you will need to recognize
/// your programOptions Widget here
/// ```
///
/// ```
enum ProgramOptions {
  dcOptions,
  tcOptions,
  fcOptions,
  rcOptions,
  miopOptions;

  Widget toWidget() {
    switch (this) {
      case dcOptions:
        return DCProgramOptions();
      case tcOptions:
        return TCProgramOptions();
      case fcOptions:
        return FCProgramOptions();
      case rcOptions:
        return RCProgramOptions();
      case miopOptions:
        return MIOPProgramOptions();
      default:
        return Container();
    }
  }
}

// A static class for UI constants
class UIConstants {}

// A static class for loading assets
class Assets {
  static String imagePath = 'assets/images';
  static String musicPath = 'assets/music';
  static String fontPath = 'assets/fonts';

  static String logo = "$imagePath/logo.png";
  static String ico = "$imagePath/logo.ico";

  static String miop = "$imagePath/MIOP.png";
  static String rc = "$imagePath/RC.png";
  static String tc = "$imagePath/TC.png";
  static String fc = "$imagePath/FC.png";

  static String customGame = "$imagePath/custom_game.png";
  static String divider = "$imagePath/divider.png";
  static String tournament = "$imagePath/tournament.png";
  static String trophy = "$imagePath/trophy.png";

  static String appleKid = "$imagePath/appleKid.png";
  static String bananaKid = "$imagePath/bananaKid.jpg";
  static String dinofish = "$imagePath/dinofish.png";
  static String gunlessGuy = "$imagePath/gunlessGuy.png";
  static String refrigeratorExhibitionGuy =
      "$imagePath/refrigeratorExhibitionGuy.png";
  static String john = "$imagePath/john.jpg";
  static String ptSign = "$imagePath/pythagoreanTheorumSign.png";
  static String qfSign = "$imagePath/quadraticFormulaSign.png";
}
