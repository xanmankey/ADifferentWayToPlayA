// A provider for the DWTP screen; used to change the player state
// when gamemodes are changed
import 'dart:ffi';

import 'package:flutter/material.dart';

/// A class for detailing all the methods for handling global app state
/// These include:
/// - whether teams are enabled or disabled
class DWTPProvider with ChangeNotifier {
  bool _teams = false;

  bool get teams => _teams;

  void updateTeams(bool value) {
    _teams = value;
    notifyListeners();
  }
}

DWTPProvider dwtpProvider = DWTPProvider();
