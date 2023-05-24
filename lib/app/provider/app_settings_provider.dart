import 'package:adifferentwaytoplay/app/constants.dart';
import 'package:flutter/material.dart';

class AppSettingsProvider extends ChangeNotifier {
  // double _brightness = 75;
  // Color
  Themes _theme = Themes.blue;

  // double get brightness => _brightness;
  Themes get theme => _theme;

  // void updateBrightness(double value) {
  //   _brightness = value;
  //   notifyListeners();
  // }

  void updateTheme(Themes value) {
    _theme = value;
    notifyListeners();
  }
}

AppSettingsProvider appSettingsProvider = AppSettingsProvider();
