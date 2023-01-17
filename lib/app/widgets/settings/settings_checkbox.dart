import 'package:adifferentwaytoplay/app/utils/utils.dart';
import 'package:adifferentwaytoplay/app/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:adifferentwaytoplay/domain/entities/settings.dart';
import 'package:adifferentwaytoplay/app/widgets/settings/settings_context_menu.dart';

class SettingsCheckbox extends StatefulWidget {
  Setting setting;
  SettingsCheckbox({super.key, required this.setting});

  @override
  State<SettingsCheckbox> createState() => _SettingsCheckboxState();
}

class _SettingsCheckboxState extends State<SettingsCheckbox> {
  @override
  Widget build(BuildContext context) {
    return SettingsContextMenu(
      setting: widget.setting,
      settingsWidget: CheckboxListTile(
        value: true,
        tileColor: inputTypeColor(widget.setting.inputType),
        onChanged: (value) {
          setState(() {
            widget.setting.mapValues.addAll({widget.setting.title: value});
          });
        },
        title: TextWidget(text: widget.setting.title),
      ),
    );
  }
}
