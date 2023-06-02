import 'dart:io';

import 'package:adifferentwaytoplay/data/utils/initial_vars.dart';
import 'package:adifferentwaytoplay/domain/entities/character.dart';
import 'package:isar/isar.dart';
import 'package:adifferentwaytoplay/data/utils/utils.dart';

import 'package:test/test.dart';

/// Unit testing various functions for correctness
void main() async {
  // Saves time and computation by checking if the database matches
  bool changed = true;
  setUp(() async {
    await Isar.initializeIsarCore(download: true);
    storage.openDB(changed: changed);
  });

  /// Test fastHash()
  // group("fastHash()", () {
  //   test("fastHash()", () => null);
  // });

  /// Test creating a storage instance + openDB()
  group("openDB()", () {
    test("openDB()", () => null);
  });

  /// Test checkControllers()
  group("checkControllers()", () {
    test("checkControllers()", () => null);
  });

  /// Test calculateScore()
  group("calculateScore()", () {
    test("calculateScore()", () => null);
  });

  /// Test generateSettingsWidgets()
  group("generateSettingsWidgets()", () {
    test("generateSettingsWidgets()", () => null);
  });
}
