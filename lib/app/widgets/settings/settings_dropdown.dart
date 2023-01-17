import 'package:adifferentwaytoplay/app/utils/utils.dart';
import 'package:adifferentwaytoplay/app/widgets/text.dart';
import 'package:adifferentwaytoplay/domain/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:adifferentwaytoplay/domain/entities/settings.dart';
import 'package:adifferentwaytoplay/app/widgets/settings/settings_context_menu.dart';

class SettingsDropdown extends StatefulWidget {
  Setting setting;
  Items items;
  SettingsDropdown({
    super.key,
    required this.setting,
    required this.items,
  });

  @override
  State<SettingsDropdown> createState() => _SettingsDropdownState();
}

class _SettingsDropdownState extends State<SettingsDropdown> {
  @override
  Widget build(BuildContext context) {
    return SettingsContextMenu(
      setting: widget.setting,
      settingsWidget: DropdownButton(
        items: populateDropdown(widget.items),
        value: widget.setting.enabled,
        dropdownColor: inputTypeColor(widget.setting.inputType),
        hint: TextWidget(text: widget.setting.description ?? ''),
        onChanged: (value) {
          setState(() {
            widget.setting.mapValues.addAll({widget.setting.title: value});
          });
        },
      ),
    );
  }
}

List<DropdownMenuItem> populateDropdown(Items items) {
  switch (items) {
    case Items.inputs:
      return [
        for (Inputs inputs in items.inputsIterable)
          DropdownMenuItem(child: TextWidget(text: inputs.toString()))
      ];
    case Items.inputTypes:
      return [
        for (InputTypes inputTypes in items.inputTypesIterable)
          DropdownMenuItem(child: TextWidget(text: inputTypes.toString()))
      ];
    case Items.filters:
      return [
        for (Filters filters in items.filtersIterable)
          DropdownMenuItem(child: TextWidget(text: filters.toString()))
      ];
  }
  ;
}
