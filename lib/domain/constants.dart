/// An enum for indicating which widget to use when rendering data
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
  boolDropdown,
  filtersDropdown,
  // devicesDropdown,
  textField;
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

/// InputTypes enum; defines the major parts of a
/// controller that the app focuses on manipulating.
///
/// ```
/// enum SortProperties {
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

/// Utilizes inputTypes values; an enum containing potential sortProperties
/// that can be used to organize settings
enum SortProperties {
  button,
  trigger,
  stick;
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
  filters,
  booleans;

  final Iterable inputsIterable = Inputs.iterator;
  final Iterable inputTypesIterable = InputTypes.iterator;
  final Iterable filtersIterable = Filters.iterator;
  final Iterable booleanIterable = [true, false];
}
