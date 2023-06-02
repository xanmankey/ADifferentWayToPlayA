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
  bool changed = true;
  setUp(() async {
    // Use `flutter test -j 1` command for testing
    await Isar.initializeIsarCore(download: true);
    storage.openDB(changed: changed);
  });
  group("characters", () {
    /// Check that ALL parts of character_entry.dart render and work
    for (Character character in characters) {
      /// Check that all fields render
      testWidgets("render character", (WidgetTester tester) async {
        await tester.pumpWidget(widget);
      });

      /// Test update the fields, check database
      testWidgets("title field", (WidgetTester widgetTester) async {});
      testWidgets("image field", (WidgetTester widgetTester) async {});
      testWidgets("hit field", (WidgetTester widgetTester) async {});
      testWidgets("miss field", (WidgetTester widgetTester) async {});
      testWidgets("color field", (WidgetTester widgetTester) async {});
      testWidgets("age field", (WidgetTester widgetTester) async {});
      testWidgets("description field", (WidgetTester widgetTester) async {});
    }
  });
  group("teams", () {
    /// Check that ALL parts of team_entry.dart render and work
    for (Team team in teams) {
      /// Check that all fields render
      testWidgets("render team", (WidgetTester tester) async {
        await tester.pumpWidget(widget);
      });

      /// Test update the fields, check database
      testWidgets("title field", (WidgetTester widgetTester) async {});
      testWidgets("image field", (WidgetTester widgetTester) async {});
      testWidgets("color field", (WidgetTester widgetTester) async {});
      testWidgets("description field", (WidgetTester widgetTester) async {});
    }
  });
  group("gamemodes", () {
    /// Check that ALL parts of gamemode_entry.dart render and work
    for (Gamemode gamemode in gamemodes) {
      /// Check that all fields render
      testWidgets("render gamemode", (WidgetTester tester) async {
        await tester.pumpWidget(widget);
      });

      /// Test update the fields, check database
      testWidgets("title field", (WidgetTester widgetTester) async {});
      testWidgets("teams field", (WidgetTester widgetTester) async {});

      /// TODO: generateSettingsWidgets
      testWidgets(
          "generateSettingsWidgets", (WidgetTester widgetTester) async {});
    }
  });
  group("programs", () {
    /// Check that ALL parts of program_entry.dart render and work
    for (Program program in programs) {
      /// Check that all fields render
      testWidgets("render program", (WidgetTester tester) async {
        await tester.pumpWidget(widget);
      });

      /// Test update the fields, check database
      testWidgets("title field", (WidgetTester widgetTester) async {});
      testWidgets("description field", (WidgetTester widgetTester) async {});

      testWidgets("image field", (WidgetTester widgetTester) async {});
      testWidgets("script field", (WidgetTester widgetTester) async {});
      // TODO: generateSettingsWidgets()
      testWidgets(
          "generateSettingsWidgets()", (WidgetTester widgetTester) async {});
    }
  });
}
