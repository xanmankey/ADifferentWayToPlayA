@Skip()

import 'package:adifferentwaytoplay/data/utils/initial_vars.dart';
import 'package:adifferentwaytoplay/domain/entities/player.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:adifferentwaytoplay/data/utils/utils.dart';

/// Testing the various different dwtp_view_test.dart
void main() async {
  // bool changed = true;
  // setUp(() async {
  //   // Use `flutter test -j 1` command for testing
  //   await Isar.initializeIsarCore(download: true);
  //   storage.openDB(changed: changed);
  // });
  List<Player> teamPlayers = testPlayers.sublist(0, 4);
  List<Player> soloPlayers = testPlayers.sublist(4);
  for (Player player in teamPlayers) {
    /// Check that all parts render
    testWidgets("render player column", (WidgetTester tester) async {
      await tester.pumpWidget(widget);
    });

    /// Test the parts
    /// Remember that widget tests are simpler; in this case,
    /// it just considers changing and selecting options
    testWidgets("program", (WidgetTester tester) async {
      await tester.pumpWidget(widget);
    });
    testWidgets("character", (WidgetTester tester) async {
      await tester.pumpWidget(widget);
    });
    testWidgets("team", (WidgetTester tester) async {
      await tester.pumpWidget(widget);
    });
  }
  for (Player player in soloPlayers) {
    /// Check that all parts render
    testWidgets("render player column", (WidgetTester tester) async {
      await tester.pumpWidget(widget);
    });
  }
}
