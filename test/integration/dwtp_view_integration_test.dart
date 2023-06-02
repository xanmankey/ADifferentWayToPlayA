@Skip()

import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:adifferentwaytoplay/data/utils/utils.dart';
import 'package:integration_test/integration_test.dart';

/// Testing the various different dwtp_view_test.dart
void main() async {
  bool changed = true;
  setUp(() async {
    // Use `flutter test -j 1` command for testing
    await Isar.initializeIsarCore(download: true);
    storage.openDB(changed: changed);
  });
  group("add/remove players", () {
    testWidgets("1-2 players", (WidgetTester tester) {});

    /// Recall that through event listening players are automatically
    /// added on controller input on the dwtp_view.dart screen, but
    /// they need to be removed manually I believe (not sure what functionality
    /// the library supports for this)
    testWidgets("2-1 players", (WidgetTester tester) {});
    testWidgets("3-4 players", (WidgetTester tester) {});
  });

  /// Check that when gamemodes are changed that rendering is handled correctly
  testWidgets("change gamemode", (WidgetTester widgetTester) {
    /// Check that a 1v3 situation renders correctly (color, position, etc)

    /// Check that a 2v2 situation renders correctly

    /// Check that a free for all renders correctly
  });

  /// Check that when player changes occur, rendering and
  /// setup is handled correctly
  testWidgets("player variations", (WidgetTester widgetTester) {
    /// Check that ready button appears when everyone is readied up

    /// Check that ready button disappears if someone toggles ready off

    /// Check that individual settings for certain Programs disables a Player's
    /// ready button

    /// Check that a lack of selection of a character, program, or team(?)
    /// disables a Player's ready button
  });
}
