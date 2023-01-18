// A static class for easy-access routing
class Pages {
  static String home = '/home';
  static String gamemodeSelection = '/gamemodeSelection';
  static String programSelection = '/programSelection';
  static String MIOP = '/MIOP';
  static String TC = '/TC';
  static String FC = '/FC';
  static String RC = '/RC';
  static String DC = '/DC';
  static String playerSelection = '/playerSelection';
  static String tournamentSelection = '/tournamentSelection';
  static String tournamentBracket = '/tournamentBracket';
  static String victory = '/victory';
}

// A static class for UI constants
class UIConstants {}

// A static variable for exceptions
String error = "error";

// A static class for loading assets
class Assets {
  static String imagePath = 'assets/images';
  static String musicPath = 'assets/music';
  static String fontPath = 'assets/fonts';

  static String logo = "$imagePath/logo.png";
  static String ico = "$imagePath/logo.ico";

  static String MIOP = "$imagePath/MIOP.png";
  static String RC = "$imagePath/RC.png";
  static String TC = "$imagePath/TC.png";
  static String FC = "$imagePath/FC.png";

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

// Why would a snackbar work if an error page doesn't?
// That logic doesn't make sense, so I'm likely doing something wrong
// void handleError(key, error) {
//   // Show snackbar
//   showGenericSnackbar(key, error);
// }

// void handleRefresh() {
//   // Show refresh symbol
// }
