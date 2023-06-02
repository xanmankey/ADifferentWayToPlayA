@Skip()

import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:adifferentwaytoplay/data/utils/utils.dart';

/// Testing the various different data_page_views
/// A variety of tests are used, from data testing,
/// render testing, etc
void main() async {
  bool changed = true;
  setUp(() async {
    // Use `flutter test -j 1` command for testing
    await Isar.initializeIsarCore(download: true);
    storage.openDB(changed: changed);
  });

  /// Tests if the renderException function works correctly
  testWidgets("test renderException", (WidgetTester widgetTester) => null);
}
