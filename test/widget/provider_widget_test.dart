@Skip()

import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:adifferentwaytoplay/data/utils/utils.dart';

/// Testing the various different providers used
/// for state management throughout the app
void main() async {
  // bool changed = true;
  // setUp(() async {
  //   // Use `flutter test -j 1` command for testing
  //   await Isar.initializeIsarCore(download: true);
  //   storage.openDB(changed: changed);
  // });
  group("dwtp", () {
    /// dwtp_view.dart; test updating gamemode (update gamemode selector)
    testWidgets("gamemode", (WidgetTester tester) {});

    /// dwtp_view.dart: test updating gamepads (add/remove player?)
    testWidgets("gamepads", (WidgetTester tester) {});

    /// dwtp_view.dart: test updating players (add/remove player?)
    testWidgets("players", (WidgetTester tester) {});

    /// dwtp_view.dart: test updating ready (show ready button)
    testWidgets("ready", (WidgetTester tester) {});

    /// dwtp_view.dart-input_results_view: test updating gameplay
    /// (navigation to input_results_view.dart)
    testWidgets("gameplay", (WidgetTester tester) {});

    /// dwtp_view.dart: test updating numPlayers (ensure player column = numPlayers)
    testWidgets("numPlayers", (WidgetTester tester) {});

    /// dwtp_view.dart: test updating cursors (new cursor position)
    testWidgets("cursors", (WidgetTester tester) {});
  });
  group("app settings", () {
    /// Test updating the app theme
    testWidgets("theme", (WidgetTester tester) {});
  });
  group("events", () {
    /// Test valid select event
    testWidgets("select", (WidgetTester tester) {});

    /// Test invalid (cursor not over anything selectable) select event
    testWidgets("select", (WidgetTester tester) {});

    /// Test back event
    testWidgets("back", (WidgetTester tester) {});
  });
}
