import 'package:adifferentwaytoplay/app/utils/utils.dart';
import 'package:adifferentwaytoplay/app/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:adifferentwaytoplay/domain/utils/utils.dart';
import 'package:adifferentwaytoplay/app/widgets/utility/settings_context_menu.dart';
import 'package:checkbox_formfield/checkbox_formfield.dart';

class SettingsCheckbox extends StatefulWidget {
  Setting setting;
  SettingsCheckbox({super.key, required this.setting});

  @override
  State<SettingsCheckbox> createState() => _SettingsCheckboxState();
}

class _SettingsCheckboxState extends State<SettingsCheckbox> {
  @override
  Widget build(BuildContext context) {
    // If an individual widget, display a form option with validation
    (widget.setting.individual)
        ? SettingsContextMenu(
            setting: widget.setting,
            settingsWidget: CheckboxListTileFormField(
              initialValue: false,
              activeColor: inputTypeColor(widget.setting.inputType),
              onChanged: (value) {
                setState(() {
                  widget.setting.mapValues
                      .addAll({widget.setting.title: value});
                });
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              title: TextWidget(text: widget.setting.title),
              validator: widget.setting.validation != null
                  ? widget.setting.validation
                  : null,
            ),
          )
        : SettingsContextMenu(
            setting: widget.setting,
            settingsWidget: CheckboxListTile(
              value: true,
              tileColor: inputTypeColor(widget.setting.inputType),
              onChanged: (value) {
                setState(() {
                  widget.setting.mapValues
                      .addAll({widget.setting.title: value});
                });
              },
              title: TextWidget(text: widget.setting.title),
            ),
          );
    throw Exception("Settings checkbox failed to render");
  }
}
