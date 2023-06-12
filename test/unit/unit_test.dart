import 'dart:io';

import 'package:adifferentwaytoplay/app/pages/input_results_view.dart';
import 'package:adifferentwaytoplay/app/utils/utils.dart';
import 'package:adifferentwaytoplay/app/widgets/utility/settings_checkbox.dart';
import 'package:adifferentwaytoplay/data/utils/initial_vars.dart';
import 'package:adifferentwaytoplay/domain/entities/character.dart';
import 'package:isar/isar.dart';
import 'package:adifferentwaytoplay/data/utils/utils.dart';

import 'package:test/test.dart';

/// Unit testing various functions for correctness
void main() async {
  /// Test fastHash()
  // group("fastHash()", () {
  //   test("fastHash()", () => null);
  // });

  /// Test creating a storage instance + openDB()
  group("openDB()", () {
    // Set up by opening database
    setUp(() async {
      await Isar.initializeIsarCore(download: true);
      storage.openDB();
    });
    // Check that isar db is set correctly
    test("initialization", () {
      expect(storage.isarDB, isNot(isException));
    });
    // Check that data is written correctly
    test("data", () async {
      expect(await storage.isarDB.getSize(), isNot(0));
    });
  });

  // TODO: requires ViGEm
  /// Test checkControllers()
  // group("checkControllers()", () {
  //   test("", () {});
  // });

  /// Test calculateScore()
  group("calculateScore()", () {
    test("0", () {
      expect(calculateScore(5, 0), 10);
    });
    test("7", () {
      expect(calculateScore(5, 7), 1);
    });
  });

  /// Test generateSettingsWidgets()
  group("generateSettingsWidgets()", () {
    test("invalid", () {
      expect(generateSettingsWidgets(appSettings), []);
    });
    test("tc settings", () {
      expect(generateSettingsWidgets(RCsettings), [
        SettingsCheckbox(setting: RCsettings[0]),
        SettingsCheckbox(setting: RCsettings[1]),
        SettingsCheckbox(setting: RCsettings[2]),
      ]);
    });
  });
}
