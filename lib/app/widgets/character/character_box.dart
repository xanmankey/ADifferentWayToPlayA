import 'dart:io';
import 'package:flutter/material.dart';

import 'package:adifferentwaytoplay/domain/entities/character.dart';
import 'package:adifferentwaytoplay/app/widgets/text.dart';

/// A widget that goes inside a horizontal list view in the
/// DWTP_view column; used for viewing and selecting a character.
/// ```
/// class CharacterBox extends StatelessWidget {
///   Character character;
///   CharacterBox({super.key, required this.character});
///
///   @override
///   Widget build(BuildContext context) {
///     return Column(
///       children: [
///         TextWidget(
///           text: character.name,
///         ),
///         Image(image: FileImage(File(character.image))),
///       ],
///     );
///   }
/// }
///
/// ```
///
class CharacterBox extends StatelessWidget {
  Character character;
  CharacterBox({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextWidget(
          text: character.name,
        ),
        Image(image: FileImage(File(character.image))),
      ],
    );
  }
}
