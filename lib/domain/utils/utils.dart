// A static class for easy-access scripts by abbreviation
import 'package:adifferentwaytoplay/app/utils/utils.dart';
import 'package:adifferentwaytoplay/domain/constants.dart';
import 'dart:math';
import 'package:dartusbhid/enumerate.dart';
import 'package:dartusbhid/usb_device.dart';
import 'package:flutter/material.dart';

/// An object with data for each custom setting
/// Handy for initializing widget data
/// Settings can also provided a String property that
/// can be used for sorting and retrieving
/// properties by a certain string
/// ```
///
/// ```
// class Setting {
//   String name;
//   Object value;
//   // If enabled is null, then the option CANNOT be disabled
//   bool enabled;
//   String? description;
//   // This is a String to allow for more dynamic sorting in the future
//   // enums are used to ensure consistency within sorting
//   String? sortProperty;
//   SettingsWidgets settingsWidget;

//   Setting(
//       {required this.name,
//       required this.value,
//       required this.settingsWidget,
//       this.enabled = true,
//       this.description = '',
//       this.sortProperty = ''});
// }

// Characters, Teams, and Gamepads ALL need colors
// To determine the color of the player (gamepad -> character -> team)

/// A utility function for converting database values to
/// boolean type
/// ```
/// bool intToBool(int num) {
///   if (num == 1) {
///     return true;
///   } else {
///     return false;
///   }
/// }
/// ```
bool intToBool(int num) {
  if (num == 1) {
    return true;
  } else {
    return false;
  }
}

// A hash function for handling string indeces
/// FNV-1a 64bit hash algorithm optimized for Dart Strings
/// ```
/// int fastHash(String string) {
///   var hash = 0xcbf29ce484222325;
///
///   var i = 0;
///   while (i < string.length) {
///     final codeUnit = string.codeUnitAt(i++);
///     hash ^= codeUnit >> 8;
///     hash *= 0x100000001b3;
///     hash ^= codeUnit & 0xFF;
///     hash *= 0x100000001b3;
///   }
///
///   return hash;
/// }
/// ```
int fastHash(String string) {
  var hash = 0xcbf29ce484222325;

  var i = 0;
  while (i < string.length) {
    final codeUnit = string.codeUnitAt(i++);
    hash ^= codeUnit >> 8;
    hash *= 0x100000001b3;
    hash ^= codeUnit & 0xFF;
    hash *= 0x100000001b3;
  }

  return hash;
}

/// A list of connected devices
/// Uses the dartusbhid package (https://pub.dev/packages/dartusbhid/install)
/// to interface and work with HID devices
/// It can also handle device inputs, so I will likely use it to create layouts
/// ```
///
/// ```
Future<List<USBDeviceInfo>> retrieveDevices() async {
  List<USBDeviceInfo> devices = await enumerateDevices(0, 0);
  return devices;
}

/// A function for generating a random 'quazi-unique' string
/// ```
///
/// ```
String generateRandomString(int stringLength) {
  final random = Random();
  const allChars =
      'AaBbCcDdlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1EeFfGgHhIiJjKkL234567890';
  return List.generate(
          stringLength, (index) => allChars[random.nextInt(allChars.length)])
      .join();
}

/// The following functions are depricated,
/// as the idea of a user-built UI has been abandoned
/// (at least for the forseeable future)
/*
/// A function for creating the creator bar settings objects
/// ```
///
/// ```
Map<SettingsWidgets, Setting> createSettings(List<SettingsWidgets> widgets,
    {String? title,
    String? description,
    bool? enabled,
    bool? individual,
    bool? ready,
    Map<String, dynamic>? mapValues}) {
  Map<SettingsWidgets, Setting> items = {};
  for (SettingsWidgets widget in widgets) {
    items.addAll({
      widget: Setting()
        ..title = title ?? generateRandomString(10)
        ..description = description
        ..enabled = enabled ?? true
        ..individual = individual ?? false
        ..ready = ready ?? true
        ..mapValues = mapValues ?? {}
        ..widget = widget
    });
  }
  return items;
}

/// A function for retrieving lists of widgets
/// based on the inputType (button, trigger, stick, or other)
/// of a widget. This can be handy for sorting by an input type property
/// ```
///
/// ```
Map<String, List<Widget>> sortByInputType(List<Setting> settings) {
  List<Widget> buttonWidgets = [];
  List<Widget> triggerWidgets = [];
  List<Widget> stickWidgets = [];
  List<Widget> otherWidgets = [];
  for (Setting setting in settings) {
    switch (setting.inputType) {
      case InputTypes.button:
        buttonWidgets.add(generateSettingsWidgets([setting])[0]);
        break;
      case InputTypes.trigger:
        triggerWidgets.add(generateSettingsWidgets([setting])[0]);
        break;
      case InputTypes.stick:
        stickWidgets.add(generateSettingsWidgets([setting])[0]);
        break;
      default:
        otherWidgets.add(generateSettingsWidgets([setting])[0]);
        break;
    }
  }
  return {
    'button': buttonWidgets,
    'trigger': triggerWidgets,
    'stick': stickWidgets,
    'other': otherWidgets,
  };
}
*/
