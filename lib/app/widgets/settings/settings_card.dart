import 'dart:convert';

import 'package:adifferentwaytoplay/app/utils/utils.dart';
import 'package:adifferentwaytoplay/app/widgets/settings/settings_dialog.dart';
import 'package:adifferentwaytoplay/domain/entities/settings.dart';
import 'package:flutter/material.dart';
import 'package:adifferentwaytoplay/app/widgets/text.dart';
import 'package:adifferentwaytoplay/app/widgets/settings/settings_context_menu.dart';

// This goes inside a horizontal ListView
class SettingsCard extends StatefulWidget {
  Setting setting;
  List<Setting>? dialogSettings;
  SettingsCard({super.key, required this.setting, this.dialogSettings});

  @override
  State<SettingsCard> createState() => _SettingsCardState();
}

class _SettingsCardState extends State<SettingsCard> {
  @override
  Widget build(BuildContext context) {
    return SettingsContextMenu(
      setting: widget.setting,
      settingsWidget: GestureDetector(
        onTap: (() => showDialog(
            context: context,
            builder: (context) => SettingsDialog(
                  cardSetting: widget.setting,
                  dialogSettings: widget.dialogSettings,
                ))),
        child: Card(
          color: widget.setting.enabled
              ? inputTypeColor(widget.setting.inputType)
              : Colors.grey,
          child: TextWidget(
            text: widget.setting.title,
          ),
        ),
      ),
    );
  }
}