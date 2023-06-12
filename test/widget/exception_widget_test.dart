@Skip()

import 'dart:io';

import 'package:adifferentwaytoplay/app/constants.dart';
import 'package:adifferentwaytoplay/app/pages/exception_view.dart';
import 'package:adifferentwaytoplay/app/widgets/utility/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:adifferentwaytoplay/data/utils/utils.dart';

/// Testing the various different data_page_views
/// A variety of tests are used, from data testing,
/// render testing, etc
void main() {
  /// Tests if the renderException function works correctly
  testWidgets("test renderException", (WidgetTester tester) async {
    await tester.pumpWidget(ExceptionPage(
      error: "This is a horrible error, the worst the world has ever seen!!!",
      stacktrace: 'This is a great stacktrace',
    ));

    /// Check that all fields render
    /// NOTE: Only tests for DEFAULT (initially defined) settings
    /// unless otherwise specified.
    /// This is the case for all widgets generated via generateSettingsWidgets
    expect(
        find.byWidgetPredicate((Widget widget) =>
            widget is TextWidget && widget.text == "Sorry, that's an error!"),
        findsOneWidget);
    expect(
        find.byWidgetPredicate((Widget widget) =>
            widget is TextWidget &&
            widget.text ==
                'Error: "This is a horrible error, the worst the world has ever seen!!!", Stacktrace: This is a great stacktrace'),
        findsOneWidget);

    /// Something I was struggling with was whether I should write tests for
    /// finding specific widgets or not; after all, if I did, changing the codebase
    /// would require changing the tests. In the end, I decided I would write
    /// tests for the important widgets, it's important to be confident in my code
    /// regardless of environment. It adds more future testing work and makes refactoring
    /// slightly harder, but makes it easier to ensure consistency and I believe
    /// will be beneficial in the long run
    expect(
        find.byWidgetPredicate((Widget widget) =>
            widget is Image &&
            widget.image == FileImage(File(Assets.exception))),
        findsOneWidget);
  });
}
