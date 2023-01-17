import 'package:adifferentwaytoplay/app/utils/utils.dart';
import 'package:adifferentwaytoplay/domain/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:adifferentwaytoplay/domain/entities/settings.dart';
import 'package:adifferentwaytoplay/app/widgets/settings/settings_context_menu.dart';

class SettingsField extends StatefulWidget {
  Setting setting;
  SettingsWidgets settingsWidget;
  bool title;
  bool description;
  SettingsField({
    super.key,
    required this.setting,
    required this.settingsWidget,
    this.title = true,
    this.description = false,
  });

  @override
  State<SettingsField> createState() => _SettingsFieldState();
}

class _SettingsFieldState extends State<SettingsField> {
  TextEditingController controller = TextEditingController();
  late Color fieldColor;
  @override
  void initState() {
    if (widget.title) {
      controller.text = widget.setting.title;
    } else if (widget.description) {
      controller.text = widget.setting.description ?? '';
    } else if (widget.setting.mapValues.containsKey(widget.setting.title)) {
      controller.text = widget.setting.mapValues[widget.setting.title];
    }
    fieldColor = inputTypeColor(widget.setting.inputType);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SettingsContextMenu(
      setting: widget.setting,
      settingsWidget: TextField(
        controller: controller,
        style: TextStyle(
          decorationColor: fieldColor,
        ),
        keyboardType: widget.settingsWidget == SettingsWidgets.numField
            ? TextInputType.number
            : TextInputType.text,
        onSubmitted: (value) {
          if (widget.title) {
            setState(() {
              widget.setting.title = controller.text;
            });
          } else if (widget.description) {
            setState(() {
              widget.setting.description = controller.text;
            });
          } else {
            setState(() {
              widget.setting.mapValues
                  .addAll({widget.setting.title: int.parse(controller.text)});
            });
          }
        },
      ),
    );
  }
}
