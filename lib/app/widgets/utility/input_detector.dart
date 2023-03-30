// For DC.py; used to detect inputs
// An extension of SettingsWidgets.TextField where the text is
// set on click by the input value of a specified device
import 'package:adifferentwaytoplay/app/widgets/utility/DWTP_field.dart';
import 'package:adifferentwaytoplay/domain/utils/utils.dart';
import 'package:flutter/material.dart';

// Note that some of this is psuedocode
class InputDetector extends StatefulWidget {
  Setting setting;
  Device device;
  InputDetector({super.key, required this.setting, required this.device});

  @override
  State<InputDetector> createState() => _InputDetectorState();
}

class _InputDetectorState extends State<InputDetector> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SettingsField(
        setting: widget.setting,
        settingsWidget: SettingsWidgets.textField,
      ),
      onTap: () {
        // Listen for an input from the selected USB-HID device
        Input input = await widget.device.input;
        // Set the input as the value for the field
        setState(() {
          widget.setting.title = input;
        });
      },
    );
  }
}
