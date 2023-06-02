@Skip()

import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:adifferentwaytoplay/data/utils/utils.dart';

/// Testing the various different input_results
void main() async {
  // bool changed = true;
  // setUp(() async {
  //   // Use `flutter test -j 1` command for testing
  //   await Isar.initializeIsarCore(download: true);
  //   storage.openDB(changed: changed);
  // });
  /// TODO: may need to create some more fake data for this
  group("teams", () {
    /// Validate that the number of teams is rendered correctly
    testWidgets("num teams", (WidgetTester tester) {});

    /// Automated test reordering of teams
    testWidgets("reorder", (WidgetTester tester) {});
  });
  group("free for all", () {
    /// Validate that the number of teams is rendered correctly
    testWidgets("num players", (WidgetTester tester) {});

    /// Automated test reordering of players
    testWidgets("reorder", (WidgetTester tester) {});
  });
}
