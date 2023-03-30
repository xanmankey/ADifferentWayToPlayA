// A static class for easy-access scripts by abbreviation
import 'package:adifferentwaytoplay/app/utils/utils.dart';
import 'dart:math';
import 'package:dartusbhid/enumerate.dart';
import 'package:dartusbhid/usb_device.dart';
import 'package:flutter/material.dart';

/// An object with data for each custom setting
/// Handy for initializing widget data
/// ```
///
/// ```
class Setting {
  String name;
  Object value;
  String? description;

  Setting({required this.name, required this.value, this.description = ''});
}

/// An enum of all the initial scripts in DWTP for easy access
/// If a new program is added, it's script information can be retrieved
/// from the isar database accordingly, but cannot be directly added to the
/// constant enum
/// ```
///
/// ```
enum Scripts {
  miop,
  tc,
  rc,
  fc;

  String toPath() {
    switch (this) {
      case Scripts.miop:
        return "assets/scripts/MIOP.py";
      case Scripts.tc:
        return "assets/scripts/TC.py";
      case Scripts.rc:
        return "assets/scripts/RC.py";
      case Scripts.fc:
        return "assets/scripts/FC.py";
      default:
        return "";
    }
  }

  @override
  String toString() {
    switch (this) {
      case Scripts.miop:
        return "MIOP";
      case Scripts.tc:
        return "TC";
      case Scripts.rc:
        return "RC";
      case Scripts.fc:
        return "FC";
      default:
        return "";
    }
  }
}

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

/// An enum for indicating which widget to use; helps dictat
/// Note that each 'SettingsWidget' widget has a couple properties, including:
/// A title (which turns into the main label or title)
/// A description (which turns into hint text)
/// Whether the command is enabled or disabled (which impacts color/state)
/// ALL OF THESE are handled via a RIGHT-CLICK menu on a SettingsWidget
///
/// ``` dart
/// enum SettingsWidgets {
///   checkbox,
///   card,
///   numField,
///   inputsDropdown,
///   inputTypesDropdown,
///   filtersDropdown,
///   textField;
///
///   @override
///   String toString() {
///     switch (this) {
///       case SettingsWidgets.inputTypesDropdown:
///         return 'inputTypesDropdown';
///       case SettingsWidgets.inputsDropdown:
///         return 'inputsDropdown';
///       case SettingsWidgets.devicesDropdown:
///         return 'devicesDropdown';
///       case SettingsWidgets.checkbox:
///         return 'checkbox';
///       case SettingsWidgets.card:
///         return 'card';
///       case SettingsWidgets.numField:
///         return 'numField';
///       case SettingsWidgets.filtersDropdown:
///         return 'filtersDropdown';
///       case SettingsWidgets.textField:
///         return 'textField';
///       default:
///         return '$this';
///     }
///   }
/// }
/// ```
enum SettingsWidgets {
  checkbox,
  card,
  numField,
  inputsDropdown,
  inputTypesDropdown,
  filtersDropdown,
  devicesDropdown,
  layoutDropdown,
  textField;

  @override
  String toString() {
    switch (this) {
      case SettingsWidgets.inputTypesDropdown:
        return 'inputTypesDropdown';
      case SettingsWidgets.inputsDropdown:
        return 'inputsDropdown';
      case SettingsWidgets.devicesDropdown:
        return 'devicesDropdown';
      case SettingsWidgets.layoutDropdown:
        return 'layoutDropdown';
      case SettingsWidgets.checkbox:
        return 'checkbox';
      case SettingsWidgets.card:
        return 'card';
      case SettingsWidgets.numField:
        return 'numField';
      case SettingsWidgets.filtersDropdown:
        return 'filtersDropdown';
      case SettingsWidgets.textField:
        return 'textField';
      default:
        return '$this';
    }
  }
}

/// The InputTypes enumerator; a convenience enum for defining the major parts of a
/// controller the app focuses on manipulating
///
/// ```
/// enum InputTypes {
///   button,
///   trigger,
///   stick;
///
///   @override
///   String toString() {
///     switch (this) {
///       case InputTypes.button:
///         return 'button';
///       case InputTypes.trigger:
///         return 'trigger';
///       case InputTypes.stick:
///         return 'stick';
///       default:
///         return '$this';
///     }
///   }
/// }
/// ```
enum InputTypes {
  button,
  trigger,
  stick;

  @override
  String toString() {
    switch (this) {
      case InputTypes.button:
        return 'button';
      case InputTypes.trigger:
        return 'trigger';
      case InputTypes.stick:
        return 'stick';
      default:
        return '$this';
    }
  }

  InputTypes? fromString(String string) {
    switch (string) {
      case 'button':
        return InputTypes.button;
      case 'trigger':
        return InputTypes.trigger;
      case 'stick':
        return InputTypes.stick;
      default:
        return null;
    }
  }

  static Iterable<Inputs> get iterator => Iterable.castFrom(Inputs.values);
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

/// The Filter class; a convenience class for specifying the consequences
/// of violating the constraints of a filter
///
/// ```
/// enum Filters {
///   hold,
///   // Throttle increases the number of presses required
///   // to press said button
///   throttle,
///   // Stop prevents any press event from occuring after the
///   // alloted presses have been exhausted
///   stop;
///
///   @override
///   String toString() {
///     switch (this) {
///       case Filters.hold:
///         return 'hold';
///       case Filters.throttle:
///         return 'throttle';
///       case Filters.stop:
///         return 'stop';
///       default:
///         return '$this';
///     }
///   }
/// }
/// ```
enum Filters {
  hold,
  // Throttle increases the number of presses required
  // to press said button
  throttle,
  // Stop prevents any press event from occuring after the
  // alloted presses have been exhausted
  stop;

  @override
  String toString() {
    switch (this) {
      case Filters.hold:
        return 'hold';
      case Filters.throttle:
        return 'throttle';
      case Filters.stop:
        return 'stop';
      default:
        return '$this';
    }
  }

  Filters? fromString(String string) {
    switch (string) {
      case 'hold':
        return Filters.hold;
      case "throttle":
        return Filters.throttle;
      case "stop":
        return Filters.stop;
      default:
        return null;
    }
  }

  static Iterable<Inputs> get iterator => Iterable.castFrom(Inputs.values);
}

/// An enumerator for detailing with possible controller inputs
///
/// ```dart
/// enum Inputs {
///   up,
///   down,
///   right,
///   left,
///   a,
///   b,
///   x,
///   y,
///   lb,
///   rb,
///   lt,
///   rt,
/// }
/// ```
///
enum Inputs {
  lUp,
  lDown,
  lRight,
  lLeft,
  rUp,
  rDown,
  rRight,
  rLeft,
  a,
  b,
  x,
  y,
  lb,
  rb,
  lt,
  rt,
  start,
  select,
  lThumb,
  rThumb;

  @override
  String toString() {
    switch (this) {
      case Inputs.a:
        return 'a';
      case Inputs.b:
        return 'b';
      case Inputs.x:
        return 'x';
      case Inputs.y:
        return 'y';
      case Inputs.lb:
        return 'lb';
      case Inputs.rb:
        return 'rb';
      case Inputs.lt:
        return 'lt';
      case Inputs.rt:
        return 'rt';
      case Inputs.lUp:
        return 'up';
      case Inputs.lDown:
        return 'down';
      case Inputs.lRight:
        return 'right';
      case Inputs.lLeft:
        return 'left';
      case Inputs.rUp:
        return 'rup';
      case Inputs.rDown:
        return 'rdown';
      case Inputs.rRight:
        return 'rright';
      case Inputs.rLeft:
        return 'rleft';
      case Inputs.start:
        return 'start';
      case Inputs.select:
        return 'select';
      case Inputs.lThumb:
        return 'thumb';
      case Inputs.rThumb:
        return 'rthumb';
      default:
        return '$this';
    }
  }

  Inputs? fromString(String string) {
    switch (string) {
      case 'a':
        return Inputs.a;
      case 'b':
        return Inputs.b;
      case 'x':
        return Inputs.x;
      case 'y':
        return Inputs.y;
      case 'lb':
        return Inputs.lb;
      case 'rb':
        return Inputs.rb;
      case 'lt':
        return Inputs.lt;
      case 'rt':
        return Inputs.rt;
      case 'up':
        return Inputs.lUp;
      case "down":
        return Inputs.lDown;
      case "right":
        return Inputs.lRight;
      case "left":
        return Inputs.lLeft;
      case 'rup':
        return Inputs.rUp;
      case 'rdown':
        return Inputs.rDown;
      case 'rright':
        return Inputs.rRight;
      case 'rleft':
        return Inputs.rLeft;
      case 'start':
        return Inputs.start;
      case 'select':
        return Inputs.select;
      case 'thumb':
        return Inputs.lThumb;
      case 'rthumb':
        return Inputs.rThumb;
      default:
        return null;
    }
  }

  static Iterable<Inputs> get iterator => Iterable.castFrom(Inputs.values);
}

/// An enum for enums. For dropdown utility
/// 'Devices' is not added to the enum, as devices are not
/// compile-time constants, but rather are retrieved at runtime
///
/// ```dart
/// enum Items {
///   inputs,
///   inputTypes,
///   filters;
///
///   final Iterable inputsIterable = Inputs.iterator;
///   final Iterable inputTypesIterable = InputTypes.iterator;
///   final Iterable filtersIterable = Filters.iterator;
/// }
/// ```
enum Items {
  inputs,
  inputTypes,
  filters;

  final Iterable inputsIterable = Inputs.iterator;
  final Iterable inputTypesIterable = InputTypes.iterator;
  final Iterable filtersIterable = Filters.iterator;
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
