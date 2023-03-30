import 'dart:convert';

import 'package:adifferentwaytoplay/data/utils/utils.dart';
import 'package:adifferentwaytoplay/domain/entities/character.dart';
import 'package:adifferentwaytoplay/domain/entities/gamemode.dart';
import 'package:adifferentwaytoplay/domain/entities/gamepad.dart';
import 'package:adifferentwaytoplay/domain/entities/player.dart';
import 'package:adifferentwaytoplay/domain/entities/program.dart';
import 'package:adifferentwaytoplay/domain/entities/settings.dart';
import 'package:adifferentwaytoplay/domain/entities/team.dart';
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

ProgramRunner programRunner = ProgramRunner();

/// ALL objects (including the ones in lists) are also variables
/// for testing convenience (I want to sort manually)
// Initial collection data
// Note that during program selection there should also be a (RANDOM PROGRAM) option

class ProgramData {
  static Program MIOP = Program()
    ..image = "assets/images/MIOP.png"
    ..description =
        "Bringing the principles of democracy to video games in an all new way!"
    ..name = "Multiple Inputs One Port (MIOP)"
    ..abbreviation = "MIOP"
    ..score = 6;
  static Program TC = Program()
    ..image = "assets/images/TC.png"
    ..description = "'Couldn't have said it better myself'"
    ..name = "Text Commands (TC)"
    ..abbreviation = "TC"
    ..settings.addAll(TCsettings)
    ..score = 8;
  static Program RC = Program()
    ..image = "assets/images/RC.png"
    ..description = "'For when up feels like down'"
    ..name = "Randomized Controls (RC)"
    ..abbreviation = "RC"
    ..settings.addAll(RCsettings)
    ..score = 4;
  static Program FC = Program()
    ..image = "assets/images/FC.png"
    ..description = "'I've always been a one-press kind of guy'"
    ..name = "Filtered Controls (FC)"
    ..abbreviation = "FC"
    ..settings.addAll(FCsettings)
    ..score = 7;
  static Program DC = Program()
    ..image = "assets/images/DC.png"
    ..description = "'Who says you have to spend \$60 on a controller?'"
    ..name = "Different Controllers (DC)"
    ..abbreviation = "DC"
    ..settings.addAll(DCsettings)
    ..score = 5;
  static Program TESTProgram = Program()
    ..image = "assets/images/noTestImage.png"
    ..description = "'I've always been a testing kind of guy'"
    ..name = "Testing"
    ..abbreviation = "TEST";
  static Program TESTProgram2 = Program()
    ..image = "assets/images/noTestImage.png"
    ..description = "'I believe in second chances'"
    ..name = "Testing numero dos"
    ..abbreviation = "TEST2";
}

List<Program> programs = [
  ProgramData.MIOP,
  ProgramData.TC,
  ProgramData.RC,
  ProgramData.FC,
  ProgramData.DC,
];

/// One var is defined of each type for testing purposes
/// And an encompassing class is used for organizational structure
/// Note that with this setup, the command to generate settings for a program is as follows:
/// Get all the settings not part of a group that have that program. Display them.
/// Display the settings that ARE part of a group by displaying the card
/// and then retrieving the other settings as a dialog on press
/// (note that loading the token happens in the python script)
/// How to handle exceptions?
class TCSettingsData {
  static Setting channelID = Setting()
    ..title = "Discord text channel ID"
    ..description =
        "The Discord text channel ID from which commands should be read"
    ..enabled = true
    ..individual = true
    ..widget = SettingsWidgets.textField
    ..ready = false
    ..validation = ((value) {
      if (value as int != 19) {
        return 'Not a valid text channel id length';
      }
      // TODO: I wanted to validate in here, but unfortunately async validators
      // require some extra work, and it'd probably easier to just validate in python
      // bool isId = programRunner.checkToken(value);
      // if (isId != true) {
      //   return "Not a valid text channel id";
      // }
      return null;
    });

  static Setting aSetting = Setting()
    ..title = Inputs.a.toString()
    ..description = "Presses the A button"
    ..enabled = true
    ..group = [
      aSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "time",
        description: "The length of the button press",
        enabled: aSetting.enabled,
        mapValues: {"time": 0.2},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "hold",
        enabled: aSetting.enabled,
        description:
            "Whether to hold the input or not. Time has no impact if true.",
        mapValues: {"hold": false},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: aSetting.enabled,
        mapValues: {"input": Inputs.a},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.button
    ..widget = SettingsWidgets.card;

  static Setting bSetting = Setting()
    ..title = Inputs.b.toString()
    ..description = "Presses the B button"
    ..enabled = true
    ..group = [
      bSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "time",
        description: "The length of the button press",
        enabled: bSetting.enabled,
        mapValues: {"time": 0.2},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "hold",
        description:
            "Whether to hold the input or not. Time has no impact if true.",
        enabled: bSetting.enabled,
        mapValues: {"hold": false},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: bSetting.enabled,
        mapValues: {"input": Inputs.b},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.button
    ..widget = SettingsWidgets.card;

  static Setting xSetting = Setting()
    ..title = Inputs.x.toString()
    ..description = "Presses the X button"
    ..enabled = true
    ..group = [
      xSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "time",
        description: "The length of the button press",
        enabled: xSetting.enabled,
        mapValues: {"time": 0.2},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "hold",
        description:
            "Whether to hold the input or not. Time has no impact if true.",
        enabled: xSetting.enabled,
        mapValues: {"hold": false},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: xSetting.enabled,
        mapValues: {"input": Inputs.x},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.button
    ..widget = SettingsWidgets.card;

  static Setting ySetting = Setting()
    ..title = Inputs.y.toString()
    ..description = "Presses the Y button"
    ..enabled = true
    ..group = [
      ySetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "time",
        description: "The length of the button press",
        enabled: ySetting.enabled,
        mapValues: {"time": 0.2},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "hold",
        description:
            "Whether to hold the input or not. Time has no impact if true.",
        enabled: ySetting.enabled,
        mapValues: {"hold": false},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: ySetting.enabled,
        mapValues: {"input": Inputs.y},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.button
    ..widget = SettingsWidgets.card;

  static Setting rbSetting = Setting()
    ..title = Inputs.rb.toString()
    ..description = "Presses the RB button"
    ..enabled = true
    ..group = [
      rbSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "time",
        description: "The length of the button press",
        enabled: rbSetting.enabled,
        mapValues: {"time": 0.2},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "hold",
        description:
            "Whether to hold the input or not. Time has no impact if true.",
        enabled: rbSetting.enabled,
        mapValues: {"hold": false},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: rbSetting.enabled,
        mapValues: {"input": Inputs.rb},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.button
    ..widget = SettingsWidgets.card;

  static Setting lbSetting = Setting()
    ..title = Inputs.lb.toString()
    ..description = "Presses the LB button"
    ..enabled = true
    ..group = [
      lbSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "time",
        description: "The length of the button press",
        enabled: lbSetting.enabled,
        mapValues: {"time": 0.2},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "hold",
        description:
            "Whether to hold the input or not. Time has no impact if true.",
        enabled: lbSetting.enabled,
        mapValues: {"hold": false},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: lbSetting.enabled,
        mapValues: {"input": Inputs.lb},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.button
    ..widget = SettingsWidgets.card;

  static Setting startSetting = Setting()
    ..title = Inputs.start.toString()
    ..description = "Presses the start button"
    ..enabled = false
    ..group = [
      startSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "time",
        description: "The length of the button press",
        enabled: startSetting.enabled,
        mapValues: {"time": 0.2},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "hold",
        description:
            "Whether to hold the input or not. Time has no impact if true.",
        enabled: startSetting.enabled,
        mapValues: {"hold": false},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: startSetting.enabled,
        mapValues: {"input": Inputs.start},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.button
    ..widget = SettingsWidgets.card;

  static Setting selectSetting = Setting()
    ..title = Inputs.select.toString()
    ..description = "Presses the select button"
    ..enabled = true
    ..group = [
      selectSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "time",
        description: "The length of the button press",
        enabled: selectSetting.enabled,
        mapValues: {"time": 0.2},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "hold",
        description:
            "Whether to hold the input or not. Time has no impact if true.",
        enabled: selectSetting.enabled,
        mapValues: {"hold": false},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: selectSetting.enabled,
        mapValues: {"input": Inputs.select},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.button
    ..widget = SettingsWidgets.card;

  static Setting lThumbSetting = Setting()
    ..title = "lThumb"
    ..description = "Presses the left thumb stick inwards"
    ..enabled = true
    ..group = [
      lThumbSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "time",
        description: "The length of the button press",
        enabled: lThumbSetting.enabled,
        mapValues: {"time": 0.2},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "hold",
        description:
            "Whether to hold the input or not. Time has no impact if true.",
        enabled: lThumbSetting.enabled,
        mapValues: {"hold": false},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: lThumbSetting.enabled,
        mapValues: {"input": Inputs.lThumb},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.button
    ..widget = SettingsWidgets.card;

  static Setting toggleASetting = Setting()
    ..title = "toggleA"
    ..description = "Hold (or stop holding) the A button"
    ..enabled = true
    ..group = [
      toggleASetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "time",
        description: "The length of the button press",
        enabled: toggleASetting.enabled,
        mapValues: {"time": 0.2},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "hold",
        description:
            "Whether to hold the input or not. Time has no impact if true.",
        enabled: toggleASetting.enabled,
        mapValues: {"hold": true},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: toggleASetting.enabled,
        mapValues: {"input": Inputs.a},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.button
    ..widget = SettingsWidgets.card;

  static Setting toggleBSetting = Setting()
    ..title = "toggleB"
    ..description = "Hold (or stop holding) the B button"
    ..enabled = true
    ..group = [
      toggleBSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "time",
        description: "The length of the button press",
        enabled: toggleBSetting.enabled,
        mapValues: {"time": 0.2},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "hold",
        description:
            "Whether to hold the input or not. Time has no impact if true.",
        enabled: toggleBSetting.enabled,
        mapValues: {"hold": true},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: toggleBSetting.enabled,
        mapValues: {"input": Inputs.b},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.button
    ..widget = SettingsWidgets.card;

  static Setting toggleXSetting = Setting()
    ..title = "toggleX"
    ..description = "Hold (or stop holding) the X button"
    ..enabled = true
    ..group = [
      toggleXSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "time",
        description: "The length of the button press",
        enabled: toggleXSetting.enabled,
        mapValues: {"time": 0.2},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "hold",
        description:
            "Whether to hold the input or not. Time has no impact if true.",
        enabled: toggleXSetting.enabled,
        mapValues: {"hold": true},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: toggleXSetting.enabled,
        mapValues: {"input": Inputs.x},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.button
    ..widget = SettingsWidgets.card;

  static Setting toggleYSetting = Setting()
    ..title = "toggleY"
    ..description = "Hold (or stop holding) the Y button"
    ..enabled = true
    ..group = [
      toggleYSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "time",
        description: "The length of the button press",
        enabled: toggleYSetting.enabled,
        mapValues: {"time": 0.2},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "hold",
        description:
            "Whether to hold the input or not. Time has no impact if true.",
        enabled: toggleYSetting.enabled,
        mapValues: {"hold": true},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: toggleYSetting.enabled,
        mapValues: {"input": Inputs.y},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.button
    ..widget = SettingsWidgets.card;

  static Setting ltSetting = Setting()
    ..title = "LT"
    ..description = "Press the left trigger"
    ..enabled = true
    ..group = [
      ltSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "time",
        description: "The length of the button press",
        enabled: ltSetting.enabled,
        mapValues: {"time": 0.2},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "hold",
        description:
            "Whether to hold the input or not. Time has no impact if true.",
        enabled: ltSetting.enabled,
        mapValues: {"hold": false},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: ltSetting.enabled,
        mapValues: {"input": Inputs.lt},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.trigger
    ..widget = SettingsWidgets.card;

  static Setting rtSetting = Setting()
    ..title = "RT"
    ..description = "Press the right trigger"
    ..enabled = true
    ..group = [
      rtSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "time",
        description: "The length of the button press",
        enabled: rtSetting.enabled,
        mapValues: {"time": 0.2},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "hold",
        description:
            "Whether to hold the input or not. Time has no impact if true.",
        enabled: rtSetting.enabled,
        mapValues: {"hold": false},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: rtSetting.enabled,
        mapValues: {"input": Inputs.rt},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.trigger
    ..widget = SettingsWidgets.card;

  static Setting toggleLTSetting = Setting()
    ..title = "toggleLT"
    ..description = "Hold (or stop holding) the left trigger"
    ..enabled = true
    ..group = [
      toggleLTSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "time",
        description: "The length of the button press",
        enabled: toggleLTSetting.enabled,
        mapValues: {"time": 0.2},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "hold",
        description:
            "Whether to hold the input or not. Time has no impact if true.",
        enabled: toggleLTSetting.enabled,
        mapValues: {"hold": true},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: toggleLTSetting.enabled,
        mapValues: {"input": Inputs.lt},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.trigger
    ..widget = SettingsWidgets.card;

  static Setting toggleRTSetting = Setting()
    ..title = "toggleRT"
    ..description = "Hold (or stop holding) the right trigger"
    ..enabled = true
    ..group = [
      toggleRTSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "time",
        description: "The length of the button press",
        enabled: toggleRTSetting.enabled,
        mapValues: {"time": 0.2},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "hold",
        description:
            "Whether to hold the input or not. Time has no impact if true.",
        enabled: toggleRTSetting.enabled,
        mapValues: {"hold": true},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: toggleRTSetting.enabled,
        mapValues: {"input": Inputs.rt},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.trigger
    ..widget = SettingsWidgets.card;

  static Setting lightUpSetting = Setting()
    ..title = "lightUp"
    ..description = "Move the left stick up for a specified amount of time"
    ..enabled = true
    ..group = [
      lightUpSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "time",
        description: "The length of the button press",
        enabled: lightUpSetting.enabled,
        mapValues: {"time": 0.25},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "hold",
        description:
            "Whether to hold the input or not. Time has no impact if true.",
        enabled: lightUpSetting.enabled,
        mapValues: {"hold": false},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: lightUpSetting.enabled,
        mapValues: {"input": Inputs.lUp},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.stick
    ..widget = SettingsWidgets.card;

  static Setting lightDownSetting = Setting()
    ..title = "lightDown"
    ..description = "Move the left stick down for a specified amount of time"
    ..enabled = true
    ..group = [
      lightDownSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "time",
        description: "The length of the button press",
        enabled: lightDownSetting.enabled,
        mapValues: {"time": 0.25},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "hold",
        description:
            "Whether to hold the input or not. Time has no impact if true.",
        enabled: lightDownSetting.enabled,
        mapValues: {"hold": false},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: lightDownSetting.enabled,
        mapValues: {"input": Inputs.lDown},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.stick
    ..widget = SettingsWidgets.card;

  static Setting lightLeftSetting = Setting()
    ..title = "lightLeft"
    ..description = "Move the left stick left for a specified amount of time"
    ..enabled = true
    ..group = [
      lightLeftSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "time",
        description: "The length of the button press",
        enabled: lightLeftSetting.enabled,
        mapValues: {"time": 0.25},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "hold",
        description:
            "Whether to hold the input or not. Time has no impact if true.",
        enabled: lightLeftSetting.enabled,
        mapValues: {"hold": false},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: lightLeftSetting.enabled,
        mapValues: {"input": Inputs.lLeft},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.stick
    ..widget = SettingsWidgets.card;

  static Setting lightRightSetting = Setting()
    ..title = "lightRight"
    ..description = "Move the left stick right for a specified amount of time"
    ..enabled = true
    ..group = [
      lightRightSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "time",
        description: "The length of the button press",
        enabled: lightRightSetting.enabled,
        mapValues: {"time": 0.25},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "hold",
        description:
            "Whether to hold the input or not. Time has no impact if true.",
        enabled: lightRightSetting.enabled,
        mapValues: {"hold": false},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: lightRightSetting.enabled,
        mapValues: {"input": Inputs.lRight},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.stick
    ..widget = SettingsWidgets.card;

  static Setting upSetting = Setting()
    ..title = "up"
    ..description = "Hold (or stop holding) the left stick in the up direction"
    ..enabled = true
    ..group = [
      upSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "time",
        description: "The length of the button press",
        enabled: upSetting.enabled,
        mapValues: {"time": 0.25},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "hold",
        description:
            "Whether to hold the input or not. Time has no impact if true.",
        enabled: upSetting.enabled,
        mapValues: {"hold": true},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: upSetting.enabled,
        mapValues: {"input": Inputs.lUp},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.stick
    ..widget = SettingsWidgets.card;

  static Setting downSetting = Setting()
    ..title = "down"
    ..description =
        "Hold (or stop holding) the left stick in the down direction"
    ..enabled = true
    ..group = [
      downSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "time",
        description: "The length of the button press",
        enabled: downSetting.enabled,
        mapValues: {"time": 0.25},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "hold",
        description:
            "Whether to hold the input or not. Time has no impact if true.",
        enabled: downSetting.enabled,
        mapValues: {"hold": true},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: downSetting.enabled,
        mapValues: {"input": Inputs.lDown},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.stick
    ..widget = SettingsWidgets.card;

  static Setting leftSetting = Setting()
    ..title = "left"
    ..description =
        "Hold (or stop holding) the left stick in the left direction"
    ..enabled = true
    ..group = [
      leftSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "time",
        description: "The length of the button press",
        enabled: leftSetting.enabled,
        mapValues: {"time": 0.25},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "hold",
        description:
            "Whether to hold the input or not. Time has no impact if true.",
        enabled: leftSetting.enabled,
        mapValues: {"hold": true},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: leftSetting.enabled,
        mapValues: {"input": Inputs.lLeft},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.stick
    ..widget = SettingsWidgets.card;

  static Setting rightSetting = Setting()
    ..title = "right"
    ..description =
        "Hold (or stop holding) the left stick in the right direction"
    ..enabled = true
    ..group = [
      rightSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "time",
        description: "The length of the button press",
        enabled: rightSetting.enabled,
        mapValues: {"time": 0.25},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "hold",
        description:
            "Whether to hold the input or not. Time has no impact if true.",
        enabled: rightSetting.enabled,
        mapValues: {"hold": true},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: rightSetting.enabled,
        mapValues: {"input": Inputs.lRight},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.stick
    ..widget = SettingsWidgets.card;
}

Setting TESTSetting = Setting()
  ..title = "test"
  ..description = "Presses the test button to initiate testing"
  ..enabled = false
  ..group = [
    TESTSetting.id,
    createSettings(
      [SettingsWidgets.numField],
      title: "time",
      description: "The length of the button press",
      enabled: TESTSetting.enabled,
      mapValues: {"time": 0.25},
    )[SettingsWidgets.numField]!
        .id,
    createSettings(
      [SettingsWidgets.checkbox],
      title: "hold",
      description:
          "Whether to hold the input or not. Time has no impact if true.",
      enabled: TESTSetting.enabled,
      mapValues: {"hold": true},
    )[SettingsWidgets.checkbox]!
        .id,
    createSettings(
      [SettingsWidgets.inputsDropdown],
      title: "input",
      enabled: TESTSetting.enabled,
      mapValues: {"input": Inputs.lUp},
    )[SettingsWidgets.inputsDropdown]!
        .id,
  ]
  ..inputType = InputTypes.stick
  ..widget = SettingsWidgets.card;

Setting TESTSetting2 = Setting()
  ..title = "test2"
  ..description = "Presses the test2 button to initiate testing"
  ..enabled = false
  ..group = [
    TESTSetting.id,
    createSettings(
      [SettingsWidgets.numField],
      title: "time",
      description: "The length of the button press",
      enabled: TESTSetting2.enabled,
      mapValues: {"time": 0.25},
    )[SettingsWidgets.numField]!
        .id,
    createSettings(
      [SettingsWidgets.checkbox],
      title: "hold",
      description:
          "Whether to hold the input or not. Time has no impact if true.",
      enabled: TESTSetting2.enabled,
      mapValues: {"hold": true},
    )[SettingsWidgets.checkbox]!
        .id,
    createSettings(
      [SettingsWidgets.inputsDropdown],
      title: "input",
      enabled: TESTSetting2.enabled,
      mapValues: {"input": Inputs.lUp},
    )[SettingsWidgets.inputsDropdown]!
        .id,
  ]
  ..inputType = InputTypes.stick
  ..widget = SettingsWidgets.card;

List<Setting> TCsettings = [
  TCSettingsData.aSetting,
  TCSettingsData.bSetting,
  TCSettingsData.xSetting,
  TCSettingsData.ySetting,
  TCSettingsData.rbSetting,
  TCSettingsData.lbSetting,
  TCSettingsData.startSetting,
  TCSettingsData.selectSetting,
  TCSettingsData.lThumbSetting,
  TCSettingsData.toggleASetting,
  TCSettingsData.toggleBSetting,
  TCSettingsData.toggleXSetting,
  TCSettingsData.toggleYSetting,
  TCSettingsData.ltSetting,
  TCSettingsData.rtSetting,
  TCSettingsData.toggleLTSetting,
  TCSettingsData.toggleRTSetting,
  TCSettingsData.lightUpSetting,
  TCSettingsData.lightDownSetting,
  TCSettingsData.lightLeftSetting,
  TCSettingsData.lightRightSetting,
  TCSettingsData.upSetting,
  TCSettingsData.downSetting,
  TCSettingsData.leftSetting,
  TCSettingsData.rightSetting,
];

class RCSettingsData {
  static Setting buttonSetting = Setting()
    ..title = "Randomize buttons?"
    ..description = "Randomizes buttons"
    ..enabled = true
    ..widget = SettingsWidgets.checkbox
    ..inputType = InputTypes.button
    ..individual = true;
  static Setting triggerSetting = Setting()
    ..title = "Randomize triggers?"
    ..description = "Randomizes triggers"
    ..enabled = true
    ..widget = SettingsWidgets.checkbox
    ..inputType = InputTypes.trigger
    ..individual = true;
  static Setting stickSetting = Setting()
    ..title = "Randomize direction?"
    ..description = "Randomizes direction"
    ..enabled = false
    ..widget = SettingsWidgets.checkbox
    ..inputType = InputTypes.stick
    ..individual = true;
}

List<Setting> RCsettings = [
  RCSettingsData.buttonSetting,
  RCSettingsData.triggerSetting,
  RCSettingsData.stickSetting,
];

class FCSettingsData {
  static Setting aSetting = Setting()
    ..title = Inputs.a.toString()
    ..enabled = true
    ..description =
        "Number of alloted A presses until the desired effect occurs"
    ..group = [
      aSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "filter",
        description:
            "The number of inputs that you can take before the desired effect",
        enabled: aSetting.enabled,
        mapValues: {"presses": 15},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "presses",
        description: "The type of filter that happens after the desired effect",
        enabled: aSetting.enabled,
        mapValues: {"filter": Filters.stop},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: aSetting.enabled,
        mapValues: {"input": Inputs.a},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.button
    ..widget = SettingsWidgets.card;

  static Setting bSetting = Setting()
    ..title = Inputs.b.toString()
    ..enabled = true
    ..description =
        "Number of alloted B presses until the desired effect occurs"
    ..group = [
      bSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "filter",
        description:
            "The number of inputs that you can take before the desired effect",
        enabled: bSetting.enabled,
        mapValues: {"presses": 10},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "presses",
        description: "The type of filter that happens after the desired effect",
        enabled: bSetting.enabled,
        mapValues: {"filter": Filters.stop},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: bSetting.enabled,
        mapValues: {"input": Inputs.b},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.button
    ..widget = SettingsWidgets.card;

  static Setting xSetting = Setting()
    ..title = Inputs.x.toString()
    ..enabled = true
    ..description =
        "Number of alloted X presses until the desired effect occurs"
    ..group = [
      xSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "filter",
        description:
            "The number of inputs that you can take before the desired effect",
        enabled: xSetting.enabled,
        mapValues: {"presses": 8},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "presses",
        description: "The type of filter that happens after the desired effect",
        enabled: xSetting.enabled,
        mapValues: {"filter": Filters.stop},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: xSetting.enabled,
        mapValues: {"input": Inputs.x},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.button
    ..widget = SettingsWidgets.card;

  static Setting ySetting = Setting()
    ..title = Inputs.y.toString()
    ..enabled = true
    ..description =
        "Number of alloted Y presses until the desired effect occurs"
    ..group = [
      ySetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "filter",
        description:
            "The number of inputs that you can take before the desired effect",
        enabled: ySetting.enabled,
        mapValues: {"presses": 8},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "presses",
        description: "The type of filter that happens after the desired effect",
        enabled: ySetting.enabled,
        mapValues: {"filter": Filters.stop},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: ySetting.enabled,
        mapValues: {"input": Inputs.y},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.button
    ..widget = SettingsWidgets.card;

  static Setting rbSetting = Setting()
    ..title = Inputs.rb.toString()
    ..enabled = true
    ..description =
        "Number of alloted RB presses until the desired effect occurs"
    ..group = [
      rbSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "filter",
        description:
            "The number of inputs that you can take before the desired effect",
        enabled: rbSetting.enabled,
        mapValues: {"presses": 7},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "presses",
        description: "The type of filter that happens after the desired effect",
        enabled: rbSetting.enabled,
        mapValues: {"filter": Filters.stop},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: rbSetting.enabled,
        mapValues: {"input": Inputs.rb},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.button
    ..widget = SettingsWidgets.card;

  static Setting lbSetting = Setting()
    ..title = Inputs.lb.toString()
    ..enabled = true
    ..description =
        "Number of alloted LB presses until the desired effect occurs"
    ..group = [
      lbSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "filter",
        description:
            "The number of inputs that you can take before the desired effect",
        enabled: lbSetting.enabled,
        mapValues: {"presses": 7},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "presses",
        description: "The type of filter that happens after the desired effect",
        enabled: lbSetting.enabled,
        mapValues: {"filter": Filters.stop},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: lbSetting.enabled,
        mapValues: {"input": Inputs.lb},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.button
    ..widget = SettingsWidgets.card;

  static Setting start = Setting()
    ..title = Inputs.start.toString()
    ..enabled = true
    ..description =
        "Number of alloted start presses until the desired effect occurs"
    ..group = [
      start.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "filter",
        description:
            "The number of inputs that you can take before the desired effect",
        enabled: start.enabled,
        mapValues: {"presses": 5},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "presses",
        description: "The type of filter that happens after the desired effect",
        enabled: start.enabled,
        mapValues: {"filter": Filters.stop},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: start.enabled,
        mapValues: {"input": Inputs.start},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.button
    ..widget = SettingsWidgets.card;

  static Setting select = Setting()
    ..title = Inputs.select.toString()
    ..enabled = true
    ..description =
        "Number of alloted A presses until the desired effect occurs"
    ..group = [
      select.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "filter",
        description:
            "The number of inputs that you can take before the desired effect",
        enabled: select.enabled,
        mapValues: {"presses": 5},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "presses",
        description: "The type of filter that happens after the desired effect",
        enabled: select.enabled,
        mapValues: {"filter": Filters.stop},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: select.enabled,
        mapValues: {"input": Inputs.a},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.button
    ..widget = SettingsWidgets.card;

  static Setting lthumbSetting = Setting()
    ..title = Inputs.lThumb.toString()
    ..enabled = true
    ..description =
        "Number of alloted left thumb presses until the desired effect occurs"
    ..group = [
      lthumbSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "filter",
        description:
            "The number of inputs that you can take before the desired effect",
        enabled: lthumbSetting.enabled,
        mapValues: {"presses": 5},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "presses",
        description: "The type of filter that happens after the desired effect",
        enabled: lthumbSetting.enabled,
        mapValues: {"filter": Filters.stop},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: lthumbSetting.enabled,
        mapValues: {"input": Inputs.a},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.button
    ..widget = SettingsWidgets.card;

  static Setting ltSetting = Setting()
    ..title = Inputs.lt.toString()
    ..enabled = true
    ..description =
        "Number of alloted left trigger presses until the desired effect occurs"
    ..group = [
      ltSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "filter",
        description:
            "The number of inputs that you can take before the desired effect",
        enabled: ltSetting.enabled,
        mapValues: {"presses": 8},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "presses",
        description: "The type of filter that happens after the desired effect",
        enabled: ltSetting.enabled,
        mapValues: {"filter": Filters.stop},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: ltSetting.enabled,
        mapValues: {"input": Inputs.lt},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.trigger
    ..widget = SettingsWidgets.card;

  static Setting rtSetting = Setting()
    ..title = Inputs.rt.toString()
    ..enabled = true
    ..description =
        "Number of alloted right trigger presses until the desired effect occurs"
    ..group = [
      ltSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "filter",
        description:
            "The number of inputs that you can take before the desired effect",
        enabled: rtSetting.enabled,
        mapValues: {"presses": 8},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "presses",
        description: "The type of filter that happens after the desired effect",
        enabled: rtSetting.enabled,
        mapValues: {"filter": Filters.stop},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: rtSetting.enabled,
        mapValues: {"input": Inputs.rt},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.trigger
    ..widget = SettingsWidgets.card;

  static Setting upSetting = Setting()
    ..title = Inputs.lUp.toString()
    ..enabled = true
    ..description =
        "Number of alloted up directional changes until the desired effect occurs"
    ..group = [
      ltSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "filter",
        description:
            "The number of inputs that you can take before the desired effect",
        enabled: upSetting.enabled,
        mapValues: {"presses": 15},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "presses",
        description: "The type of filter that happens after the desired effect",
        enabled: upSetting.enabled,
        mapValues: {"filter": Filters.stop},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: upSetting.enabled,
        mapValues: {"input": Inputs.lUp},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.stick
    ..widget = SettingsWidgets.card;

  static Setting downSetting = Setting()
    ..title = Inputs.lDown.toString()
    ..enabled = true
    ..description =
        "Number of alloted down directional changes until the desired effect occurs"
    ..group = [
      downSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "filter",
        description:
            "The number of inputs that you can take before the desired effect",
        enabled: downSetting.enabled,
        mapValues: {"presses": 15},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "presses",
        description: "The type of filter that happens after the desired effect",
        enabled: downSetting.enabled,
        mapValues: {"filter": Filters.stop},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: downSetting.enabled,
        mapValues: {"input": Inputs.lDown},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.stick
    ..widget = SettingsWidgets.card;

  static Setting leftSetting = Setting()
    ..title = Inputs.lLeft.toString()
    ..enabled = true
    ..description =
        "Number of alloted left directional changes until the desired effect occurs"
    ..group = [
      leftSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "filter",
        description:
            "The number of inputs that you can take before the desired effect",
        enabled: leftSetting.enabled,
        mapValues: {"presses": 15},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "presses",
        description: "The type of filter that happens after the desired effect",
        enabled: leftSetting.enabled,
        mapValues: {"filter": Filters.stop},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: leftSetting.enabled,
        mapValues: {"input": Inputs.lLeft},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.stick
    ..widget = SettingsWidgets.card;

  static Setting rightSetting = Setting()
    ..title = Inputs.lRight.toString()
    ..enabled = true
    ..description =
        "Number of alloted right directional changes until the desired effect occurs"
    ..group = [
      rightSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "filter",
        description:
            "The number of inputs that you can take before the desired effect",
        enabled: rightSetting.enabled,
        mapValues: {"presses": 15},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "presses",
        description: "The type of filter that happens after the desired effect",
        enabled: rightSetting.enabled,
        mapValues: {"filter": Filters.stop},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: rightSetting.enabled,
        mapValues: {"input": Inputs.lDown},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.stick
    ..widget = SettingsWidgets.card;
}

List<Setting> FCsettings = [
  FCSettingsData.aSetting,
  FCSettingsData.bSetting,
  FCSettingsData.xSetting,
  FCSettingsData.ySetting,
  FCSettingsData.rbSetting,
  FCSettingsData.lbSetting,
  FCSettingsData.start,
  FCSettingsData.select,
  FCSettingsData.lthumbSetting,
  FCSettingsData.ltSetting,
  FCSettingsData.rtSetting,
  FCSettingsData.upSetting,
  FCSettingsData.downSetting,
  FCSettingsData.leftSetting,
  FCSettingsData.rightSetting,
];

class DCSettingsData {
  static Setting aSetting = Setting()
    ..title = Inputs.a.toString()
    ..enabled = true
    ..description =
        "Number of alloted A presses until the desired effect occurs"
    ..group = [
      aSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "filter",
        description:
            "The number of inputs that you can take before the desired effect",
        enabled: aSetting.enabled,
        mapValues: {"presses": 15},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "presses",
        description: "The type of filter that happens after the desired effect",
        enabled: aSetting.enabled,
        mapValues: {"filter": Filters.stop},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: aSetting.enabled,
        mapValues: {"input": Inputs.a},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.button
    ..widget = SettingsWidgets.card;

  static Setting bSetting = Setting()
    ..title = Inputs.b.toString()
    ..enabled = true
    ..description =
        "Number of alloted B presses until the desired effect occurs"
    ..group = [
      bSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "filter",
        description:
            "The number of inputs that you can take before the desired effect",
        enabled: bSetting.enabled,
        mapValues: {"presses": 10},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "presses",
        description: "The type of filter that happens after the desired effect",
        enabled: bSetting.enabled,
        mapValues: {"filter": Filters.stop},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: bSetting.enabled,
        mapValues: {"input": Inputs.b},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.button
    ..widget = SettingsWidgets.card;

  static Setting xSetting = Setting()
    ..title = Inputs.x.toString()
    ..enabled = true
    ..description =
        "Number of alloted X presses until the desired effect occurs"
    ..group = [
      xSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "filter",
        description:
            "The number of inputs that you can take before the desired effect",
        enabled: xSetting.enabled,
        mapValues: {"presses": 8},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "presses",
        description: "The type of filter that happens after the desired effect",
        enabled: xSetting.enabled,
        mapValues: {"filter": Filters.stop},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: xSetting.enabled,
        mapValues: {"input": Inputs.x},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.button
    ..widget = SettingsWidgets.card;

  static Setting ySetting = Setting()
    ..title = Inputs.y.toString()
    ..enabled = true
    ..description =
        "Number of alloted Y presses until the desired effect occurs"
    ..group = [
      ySetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "filter",
        description:
            "The number of inputs that you can take before the desired effect",
        enabled: ySetting.enabled,
        mapValues: {"presses": 8},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "presses",
        description: "The type of filter that happens after the desired effect",
        enabled: ySetting.enabled,
        mapValues: {"filter": Filters.stop},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: ySetting.enabled,
        mapValues: {"input": Inputs.y},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.button
    ..widget = SettingsWidgets.card;

  static Setting rbSetting = Setting()
    ..title = Inputs.rb.toString()
    ..enabled = true
    ..description =
        "Number of alloted RB presses until the desired effect occurs"
    ..group = [
      rbSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "filter",
        description:
            "The number of inputs that you can take before the desired effect",
        enabled: rbSetting.enabled,
        mapValues: {"presses": 7},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "presses",
        description: "The type of filter that happens after the desired effect",
        enabled: rbSetting.enabled,
        mapValues: {"filter": Filters.stop},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: rbSetting.enabled,
        mapValues: {"input": Inputs.rb},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.button
    ..widget = SettingsWidgets.card;

  static Setting lbSetting = Setting()
    ..title = Inputs.lb.toString()
    ..enabled = true
    ..description =
        "Number of alloted LB presses until the desired effect occurs"
    ..group = [
      lbSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "filter",
        description:
            "The number of inputs that you can take before the desired effect",
        enabled: lbSetting.enabled,
        mapValues: {"presses": 7},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "presses",
        description: "The type of filter that happens after the desired effect",
        enabled: lbSetting.enabled,
        mapValues: {"filter": Filters.stop},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: lbSetting.enabled,
        mapValues: {"input": Inputs.lb},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.button
    ..widget = SettingsWidgets.card;

  static Setting start = Setting()
    ..title = Inputs.start.toString()
    ..enabled = true
    ..description =
        "Number of alloted start presses until the desired effect occurs"
    ..group = [
      start.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "filter",
        description:
            "The number of inputs that you can take before the desired effect",
        enabled: start.enabled,
        mapValues: {"presses": 5},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "presses",
        description: "The type of filter that happens after the desired effect",
        enabled: start.enabled,
        mapValues: {"filter": Filters.stop},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: start.enabled,
        mapValues: {"input": Inputs.start},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.button
    ..widget = SettingsWidgets.card;

  static Setting select = Setting()
    ..title = Inputs.select.toString()
    ..enabled = true
    ..description =
        "Number of alloted A presses until the desired effect occurs"
    ..group = [
      select.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "filter",
        description:
            "The number of inputs that you can take before the desired effect",
        enabled: select.enabled,
        mapValues: {"presses": 5},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "presses",
        description: "The type of filter that happens after the desired effect",
        enabled: select.enabled,
        mapValues: {"filter": Filters.stop},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: select.enabled,
        mapValues: {"input": Inputs.a},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.button
    ..widget = SettingsWidgets.card;

  static Setting lthumbSetting = Setting()
    ..title = Inputs.lThumb.toString()
    ..enabled = true
    ..description =
        "Number of alloted left thumb presses until the desired effect occurs"
    ..group = [
      lthumbSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "filter",
        description:
            "The number of inputs that you can take before the desired effect",
        enabled: lthumbSetting.enabled,
        mapValues: {"presses": 5},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "presses",
        description: "The type of filter that happens after the desired effect",
        enabled: lthumbSetting.enabled,
        mapValues: {"filter": Filters.stop},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: lthumbSetting.enabled,
        mapValues: {"input": Inputs.a},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.button
    ..widget = SettingsWidgets.card;

  static Setting ltSetting = Setting()
    ..title = Inputs.lt.toString()
    ..enabled = true
    ..description =
        "Number of alloted left trigger presses until the desired effect occurs"
    ..group = [
      ltSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "filter",
        description:
            "The number of inputs that you can take before the desired effect",
        enabled: ltSetting.enabled,
        mapValues: {"presses": 8},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "presses",
        description: "The type of filter that happens after the desired effect",
        enabled: ltSetting.enabled,
        mapValues: {"filter": Filters.stop},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: ltSetting.enabled,
        mapValues: {"input": Inputs.lt},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.trigger
    ..widget = SettingsWidgets.card;

  static Setting rtSetting = Setting()
    ..title = Inputs.rt.toString()
    ..enabled = true
    ..description =
        "Number of alloted right trigger presses until the desired effect occurs"
    ..group = [
      ltSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "filter",
        description:
            "The number of inputs that you can take before the desired effect",
        enabled: rtSetting.enabled,
        mapValues: {"presses": 8},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "presses",
        description: "The type of filter that happens after the desired effect",
        enabled: rtSetting.enabled,
        mapValues: {"filter": Filters.stop},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: rtSetting.enabled,
        mapValues: {"input": Inputs.rt},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.trigger
    ..widget = SettingsWidgets.card;

  static Setting upSetting = Setting()
    ..title = Inputs.lUp.toString()
    ..enabled = true
    ..description =
        "Number of alloted up directional changes until the desired effect occurs"
    ..group = [
      ltSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "filter",
        description:
            "The number of inputs that you can take before the desired effect",
        enabled: upSetting.enabled,
        mapValues: {"presses": 15},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "presses",
        description: "The type of filter that happens after the desired effect",
        enabled: upSetting.enabled,
        mapValues: {"filter": Filters.stop},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: upSetting.enabled,
        mapValues: {"input": Inputs.lUp},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.stick
    ..widget = SettingsWidgets.card;

  static Setting downSetting = Setting()
    ..title = Inputs.lDown.toString()
    ..enabled = true
    ..description =
        "Number of alloted down directional changes until the desired effect occurs"
    ..group = [
      downSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "filter",
        description:
            "The number of inputs that you can take before the desired effect",
        enabled: downSetting.enabled,
        mapValues: {"presses": 15},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "presses",
        description: "The type of filter that happens after the desired effect",
        enabled: downSetting.enabled,
        mapValues: {"filter": Filters.stop},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: downSetting.enabled,
        mapValues: {"input": Inputs.lDown},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.stick
    ..widget = SettingsWidgets.card;

  static Setting leftSetting = Setting()
    ..title = Inputs.lLeft.toString()
    ..enabled = true
    ..description =
        "Number of alloted left directional changes until the desired effect occurs"
    ..group = [
      leftSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "filter",
        description:
            "The number of inputs that you can take before the desired effect",
        enabled: leftSetting.enabled,
        mapValues: {"presses": 15},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "presses",
        description: "The type of filter that happens after the desired effect",
        enabled: leftSetting.enabled,
        mapValues: {"filter": Filters.stop},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: leftSetting.enabled,
        mapValues: {"input": Inputs.lLeft},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.stick
    ..widget = SettingsWidgets.card;

  static Setting rightSetting = Setting()
    ..title = Inputs.lRight.toString()
    ..enabled = true
    ..description =
        "Number of alloted right directional changes until the desired effect occurs"
    ..group = [
      rightSetting.id,
      createSettings(
        [SettingsWidgets.numField],
        title: "filter",
        description:
            "The number of inputs that you can take before the desired effect",
        enabled: rightSetting.enabled,
        mapValues: {"presses": 15},
      )[SettingsWidgets.numField]!
          .id,
      createSettings(
        [SettingsWidgets.checkbox],
        title: "presses",
        description: "The type of filter that happens after the desired effect",
        enabled: rightSetting.enabled,
        mapValues: {"filter": Filters.stop},
      )[SettingsWidgets.checkbox]!
          .id,
      createSettings(
        [SettingsWidgets.inputsDropdown],
        title: "input",
        enabled: rightSetting.enabled,
        mapValues: {"input": Inputs.lDown},
      )[SettingsWidgets.inputsDropdown]!
          .id,
    ]
    ..inputType = InputTypes.stick
    ..widget = SettingsWidgets.card;
}

List<Setting> DCsettings = [
  DCSettingsData.aSetting,
  DCSettingsData.bSetting,
  DCSettingsData.xSetting,
  DCSettingsData.ySetting,
  DCSettingsData.rbSetting,
  DCSettingsData.lbSetting,
  DCSettingsData.start,
  DCSettingsData.select,
  DCSettingsData.lthumbSetting,
  DCSettingsData.ltSetting,
  DCSettingsData.rtSetting,
  DCSettingsData.upSetting,
  DCSettingsData.downSetting,
  DCSettingsData.leftSetting,
  DCSettingsData.rightSetting,
];

class CharacterData {
  static Character appleKid = Character()
    ..image = 'assets/images/appleKid.png'
    ..name = 'appleKid'
    ..hit = 'Apple inc.'
    ..miss = 'Instruction manuals'
    ..description = """appleKid is an avid apple-enthusiast, 
          touting his inventiveness and ingenuity as a result of sustained apple consumption"""
    ..color = ColorVars.red;

  static Character bananaKid = Character()
    ..image = 'assets/images/bananaKid.jpg'
    ..name = 'bananaKid'
    ..hit = 'Banana laffy taffy'
    ..miss = 'Politics'
    ..description =
        """bananaKid is an outgoing banana-believer who never misses the 
    opportunity to make a joke"""
    ..color = ColorVars.yellow;

  static Character gunlessGuy = Character()
    ..image = 'assets/images/gunlessGuy.png'
    ..name = 'gunlessGuy'
    ..hit = 'Peace'
    ..miss = 'Violence'
    ..description =
        """gunlessGuy is a zealous supporter of disarmament, showing 
    his support by carrying his Gun Deleter™ gun."""
    ..color = ColorVars.blueGrey;

  static Character dinofish = Character()
    ..image = 'assets/images/dinofish.png'
    ..name = 'dinofish'
    ..hit = 'Ressurection'
    ..miss = 'Fossils'
    ..description =
        """Also known as the coelacanth, the rare dinofish was once thought
    to be extinct and today finds enjoyment in not being so"""
    ..color = ColorVars.blueGrey;

  static Character john = Character()
    ..image = 'assets/images/hiMyNameIsJohn.jpg'
    ..name = 'John'
    ..hit = 'John'
    ..miss = 'Not john'
    ..description = """John is well-known across the world for being John"""
    ..color = ColorVars.red;

  static Character refrigeratorExhibitionGuy = Character()
    ..image = 'assets/images/refrigeratorExhibitionGuy.png'
    ..name = 'refigeratorExhibitionGuy'
    ..hit = 'Refrigerators'
    ..miss = 'Ovens'
    ..description = """If you want to buy a refrigerator, the refrigerator 
    exhibition guy is your man! A walking encyclopedia on refrigerators, he 
    knows all there is about them and effectively puts it into practice."""
    ..color = ColorVars.blue;

  static Character signPythagoreonTheorum = Character()
    ..image = 'assets/images/pythagoreanTheorumSign.png'
    ..name = 'signOfThePythagoreanTheorum'
    ..hit = 'Triangles'
    ..miss = 'Quadratics'
    ..description = """signOfThePythagoreanTheorum is great at seeing 
    multiple sides in everying situation. A very 3-dimensional character!"""
    ..color = ColorVars.brown;

  static Character signQuadraticFormula = Character()
    ..image = 'assets/images/quadraticFormulaSign.png'
    ..name = 'signOfTheQuadraticFormula'
    ..hit = 'Quadratics'
    ..miss = 'Triangles'
    ..description =
        """signOfTheQuadraticFormula likes the number 2. He's also a 
    fan of bananas (among other things) on account of their parabolic shape."""
    ..color = ColorVars.brown;

  static Character TESTCharacter = Character()
    ..image = 'assets/images/imageNoExist.png'
    ..name = 'testCharacter'
    ..hit = 'Development'
    ..miss = 'Production'
    ..description = """testCharacter is a big fan of development builds"""
    ..color = ColorVars.yellow;

  static Character TESTCharacter2 = Character()
    ..image = 'assets/images/imageNoExist.png'
    ..name = 'testCharacter2'
    ..hit = 'Development'
    ..miss = 'Production'
    ..description = """testCharacter2 likes to double check things"""
    ..color = ColorVars.yellow;
}

List<Character> characters = [
  CharacterData.appleKid,
  CharacterData.bananaKid,
  CharacterData.gunlessGuy,
  CharacterData.dinofish,
  CharacterData.john,
  CharacterData.refrigeratorExhibitionGuy,
  CharacterData.signPythagoreonTheorum,
  CharacterData.signQuadraticFormula,
];

class GamemodeData {
  static Gamemode freeForAll = Gamemode()..name = "Free For All";
  static Gamemode tagBattle = Gamemode()..name = "Tag Battle";
  static Gamemode randomChaos = Gamemode()..name = "Random Chaos";
  static Gamemode TESTGamemode = Gamemode()..name = "Test Gamemode";
  static Gamemode TESTGamemode2 = Gamemode()..name = "Test Gamemode2";
}

List<Gamemode> gamemodes = [
  GamemodeData.freeForAll,
  GamemodeData.tagBattle,
  // Most options are randomized for random chaos;
  // Most importantly that means Program, Character, AND/OR Team
  GamemodeData.randomChaos,
];

class TeamData {
  static Team teamApple = Team()
    ..name = "apple"
    ..logo = "assets/images/apple.jpg"
    ..description = """
Nothing like an apple a day to make the doctor go away! They have a lower 
glycemic index than bananas, who can argue with that?"""
    ..color = ColorVars.red;
  static Team teamBanana = Team()
    ..name = "banana"
    ..logo = "assets/images/banana.jpg"
    ..description = """POTASSIUM"""
    ..color = ColorVars.yellow;
  static Team TESTTeam = Team()
    ..name = "test"
    ..logo = "assets/images/noTeamImage.jpg"
    ..description = """TESTING"""
    ..color = ColorVars.yellow;
  static Team TESTTeam2 = Team()
    ..name = "test2"
    ..logo = "assets/images/noTeamImage.jpg"
    ..description = """TESTING2"""
    ..color = ColorVars.yellow;
}

List<Team> teams = [
  TeamData.teamApple,
  TeamData.teamBanana,
];

/// TEST DATA FROM HERE ON OUT
/// (in the actual app usage, gamepads and players are written dynamically)

class GamepadData {
  static Gamepad gamepad1 = Gamepad()
    ..connected = true
    ..index = 1
    ..color = ColorVars.red;
  static Gamepad gamepad2 = Gamepad()
    ..connected = true
    ..index = 2
    ..color = ColorVars.blue;
  static Gamepad gamepad3 = Gamepad()
    ..connected = true
    ..index = 3
    ..color = ColorVars.green;
  static Gamepad TESTGamepad = Gamepad()
    ..connected = false
    ..index = 4
    ..color = ColorVars.orange;
  static Gamepad TESTGamepad2 = Gamepad()
    ..connected = false
    ..index = 5
    ..color = ColorVars.purple;
}

List<Gamepad> testGamepads = [
  GamepadData.gamepad1,
  GamepadData.gamepad2,
  GamepadData.gamepad3,
];

class PlayerData {
  static Player player1 = Player()..color = ColorVars.white;
  static Player player2 = Player()..color = ColorVars.white;
  static Player player3 = Player()..color = ColorVars.white;
  static Player TESTPlayer = Player()..color = ColorVars.white;
  static Player TESTPlayer2 = Player()..color = ColorVars.pink;
}

List<Player> testPlayers = [
  // Player color defaults to white, but is overwritten in the following order
  // team -> gamepad -> player
  PlayerData.player1,
  PlayerData.player2,
  PlayerData.player3,
];
