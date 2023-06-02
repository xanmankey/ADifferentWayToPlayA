@Skip()

import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:adifferentwaytoplay/data/utils/utils.dart';
import 'package:integration_test/integration_test.dart';
// https://docs.flutter.dev/cookbook/testing/integration/introduction

/// Testing the various different data_page_views
/// A variety of tests are used, from data testing,
/// render testing, etc
void main() async {
  // bool changed = true;
  // setUp(() async {
  //   // Use `flutter test -j 1` command for testing
  //   await Isar.initializeIsarCore(download: true);
  //   storage.openDB(changed: changed);
  // });
  group("characters", () {
    /// Ensure navigation to the right entry (if it exists) works
    testWidgets("traverse right (test 1 to 2)", (WidgetTester tester) {});

    /// Ensure navigation to the left entry (if it exists) works
    testWidgets("traverse left", (WidgetTester tester) {});

    /// Test navigating w/ rightmost edge case
    testWidgets("navigate right extreme", (WidgetTester tester) {});

    /// Test navigating w/ leftmost edge case
    testWidgets("navigate left extreme", (WidgetTester tester) {});

    /// Search by index
    testWidgets("Search by name", (WidgetTester tester) {});
  });
  group("teams", () {
    /// Ensure navigation to the right entry (if it exists) works
    testWidgets("traverse right", (WidgetTester tester) {});

    /// Ensure navigation to the left entry (if it exists) works
    testWidgets("traverse left", (WidgetTester tester) {});

    /// Test navigating w/ rightmost edge case
    testWidgets("navigate right extreme", (WidgetTester tester) {});

    /// Test navigating w/ leftmost edge case
    testWidgets("navigate left extreme", (WidgetTester tester) {});

    /// Search by index
    testWidgets("Search by name", (WidgetTester tester) {});
  });
  group("gamemodes", () {
    /// Ensure navigation to the right entry (if it exists) works
    testWidgets("traverse right", (WidgetTester tester) {});

    /// Ensure navigation to the left entry (if it exists) works
    testWidgets("traverse left", (WidgetTester tester) {});

    /// Test navigating w/ rightmost edge case
    testWidgets("navigate right extreme", (WidgetTester tester) {});

    /// Test navigating w/ leftmost edge case
    testWidgets("navigate left extreme", (WidgetTester tester) {});

    /// Search by index
    testWidgets("Search by name", (WidgetTester tester) {});
  });
  group("programs", () {
    /// Ensure navigation to the right entry (if it exists) works
    testWidgets("traverse right", (WidgetTester tester) {});

    /// Ensure navigation to the left entry (if it exists) works
    testWidgets("traverse left", (WidgetTester tester) {});

    /// Test navigating w/ rightmost edge case
    testWidgets("navigate right extreme", (WidgetTester tester) {});

    /// Test navigating w/ leftmost edge case
    testWidgets("navigate left extreme", (WidgetTester tester) {});

    /// Search by index
    testWidgets("Search by abbreviation", (WidgetTester tester) {});
  });
}
