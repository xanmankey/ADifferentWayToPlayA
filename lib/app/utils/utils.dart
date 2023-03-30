import 'package:flutter/material.dart';

import 'package:adifferentwaytoplay/app/widgets/utility/DWTP_dropdown.dart';
import 'package:adifferentwaytoplay/app/widgets/utility/DWTP_field.dart';
import 'package:adifferentwaytoplay/domain/utils/utils.dart';

/// A function for returning a Color associated with the type of input;
/// uses the xbox controller colorscheme
Color inputTypeColor(InputTypes? type) {
  switch (type) {
    case InputTypes.button:
      return Colors.red;
    case InputTypes.trigger:
      return Colors.green;
    case InputTypes.stick:
      return Colors.yellow;
    default:
      return Colors.blue;
  }
}

List<Widget> generateSettingsWidgets(List<Setting> settings) {
  List<Widget> widgets = [];
  for (Setting setting in settings) {
    switch (setting.widget) {
      case SettingsWidgets.checkbox:
        widgets.add(SettingsCheckbox(setting: setting));
        break;
      case SettingsWidgets.numField:
        widgets.add(SettingsField(
          setting: setting,
          settingsWidget: SettingsWidgets.numField,
        ));
        break;
      case SettingsWidgets.textField:
        widgets.add(SettingsField(
            setting: setting, settingsWidget: SettingsWidgets.textField));
        break;
      case SettingsWidgets.inputTypesDropdown:
        widgets.add(SettingsDropdown(
          setting: setting,
          items: Items.inputTypes,
        ));
        break;
      case SettingsWidgets.inputsDropdown:
        widgets.add(SettingsDropdown(
          setting: setting,
          items: Items.inputs,
        ));
        break;
      case SettingsWidgets.filtersDropdown:
        widgets.add(SettingsDropdown(
          setting: setting,
          items: Items.filters,
        ));
        break;
      case SettingsWidgets.card:
        break;
    }
  }
  return widgets;
}
