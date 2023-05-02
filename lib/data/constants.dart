import 'package:adifferentwaytoplay/domain/constants.dart';
import 'package:adifferentwaytoplay/domain/utils/utils.dart';

/// The ColorVars class with some constants that mirror the primary
/// ColorVars (modeled off of those of the flutter material 'Colors' class)
/// The color picker is used later on to select one of these colors,
/// but only a small number of colors are supported for convenience purposes
/// (e.g. sorting)
///
/// ```
/// class ColorVars {
///  static int red = 0xFFF44336;
///  static int pink = 0xFFFF4081;
///  static int purple = 0xFF9C27B0;
///  static int deepPurple = 0xFF673AB7;
///  static int indigo = 0xFF3F51B5;
///  static int blue = 0xFF2196F3;
///  static int lightBlue = 0xFF03A9F4;
///  static int cyan = 0xFF00BCD4;
///  static int teal = 0xFF009688;
///  static int green = 0xFF4CAF50;
///  static int lightGreen = 0xFF8BC34A;
///  static int lime = 0xFFCDDC39;
///  static int yellow = 0xFFFFEB3B;
///  static int amber = 0xFFFFC107;
///  static int orange = 0xFFFF9800;
///  static int deepOrange = 0xFFFF5722;
///  static int brown = 0xFF795548;
///  static int blueGrey = 0xFF607D8B;
///  static int black = 0xFF000000;
///  static int white = 0xFFFFFFFF;
/// }
/// ```
class ColorVars {
  static int red = 0xFFF44336;
  static int pink = 0xFFFF4081;
  static int purple = 0xFF9C27B0;
  static int deepPurple = 0xFF673AB7;
  static int indigo = 0xFF3F51B5;
  static int blue = 0xFF2196F3;
  static int lightBlue = 0xFF03A9F4;
  static int cyan = 0xFF00BCD4;
  static int teal = 0xFF009688;
  static int green = 0xFF4CAF50;
  static int lightGreen = 0xFF8BC34A;
  static int lime = 0xFFCDDC39;
  static int yellow = 0xFFFFEB3B;
  static int amber = 0xFFFFC107;
  static int orange = 0xFFFF9800;
  static int deepOrange = 0xFFFF5722;
  static int brown = 0xFF795548;
  static int blueGrey = 0xFF607D8B;
  static int black = 0xFF000000;
  static int white = 0xFFFFFFFF;
}

/// For random options
const String RANDOM = "Random";

/// Utility function for quickly generating tcSettings
Map<String, Setting> tcSettingsValues(double time, bool hold, String input) {
  return {
    "time": Setting(
      name: "time",
      description: "The length of the press",
      value: time,
      settingsWidget: SettingsWidgets.numField,
    ),
    "hold": Setting(
      name: "hold",
      description:
          "Whether to hold the input or not. Time has no impact if true.",
      value: hold,
      settingsWidget: SettingsWidgets.boolDropdown,
    ),
    "input": Setting(
      name: "input",
      value: input,
      settingsWidget: SettingsWidgets.inputsDropdown,
    )
  };
}

/// Utility function for quickly generating fcSettings
Map<String, Setting> fcSettingsValues(int numPresses, String input) {
  return {
    "filter": Setting(
      name: "presses",
      description:
          "The number of inputs that you can take before the desired effect",
      value: numPresses,
      settingsWidget: SettingsWidgets.numField,
    ),
    "input": Setting(
      name: "input",
      value: input,
      settingsWidget: SettingsWidgets.inputsDropdown,
    )
  };
}

// enum ProgramOptionsValues {
// Because there are so many program options,
// I figured strings would be a fine way to handle it
// Maybe I should write some utility functions for initial_vars?
// }

/// An enum containing predefined values for gamemode options
/// If you define your own gamemode, you might want to add your
/// gamemode option values here
/// ```
///
/// ```
enum GamemodeOptionsValues {
  score,
  weightedPrograms;

  @override
  String toString() {
    switch (this) {
      case GamemodeOptionsValues.score:
        return 'score';
      case GamemodeOptionsValues.weightedPrograms:
        return 'weighted programs';
    }
  }
}

/// An enum for ensuring consistent player colors
enum PlayerColors {
  p1,
  p2,
  p3,
  p4;

  int toColor() {
    switch (this) {
      case PlayerColors.p1:
        return ColorVars.yellow;
      case PlayerColors.p2:
        return ColorVars.blue;
      case PlayerColors.p3:
        return ColorVars.green;
      case PlayerColors.p4:
        return ColorVars.red;
      default:
        return ColorVars.white;
    }
  }
}
