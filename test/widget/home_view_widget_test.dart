@Skip()

import 'package:adifferentwaytoplay/data/utils/initial_vars.dart';
import 'package:adifferentwaytoplay/domain/entities/character.dart';
import 'package:adifferentwaytoplay/domain/entities/gamemode.dart';
import 'package:adifferentwaytoplay/domain/entities/program.dart';
import 'package:adifferentwaytoplay/domain/entities/setting.dart';
import 'package:adifferentwaytoplay/domain/entities/team.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:adifferentwaytoplay/data/utils/utils.dart';

/// Testing the various different data_page_views
/// A variety of tests are used, from data testing,
/// render testing, etc
void main() {
  // bool changed = true;
  // setUp(() async {
  //   // Use `flutter test -j 1` command for testing
  //   await Isar.initializeIsarCore(download: true);
  //   storage.openDB(changed: changed);
  // });

  /// Check that all parts render and function
  group("program button", () {
    testWidgets("render", (WidgetTester tester) async {
      await tester.pumpWidget(widget);
    });
    testWidgets("function", (WidgetTester tester) async {
      await tester.pumpWidget(widget);
    });
  });
  group("teams button", () {
    testWidgets("render", (WidgetTester tester) async {
      await tester.pumpWidget(widget);
    });
    testWidgets("function", (WidgetTester tester) async {
      await tester.pumpWidget(widget);
    });
  });
  group("characters button", () {
    testWidgets("render", (WidgetTester tester) async {
      await tester.pumpWidget(widget);
    });
    testWidgets("function", (WidgetTester tester) async {
      await tester.pumpWidget(widget);
    });
  });
  group("dwtp button", () {
    testWidgets("render", (WidgetTester tester) async {
      await tester.pumpWidget(widget);
    });
    testWidgets("function", (WidgetTester tester) async {
      await tester.pumpWidget(widget);
    });
  });
  group("app settings button", () {
    testWidgets("render", (WidgetTester tester) async {
      await tester.pumpWidget(widget);
    });
    testWidgets("function", (WidgetTester tester) async {
      await tester.pumpWidget(widget);
    });
  });
  group("gamemodes button", () {
    testWidgets("render", (WidgetTester tester) async {
      await tester.pumpWidget(widget);
    });
    testWidgets("function", (WidgetTester tester) async {
      await tester.pumpWidget(widget);
    });
  });
}
