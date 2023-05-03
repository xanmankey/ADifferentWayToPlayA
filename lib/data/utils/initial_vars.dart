import 'dart:convert';

import 'package:adifferentwaytoplay/app/constants.dart';
import 'package:adifferentwaytoplay/domain/constants.dart';
import 'package:adifferentwaytoplay/domain/entities/character.dart';
import 'package:adifferentwaytoplay/domain/entities/gamemode.dart';
import 'package:adifferentwaytoplay/domain/entities/gamepad.dart';
import 'package:adifferentwaytoplay/domain/entities/player.dart';
import 'package:adifferentwaytoplay/domain/entities/program.dart';
import 'package:adifferentwaytoplay/domain/entities/setting.dart';
import 'package:adifferentwaytoplay/domain/entities/team.dart';
import 'package:adifferentwaytoplay/domain/utils/utils.dart';
import 'package:adifferentwaytoplay/data/constants.dart';

// Normally /data shouldn't be handling ANY of the design choices
// But because of color affiliation in character I added a couple methods
// so color data can be passed along with other types
// I also shouldn't have test<> variables; I need to figure out how to set up
// an environment dedicated to testing where changes don't go through

// ProgramRunner programRunner = ProgramRunner();

// For grouping settings, make sure to write settings to the database first,
// and THEN update the desired setting with grouping

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
  /*
  static Program DC = Program()
    ..image = "assets/images/DC.png"
    ..description = "'Who says you have to spend \$60 on a controller?'"
    ..name = "Different Controllers (DC)"
    ..abbreviation = "DC"
    ..settings.addAll(DCsettings)
    ..score = 5;
  */
  // static Program TESTProgram = Program()
  //   ..image = "assets/images/noTestImage.png"
  //   ..description = "'I've always been a testing kind of guy'"
  //   ..name = "Testing"
  //   ..abbreviation = "TEST";
  // static Program TESTProgram2 = Program()
  //   ..image = "assets/images/noTestImage.png"
  //   ..description = "'I believe in second chances'"
  //   ..name = "Testing numero dos"
  //   ..abbreviation = "TEST2";
}

List<Program> programs = [
  ProgramData.MIOP,
  ProgramData.TC,
  ProgramData.RC,
  ProgramData.FC,
  // ProgramData.DC,
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
    ..settingsWidget = SettingsWidgets.textField;

  static List<Setting> aSetting = generateTCSettings(
    Inputs.a.toString(),
    "Presses the A button",
    true,
    SortProperties.button,
    0.2,
    false,
    Inputs.a.toString(),
  );

  static List<Setting> bSetting = generateTCSettings(
    Inputs.b.toString(),
    "Presses the B button",
    true,
    SortProperties.button,
    0.2,
    false,
    Inputs.b.toString(),
  );

  static List<Setting> xSetting = generateTCSettings(
    Inputs.x.toString(),
    "Presses the X button",
    true,
    SortProperties.button,
    0.2,
    false,
    Inputs.x.toString(),
  );

  static List<Setting> ySetting = generateTCSettings(
    Inputs.y.toString(),
    "Presses the Y button",
    true,
    SortProperties.button,
    0.2,
    false,
    Inputs.y.toString(),
  );

  static List<Setting> rbSetting = generateTCSettings(
    Inputs.rb.toString(),
    "Presses the RB button",
    true,
    SortProperties.button,
    0.2,
    false,
    Inputs.rb.toString(),
  );

  static List<Setting> lbSetting = generateTCSettings(
    Inputs.lb.toString(),
    "Presses the LB button",
    true,
    SortProperties.button,
    0.2,
    false,
    Inputs.lb.toString(),
  );

  static List<Setting> startSetting = generateTCSettings(
    Inputs.start.toString(),
    "Presses the start button",
    false,
    SortProperties.button,
    0.2,
    false,
    Inputs.start.toString(),
  );

  static List<Setting> selectSetting = generateTCSettings(
    Inputs.select.toString(),
    "Presses the select button",
    true,
    SortProperties.button,
    0.2,
    false,
    Inputs.select.toString(),
  );

  static List<Setting> lThumbSetting = generateTCSettings(
    "lThumb",
    "Presses the left thumb stick inwards",
    true,
    SortProperties.button,
    0.2,
    false,
    "lThumb",
  );

  static List<Setting> toggleASetting = generateTCSettings(
    "toggleA",
    "Hold (or stop holding) the A button",
    true,
    SortProperties.button,
    0.2,
    true,
    Inputs.a.toString(),
  );

  static List<Setting> toggleBSetting = generateTCSettings(
    "toggleB",
    "Hold (or stop holding) the B button",
    true,
    SortProperties.button,
    0.2,
    true,
    Inputs.b.toString(),
  );

  static List<Setting> toggleXSetting = generateTCSettings(
    "toggleX",
    "Hold (or stop holding) the X button",
    true,
    SortProperties.button,
    0.2,
    true,
    Inputs.x.toString(),
  );

  static List<Setting> toggleYSetting = generateTCSettings(
    "toggleY",
    "Hold (or stop holding) the Y button",
    true,
    SortProperties.button,
    0.2,
    true,
    Inputs.y.toString(),
  );

  static List<Setting> ltSetting = generateTCSettings(
    "lt",
    "Hold (or stop holding) the LT button",
    true,
    SortProperties.trigger,
    0.2,
    true,
    Inputs.lt.toString(),
  );

  static List<Setting> rtSetting = generateTCSettings(
    "rt",
    "Hold (or stop holding) the RT button",
    true,
    SortProperties.trigger,
    0.2,
    true,
    Inputs.rt.toString(),
  );

  static List<Setting> toggleLTSetting = generateTCSettings(
    "LT",
    "Press the left trigger",
    true,
    SortProperties.button,
    0.2,
    true,
    Inputs.lt.toString(),
  );

  static List<Setting> toggleRTSetting = generateTCSettings(
    "toggleRT",
    "Hold (or stop holding) the right trigger",
    false,
    SortProperties.trigger,
    0.2,
    true,
    Inputs.rt.toString(),
  );

  static List<Setting> lightUpSetting = generateTCSettings(
    "lightUp",
    "Move the left stick up for a specified amount of time",
    false,
    SortProperties.stick,
    0.25,
    false,
    Inputs.lUp.toString(),
  );

  static List<Setting> lightDownSetting = generateTCSettings(
    "lightDown",
    "Move the left stick down for a specified amount of time",
    false,
    SortProperties.stick,
    0.25,
    false,
    Inputs.lDown.toString(),
  );

  static List<Setting> lightLeftSetting = generateTCSettings(
    "lightLeft",
    "Move the left stick left for a specified amount of time",
    false,
    SortProperties.stick,
    0.25,
    false,
    Inputs.lLeft.toString(),
  );

  static List<Setting> lightRightSetting = generateTCSettings(
    "lightRight",
    "Move the left stick right for a specified amount of time",
    false,
    SortProperties.stick,
    0.25,
    false,
    Inputs.lRight.toString(),
  );

  static List<Setting> upSetting = generateTCSettings(
    "up",
    "Hold (or stop holding) the left stick in the up direction",
    true,
    SortProperties.stick,
    0.25,
    true,
    Inputs.lUp.toString(),
  );

  static List<Setting> downSetting = generateTCSettings(
    "down",
    "Hold (or stop holding) the left stick in the down direction",
    true,
    SortProperties.stick,
    0.25,
    true,
    Inputs.lDown.toString(),
  );

  static List<Setting> leftSetting = generateTCSettings(
    "left",
    "Hold (or stop holding) the left stick in the left direction",
    true,
    SortProperties.stick,
    0.25,
    true,
    Inputs.lLeft.toString(),
  );

  static List<Setting> rightSetting = generateTCSettings(
    "right",
    "Hold (or stop holding) the left stick in the right direction",
    true,
    SortProperties.stick,
    0.25,
    true,
    Inputs.lRight.toString(),
  );
}

// Setting TESTSetting = Setting(
//   name: "The test button",
//   description: "This is a description for the test button",
//   value: false,
//   settingsWidget: SettingsWidgets.checkbox,
// );

List<Setting> TCsettings = [
  ...TCSettingsData.aSetting,
  ...TCSettingsData.bSetting,
  ...TCSettingsData.xSetting,
  ...TCSettingsData.ySetting,
  ...TCSettingsData.rbSetting,
  ...TCSettingsData.lbSetting,
  ...TCSettingsData.startSetting,
  ...TCSettingsData.selectSetting,
  ...TCSettingsData.lThumbSetting,
  ...TCSettingsData.toggleASetting,
  ...TCSettingsData.toggleBSetting,
  ...TCSettingsData.toggleXSetting,
  ...TCSettingsData.toggleYSetting,
  ...TCSettingsData.ltSetting,
  ...TCSettingsData.rtSetting,
  ...TCSettingsData.toggleLTSetting,
  ...TCSettingsData.toggleRTSetting,
  ...TCSettingsData.lightUpSetting,
  ...TCSettingsData.lightDownSetting,
  ...TCSettingsData.lightLeftSetting,
  ...TCSettingsData.lightRightSetting,
  ...TCSettingsData.upSetting,
  ...TCSettingsData.downSetting,
  ...TCSettingsData.leftSetting,
  ...TCSettingsData.rightSetting,
];

class RCSettingsData {
  static Setting buttonSetting = Setting()
    ..title = "Randomize Buttons?"
    ..description = "Randomizes buttons"
    ..mapValues = true
    ..sortProperty = SortProperties.button
    ..settingsWidget = SettingsWidgets.checkbox;
  static Setting triggerSetting = Setting()
    ..title = "Randomize Triggers?"
    ..description = "Randomizes triggers"
    ..mapValues = true
    ..sortProperty = SortProperties.trigger
    ..settingsWidget = SettingsWidgets.checkbox;
  static Setting stickSetting = Setting()
    ..title = "Randomize Sticks?"
    ..description = "Randomizes sticks"
    ..mapValues = false
    ..sortProperty = SortProperties.button
    ..settingsWidget = SettingsWidgets.checkbox;
}

List<Setting> RCsettings = [
  RCSettingsData.buttonSetting,
  RCSettingsData.triggerSetting,
  RCSettingsData.stickSetting,
];

class FCSettingsData {
  static Setting filter = Setting()
    ..title = "Filter type"
    ..description =
        "Type of filter that occurs after you exhaust all your inputs"
    ..mapValues = Filters.stop.name
    ..settingsWidget = SettingsWidgets.filtersDropdown;

  static List<Setting> aSetting = generateFCSettings(
    Inputs.a.toString(),
    "Number of alloted A presses until the desired effect occurs",
    SortProperties.button,
    15,
    Inputs.a.toString(),
    true,
  );

  static List<Setting> bSetting = generateFCSettings(
    Inputs.b.toString(),
    "Number of alloted B presses until the desired effect occurs",
    SortProperties.button,
    10,
    Inputs.b.toString(),
    true,
  );

  static List<Setting> xSetting = generateFCSettings(
    Inputs.x.toString(),
    "Number of alloted X presses until the desired effect occurs",
    SortProperties.button,
    8,
    Inputs.x.toString(),
    true,
  );

  static List<Setting> ySetting = generateFCSettings(
    Inputs.y.toString(),
    "Number of alloted Y presses until the desired effect occurs",
    SortProperties.button,
    8,
    Inputs.y.toString(),
    true,
  );

  static List<Setting> rbSetting = generateFCSettings(
    Inputs.rb.toString(),
    "Number of alloted RB presses until the desired effect occurs",
    SortProperties.button,
    7,
    Inputs.rb.toString(),
    true,
  );

  static List<Setting> lbSetting = generateFCSettings(
    Inputs.lb.toString(),
    "Number of alloted LB presses until the desired effect occurs",
    SortProperties.button,
    7,
    Inputs.lb.toString(),
    true,
  );

  static List<Setting> startSetting = generateFCSettings(
    Inputs.start.toString(),
    "Number of alloted Start presses until the desired effect occurs",
    SortProperties.button,
    5,
    Inputs.start.toString(),
    true,
  );

  static List<Setting> selectSetting = generateFCSettings(
    Inputs.select.toString(),
    "Number of alloted A presses until the desired effect occurs",
    SortProperties.button,
    5,
    Inputs.select.toString(),
    true,
  );

  static List<Setting> lThumbSetting = generateFCSettings(
    Inputs.lThumb.toString(),
    "Number of alloted Left Thumb presses until the desired effect occurs",
    SortProperties.button,
    5,
    Inputs.lThumb.toString(),
    true,
  );

  static List<Setting> ltSetting = generateFCSettings(
    Inputs.lt.toString(),
    "Number of alloted Left Trigger presses until the desired effect occurs",
    SortProperties.trigger,
    8,
    Inputs.lt.toString(),
    true,
  );

  static List<Setting> rtSetting = generateFCSettings(
    Inputs.rt.toString(),
    "Number of alloted RT presses until the desired effect occurs",
    SortProperties.trigger,
    8,
    Inputs.rt.toString(),
    true,
  );

  static List<Setting> upSetting = generateFCSettings(
    Inputs.lUp.toString(),
    "Number of alloted Up presses until the desired effect occurs",
    SortProperties.stick,
    15,
    Inputs.lUp.toString(),
    true,
  );

  static List<Setting> downSetting = generateFCSettings(
    Inputs.lDown.toString(),
    "Number of alloted Down presses until the desired effect occurs",
    SortProperties.stick,
    15,
    Inputs.lDown.toString(),
    true,
  );

  static List<Setting> leftSetting = generateFCSettings(
    Inputs.lLeft.toString(),
    "Number of alloted Left presses until the desired effect occurs",
    SortProperties.stick,
    15,
    Inputs.lLeft.toString(),
    true,
  );

  static List<Setting> rightSetting = generateFCSettings(
    Inputs.lRight.toString(),
    "Number of alloted Right presses until the desired effect occurs",
    SortProperties.stick,
    15,
    Inputs.lRight.toString(),
    true,
  );
}

List<Setting> FCsettings = [
  ...FCSettingsData.aSetting,
  ...FCSettingsData.bSetting,
  ...FCSettingsData.xSetting,
  ...FCSettingsData.ySetting,
  ...FCSettingsData.lbSetting,
  ...FCSettingsData.rbSetting,
  ...FCSettingsData.startSetting,
  ...FCSettingsData.selectSetting,
  ...FCSettingsData.lThumbSetting,
  ...FCSettingsData.ltSetting,
  ...FCSettingsData.rtSetting,
  ...FCSettingsData.upSetting,
  ...FCSettingsData.downSetting,
  ...FCSettingsData.leftSetting,
  ...FCSettingsData.rightSetting,
];

/*
class DCSettingsData {
  static Setting deviceOption = Setting(
    name: "Input device",
    description: "The input device you want to use",
    value: ,
  )
    ..title = "Input device"
    ..enabled = true
    ..description = "The input device you want to use"
    ..individual = true
    ..ready = false
    ..widget = SettingsWidgets.devicesDropdown;

  static Setting controlLayoutFile = Setting()
    ..title = "Control layout"
    ..enabled = true
    ..description = "For loading DC controller layouts"
    ..widget = SettingsWidgets.layoutDropdown
    ..mapValues = {"input": Inputs.a};

  static Setting aSetting = Setting()
    ..title = Inputs.a.toString()
    ..enabled = true
    ..description = "Input for pressing the A button"
    ..inputType = InputTypes.button
    ..widget = SettingsWidgets.textField
    ..mapValues = {"input": Inputs.a};

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

Map<String, Setting> DCsettings = [
  'a': DCSettingsData.aSetting,
  'b': DCSettingsData.bSetting,
  'x': DCSettingsData.xSetting,
  'y': DCSettingsData.ySetting,
  'rb': DCSettingsData.rbSetting,
  'lb': DCSettingsData.lbSetting,
  'start': DCSettingsData.start,
  'select': DCSettingsData.select,
  'lThumb': DCSettingsData.lthumbSetting,
  'lt': DCSettingsData.ltSetting,
  'rt': DCSettingsData.rtSetting,
  'up': DCSettingsData.upSetting,
  'down': DCSettingsData.downSetting,
  'left': DCSettingsData.leftSetting,
  'right': DCSettingsData.rightSetting,
];
*/

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
  static Gamemode freeForAll = Gamemode()
    ..name = "Free For All"
    ..teams = false
    ..timesPlayed = 0
    ..settings.addAll([
      Setting()
        ..title = GamemodeOptionsValues.score.toString()
        ..mapValues = 50
        ..settingsWidget = SettingsWidgets.numField,
      Setting()
        ..title = GamemodeOptionsValues.score.toString()
        ..mapValues = true
        ..settingsWidget = SettingsWidgets.boolDropdown,
    ]);
  static Gamemode tagBattle = Gamemode()
    ..name = "Tag Battle"
    ..teams = true
    ..timesPlayed = 0
    ..settings.addAll([
      Setting()
        ..title = GamemodeOptionsValues.score.toString()
        ..mapValues = 40
        ..settingsWidget = SettingsWidgets.numField,
      Setting()
        ..title = GamemodeOptionsValues.score.toString()
        ..mapValues = true
        ..settingsWidget = SettingsWidgets.boolDropdown,
    ]);
  // static Gamemode TESTGamemode = Gamemode()
  //   ..name = "Test Gamemode"
  //   ..teams = false
  //   ..timesPlayed = 0;
  // static Gamemode TESTGamemode2 = Gamemode()
  //   ..name = "Test Gamemode2"
  //   ..teams = true
  //   ..timesPlayed = 0;
}

List<Gamemode> gamemodes = [
  GamemodeData.freeForAll,
  GamemodeData.tagBattle,
  // Note that randomization options are available for character and program selection
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
  // static Team TESTTeam = Team()
  //   ..name = "test"
  //   ..logo = "assets/images/noTeamImage.jpg"
  //   ..description = """TESTING"""
  //   ..color = ColorVars.yellow;
  // static Team TESTTeam2 = Team()
  //   ..name = "test2"
  //   ..logo = "assets/images/noTeamImage.jpg"
  //   ..description = """TESTING2"""
  //   ..color = ColorVars.yellow;
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
    ..color = PlayerColors.p1.toColor();
  static Gamepad gamepad2 = Gamepad()
    ..connected = true
    ..index = 2
    ..color = PlayerColors.p2.toColor();
  static Gamepad gamepad3 = Gamepad()
    ..connected = true
    ..index = 3
    ..color = PlayerColors.p3.toColor();
  // static Gamepad TESTGamepad = Gamepad()
  //   ..connected = false
  //   ..index = 4
  //   ..color = ColorVars.orange;
  // static Gamepad TESTGamepad2 = Gamepad()
  //   ..connected = false
  //   ..index = 5
  //   ..color = ColorVars.purple;
}

List<Gamepad> testGamepads = [
  GamepadData.gamepad1,
  GamepadData.gamepad2,
  GamepadData.gamepad3,
];

class PlayerData {
  static Player player1 = Player()..color = ColorVars.red;
  static Player player2 = Player()..color = ColorVars.blue;
  static Player player3 = Player()..color = ColorVars.green;
  // static Player TESTPlayer = Player()..color = ColorVars.yellow;
  // static Player TESTPlayer2 = Player()..color = ColorVars.pink;
}

List<Player> testPlayers = [
  // Player color defaults to white, but is overwritten in the following order
  // team -> gamepad -> player
  PlayerData.player1,
  PlayerData.player2,
  PlayerData.player3,
];
