import 'package:adifferentwaytoplay/app/utils/utils.dart';
import 'package:adifferentwaytoplay/data/utils/utils.dart';
import 'package:adifferentwaytoplay/domain/entities/setting.dart';
import 'package:adifferentwaytoplay/domain/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:adifferentwaytoplay/domain/utils/utils.dart';
import 'package:adifferentwaytoplay/app/widgets/utility/DWTP_context_menu.dart';

// TODO: the text controller HAS no default value...
// I'm not quite sure how to handle this because the default values are themselves
// OBJECTS, meaning that
// I wonder if that's the disadvantages of Object type; I'm gonna think out loud,
// using chatGPT as my rubber ducky

class SettingsField extends StatefulWidget {
  Setting setting;
  bool numerical;
  SettingsField({
    super.key,
    required this.setting,
    this.numerical = false,
  });

  @override
  State<SettingsField> createState() => _SettingsFieldState();
}

class _SettingsFieldState extends State<SettingsField> {
  TextEditingController controller = TextEditingController();
  late Color fieldColor;
  @override
  void initState() {
    fieldColor = settingColor(widget.setting.sortProperty);
    controller.text = widget.setting.mapValues.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // If an individual widget, display a form option with validation
    return SettingsContextMenu(
      setting: widget.setting,
      settingsWidget: TextField(
        controller: controller,
        style: TextStyle(
          decorationColor: fieldColor,
        ),
        keyboardType:
            (widget.numerical) ? TextInputType.number : TextInputType.text,
        onSubmitted: (value) {
          // Update the setting value
          widget.setting.mapValues = value;
          // Write the setting value
          storage.updateSettings([widget.setting]);
        },
      ),
    );
  }
}
