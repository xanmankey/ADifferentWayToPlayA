import 'package:adifferentwaytoplay/app/utils/utils.dart';
import 'package:adifferentwaytoplay/app/widgets/utility/text.dart';
import 'package:adifferentwaytoplay/domain/constants.dart';
import 'package:adifferentwaytoplay/domain/entities/setting.dart';
import 'package:flutter/material.dart';
import 'package:adifferentwaytoplay/app/widgets/utility/settings_context_menu.dart';
import 'package:checkbox_formfield/checkbox_formfield.dart';

class SettingsCheckbox extends StatefulWidget {
  Setting setting;
  void Function(bool?) updateSettingValue;
  bool defaultValue;
  SettingsCheckbox({
    super.key,
    required this.setting,
    required this.updateSettingValue,
    this.defaultValue = true,
  });

  @override
  State<SettingsCheckbox> createState() => _SettingsCheckboxState();
}

class _SettingsCheckboxState extends State<SettingsCheckbox> {
  @override
  Widget build(BuildContext context) {
    bool currentValue = widget.defaultValue;
    return SettingsContextMenu(
      setting: widget.setting,
      settingsWidget: CheckboxListTile(
        value: currentValue,
        tileColor: settingColor(widget.setting.sortProperty),
        onChanged: (value) {
          setState(() {
            currentValue = value!;
          });
          widget.updateSettingValue(value);
        },
        title: TextWidget(text: widget.setting.title),
      ),
      updateSettingValue: ({description, enabled = true, sortType, title}) {
        // Update the setting
      },
      deleteSetting: (setting) {
        // Delete the setting
      },
    );
  }
}
