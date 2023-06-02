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
  group("victory view", () {
    /// Check that ALL parts of app_settings.dart render and work
    testWidgets("render victory view; team", (WidgetTester tester) async {
      await tester.pumpWidget(widget);

      /// Check that all parts render
    });
    testWidgets("render victory view; solo", (WidgetTester tester) async {
      await tester.pumpWidget(widget);

      /// Check that all parts render
    });
  });
}
