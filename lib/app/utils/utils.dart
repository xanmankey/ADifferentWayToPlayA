import 'package:adifferentwaytoplay/app/widgets/utility/settings_checkbox.dart';
import 'package:adifferentwaytoplay/domain/constants.dart';
import 'package:flutter/material.dart';

import 'package:adifferentwaytoplay/app/widgets/utility/settings_dropdown.dart';
import 'package:adifferentwaytoplay/app/widgets/utility/settings_field.dart';
import 'package:adifferentwaytoplay/domain/utils/utils.dart';

/// A function for returning a Color associated with the type of input;
/// uses the xbox controller colorscheme
Color settingColor(String sortProperty) {
  switch (sortProperty) {
    case 'button':
      return Colors.red;
    case 'trigger':
      return Colors.green;
    case 'stick':
      return Colors.yellow;
    default:
      return Colors.blue;
  }
}

/// A function for generating widgets based on settings data
List<Widget> generateSettingsWidgets(List<Setting> settings) {
  List<Widget> widgets = [];
  for (Setting setting in settings) {
    switch (setting.settingsWidget) {
      case SettingsWidgets.checkbox:
        widgets.add(SettingsCheckbox(setting: setting, updateSettingValue: ,));
        break;
      case SettingsWidgets.numField:
        widgets.add(SettingsField(
          setting: setting,
          numerical: true,
          updateSettingValue: ,
        ));
        break;
      case SettingsWidgets.textField:
        widgets.add(SettingsField(
          setting: setting,
          numerical: false,
          updateSettingValue: ,
        ));
        break;
      case SettingsWidgets.inputTypesDropdown:
        widgets.add(SettingsDropdown(
          setting: setting,
          items: Items.inputTypes,
          updateSettingValue: ,
        ));
        break;
      case SettingsWidgets.inputsDropdown:
        widgets.add(SettingsDropdown(
          setting: setting,
          items: Items.inputs,
          updateSettingValue: ,
        ));
        break;
      case SettingsWidgets.boolDropdown:
        widgets.add(
            SettingsDropdown(setting: setting, items: Items.booleans, updateSettingValue: ,));
        break;
      case SettingsWidgets.filtersDropdown:
        widgets.add(SettingsDropdown(
          setting: setting,
          items: Items.filters,
          updateSettingValue: ,
        ));
        break;
      case SettingsWidgets.card:
        break;
    }
  }
  return widgets;
}
