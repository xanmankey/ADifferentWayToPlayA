// A provider for the DWTP screen; used to change the player state
// when gamemodes are changed
import 'dart:ffi';

import 'package:adifferentwaytoplay/data/utils/initial_vars.dart';
import 'package:adifferentwaytoplay/domain/entities/gamemode.dart';
import 'package:adifferentwaytoplay/domain/entities/gamepad.dart';
import 'package:adifferentwaytoplay/domain/entities/player.dart';
import 'package:adifferentwaytoplay/domain/entities/team.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

/// A class for detailing all the methods for handling global app state
/// These include:
/// {bool} teams - whether teams are enabled or disabled
/// {bool} ready - whether all players are ready or not
class DWTPProvider with ChangeNotifier {
  // Gamemode, gamepad, and players all get handled by state management
  // teams is just a utility provider; it's not really necessary
  Gamemode _gamemode = GamemodeData.freeForAll;
  List<Gamepad> _gamepads = [];
  List<Player> _players = [];
  List<Team> _teams = [];
  bool _ready = false;
  bool _gameplay = false;
  int _numPlayers = 0;
  // Note that provider is an acceptable solution for handling cursor state,
  // but handling button inputs needs to be handled on a case-by-case basis
  List<Tuple2<int, int>> _cursors = [const Tuple2(0, 0)];

  Gamemode get gamemode => _gamemode;
  List<Gamepad> get gamepads => _gamepads;
  List<Player> get players => _players;
  List<Team> get teams => _teams;
  bool get ready => _ready;
  bool get gameplay => _gameplay;
  int get numPlayers => _numPlayers;
  List<Tuple2<int, int>> get cursors => _cursors;

  // Update the current gamemode
  void updateGamemode(Gamemode value) {
    _gamemode = value;
    notifyListeners();
  }

  // Update the current list of gamepads
  void updateGamepads(List<Gamepad> gamepads) {
    _gamepads = gamepads;
    notifyListeners();
  }

  // Update the current list of players
  void updatePlayers(List<Player> players) {
    _players = players;
    notifyListeners();
  }

  // Updates the current teams
  void updateTeams(List<Team> teams) {
    _teams = teams;
    notifyListeners();
  }

  // Handle all players being ready
  void updateReady(bool value) async {
    _ready = value;
    notifyListeners();
  }

  // Handle initialization of gameplay
  void updateGameplay(bool value) {
    _gameplay = value;
    notifyListeners();
  }

  // Update the number of players
  void updateNumPlayers(int value) {
    _numPlayers = value;
    notifyListeners();
  }

  // Update the player cursors
  void updateCursors(List<Tuple2<int, int>> cursors) {
    _cursors = cursors;
    notifyListeners();
  }
}

DWTPProvider dwtpProvider = DWTPProvider();
