@Skip()

import 'package:adifferentwaytoplay/app/pages/app_settings.dart';
import 'package:adifferentwaytoplay/app/widgets/utility/settings_dropdown.dart';
import 'package:adifferentwaytoplay/app/widgets/utility/text.dart';
import 'package:adifferentwaytoplay/data/utils/initial_vars.dart';
import 'package:adifferentwaytoplay/domain/entities/character.dart';
import 'package:adifferentwaytoplay/domain/entities/gamemode.dart';
import 'package:adifferentwaytoplay/domain/entities/program.dart';
import 'package:adifferentwaytoplay/domain/entities/setting.dart';
import 'package:adifferentwaytoplay/domain/entities/team.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:adifferentwaytoplay/data/utils/utils.dart';

/// Testing the various different data_page_views
/// A variety of tests are used, from data testing,
/// render testing, etc
void main() {
  setUp(() async {
    await Isar.initializeIsarCore(download: true);
    storage.openDB();
  });
  group("app settings", () {
    /// Check that ALL parts of app_settings.dart render and work
    testWidgets("render appSettings", (WidgetTester tester) async {
      await tester.pumpWidget(const AppSettings());

      /// Check that all fields render
      /// NOTE: Only tests for DEFAULT (initially defined) settings
      /// unless otherwise specified.
      /// This is the case for all widgets generated via generateSettingsWidgets
      expect(
          find.byWidgetPredicate((Widget widget) =>
              widget is SettingsDropdown &&
              widget.setting == DWTPSettings.theme),
          findsAtLeastNWidgets(1));
      expect(
          find.byWidgetPredicate((Widget widget) =>
              widget is TextWidget &&
              widget.text == "Settings" &&
              widget.fontSize == 60),
          findsOneWidget);
      expect(find.byWidgetPredicate((Widget widget) => widget is Center),
          findsAtLeastNWidgets(1));
    });
  });
}
