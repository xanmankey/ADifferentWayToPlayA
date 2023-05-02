import 'package:adifferentwaytoplay/app/utils/utils.dart';
import 'package:adifferentwaytoplay/app/widgets/utility/settings_context_menu.dart';
import 'package:adifferentwaytoplay/app/widgets/utility/text.dart';
import 'package:adifferentwaytoplay/domain/constants.dart';
import 'package:adifferentwaytoplay/domain/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:adifferentwaytoplay/domain/utils/utils.dart';

class SettingsDropdown extends StatefulWidget {
  Setting setting;
  Items items;
  void Function(String) updateSettingValue;
  SettingsDropdown({
    super.key,
    required this.setting,
    required this.items,
    required this.updateSettingValue,
  });

  @override
  State<SettingsDropdown> createState() => _SettingsDropdownState();
}

class _SettingsDropdownState extends State<SettingsDropdown> {
  dynamic currentValue;
  @override
  Widget build(BuildContext context) {
    return SettingsContextMenu(
      setting: widget.setting,
      settingsWidget: DropdownButton(
          items: populateDropdown(widget.items),
          value: currentValue,
          dropdownColor: settingColor(widget.setting.sortProperty ?? ''),
          hint: TextWidget(text: widget.setting.description ?? ''),
          onChanged: (widget.setting.enabled)
              ? (value) {
                  setState(() {
                    currentValue = value;
                  });
                  widget.updateSettingValue(value.toString());
                }
              : null),
    );
  }
}

List<DropdownMenuItem<String>> populateDropdown(Items items) {
  switch (items) {
    case Items.inputs:
      return [
        for (Inputs inputs in items.inputsIterable)
          DropdownMenuItem<String>(child: TextWidget(text: inputs.toString()))
      ];
    case Items.inputTypes:
      return [
        for (InputTypes inputTypes in items.inputTypesIterable)
          DropdownMenuItem<String>(
              child: TextWidget(text: inputTypes.toString()))
      ];
    case Items.filters:
      return [
        for (Filters filters in items.filtersIterable)
          DropdownMenuItem<String>(child: TextWidget(text: filters.toString()))
      ];
    case Items.booleans:
      return [
        for (bool boolean in items.booleanIterable)
          DropdownMenuItem<String>(child: TextWidget(text: boolean.toString()))
      ];
    // case Items.devices:
    //   return [
    //     for (Device device in items.filtersIterable)
    //       DropdownMenuItem<String>(child: TextWidget(text: device.toString()))
    //   ];
  }
}
