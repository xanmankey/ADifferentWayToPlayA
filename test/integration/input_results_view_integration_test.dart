@Skip()

import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:adifferentwaytoplay/data/utils/utils.dart';

/// Testing the various different input_results
void main() async {
  bool changed = true;
  setUp(() async {
    // Use `flutter test -j 1` command for testing
    await Isar.initializeIsarCore(download: true);
    storage.openDB(changed: changed);
  });
  group("teams", () {
    /// Automated test reordering of teams; check new player score
    testWidgets("reorder and check score", (WidgetTester tester) {});
  });
  group("free for all", () {
    /// Automated test reordering of players; check new player score
    testWidgets("reorder and check score", (WidgetTester tester) {});
  });
}
