import 'package:adifferentwaytoplay/data/utils/initial_vars.dart';
import 'package:adifferentwaytoplay/domain/entities/setting.dart';
import 'package:adifferentwaytoplay/domain/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'dart:io';
import 'package:adifferentwaytoplay/domain/entities/gamepad.dart';
import 'package:adifferentwaytoplay/domain/entities/player.dart';
import 'package:adifferentwaytoplay/domain/entities/character.dart';
import 'package:adifferentwaytoplay/domain/entities/program.dart';
import 'package:adifferentwaytoplay/domain/entities/gamemode.dart';
import 'package:adifferentwaytoplay/domain/entities/team.dart';
import 'package:logging/logging.dart';

// A simple class for getting the current instance of Isar
// Or creating a new instance
class Storage {
  Logger logger = Logger("Data logger");
  late Isar isarDB;

  // PROBLEM
  // Every time utils.dart gets imported, storage apparently gets reinitialized
  // That wouldn't be a problem in and of itself; it just appears
  Storage() {
    openDB();
  }

  void openDB({bool changed = false}) {
    // Alternatively opens an Isar DB in test mode for testing purposes
    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      if (Isar.instanceNames.isEmpty) {
        // Create collection
        Isar isarInstance = Isar.openSync(
          [
            CharacterSchema,
            GamemodeSchema,
            GamepadSchema,
            PlayerSchema,
            ProgramSchema,
            TeamSchema,
            SettingSchema,
          ],
          name: "test",
          inspector: true,
        );
        if (changed) {
          // Write test data if the database is empty
          // Default mock data is used for gamepads and players
          isarInstance.writeTxnSync(() {
            // Clear the test collection to prevent any Isar errors and ensure
            // correct data is used every time
            isarInstance.clearSync();

            // Write characters
            isarInstance.characters.putAllSync(characters);
            // Write programs
            isarInstance.programs.putAllSync([
              ProgramData.TC,
              ProgramData.RC,
              ProgramData.MIOP,
              ProgramData.FC,
            ]);
            // Write teams
            isarInstance.teams.putAllSync(teams);
            // Write gamemodes
            isarInstance.gamemodes.putAllSync(gamemodes);
            // Write app settings
            isarInstance.settings.putAllSync(appSettings);
            // Write Gamepads
            isarInstance.gamepads.putAllSync(testGamepads);
            // Write Players
            isarInstance.players.putAllSync(testPlayers);
          });
        }
        isarDB = isarInstance;
        return;
      }
    } else {
      // If you want to change the name of the app database for some reason,
      // change the below variable
      const String DBNAME = "real";
      // Create collection
      if (Isar.instanceNames.isEmpty) {
        Isar isarInstance = Isar.openSync(
          [
            CharacterSchema,
            GamemodeSchema,
            GamepadSchema,
            PlayerSchema,
            ProgramSchema,
            TeamSchema,
            SettingSchema,
          ],
          name: DBNAME,
          // TODO: disable inspection once app is completed
          inspector: true,
        );
        // Only uncomment the following code if you want to clear your db
        /*
        isarDB.writeTxnSync(() {
          isarDB.clearSync();
        });
        */
        // Check if the size of the db == 0
        if (isarInstance.getSizeSync() == 0) {
          isarInstance.writeTxnSync(() {
            // Write characters
            isarInstance.characters.putAllSync(characters);
            // Write programs
            isarInstance.programs.putAllSync([
              ProgramData.TC,
              ProgramData.RC,
              ProgramData.MIOP,
              ProgramData.FC,
            ]);
            // Write teams
            isarInstance.teams.putAllSync(teams);
            // Write gamemodes
            isarInstance.gamemodes.putAllSync(gamemodes);
            // Write app settings
            isarInstance.settings.putAllSync(appSettings);
          });
        }
        isarDB = isarInstance;
        return;
      } else {
        isarDB = Isar.getInstance(DBNAME)!;
      }
    }
    return;
  }
}

Storage storage = Storage();
