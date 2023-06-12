@Skip()

import 'dart:io';

import 'package:adifferentwaytoplay/app/constants.dart';
import 'package:adifferentwaytoplay/app/pages/victory_view.dart';
import 'package:adifferentwaytoplay/app/widgets/character/character_column.dart';
import 'package:adifferentwaytoplay/app/widgets/team/team_column.dart';
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
  group("victory view", () {
    /// Check that ALL parts of app_settings.dart render and work
    testWidgets("render victory view; team", (WidgetTester tester) async {
      Team winningTeam = TeamData.teamApple;
      // TODO: set unique Navigator arguments for testing
      await tester.pumpWidget(const Victory());

      /// Check that all parts render
      expect(
          find.byWidgetPredicate(
            (Widget widget) =>
                widget is TeamColumn &&
                widget.teamName == winningTeam.name &&
                widget.teamImageFilePath == winningTeam.logo,
          ),
          findsOneWidget);
      expect(
          find.byWidgetPredicate((Widget widget) =>
              widget is Image &&
              widget.image == FileImage(File(Assets.trophy))),
          findsOneWidget);
    });
    testWidgets("render victory view; solo", (WidgetTester tester) async {
      Character winningCharacter = CharacterData.appleKid;
      // TODO: set unique Navigator arguments for testing
      await tester.pumpWidget(const Victory());

      /// Check that all parts render
      expect(
          find.byWidgetPredicate(
            (Widget widget) =>
                widget is CharacterColumn &&
                widget.characterName == winningCharacter.name &&
                widget.characterFilePath == winningCharacter.image,
          ),
          findsOneWidget);
      expect(
          find.byWidgetPredicate((Widget widget) =>
              widget is Image &&
              widget.image == FileImage(File(Assets.trophy))),
          findsOneWidget);
    });
  });
}
