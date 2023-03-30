// A widget for structuring entries in the character gallery
import 'dart:io';
import 'package:adifferentwaytoplay/data/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';

import 'package:adifferentwaytoplay/domain/entities/character.dart';
import 'package:adifferentwaytoplay/app/widgets/text.dart';

/// A stateful widget for displaying a character in PageView format as
/// specified by DWTP_view.dart. Doubles as a character creator if one
/// isn't specified or a character editor via the UI.
/// ```
///
/// ```
class CharacterEntry extends StatefulWidget {
  Character? character;
  CharacterEntry({super.key, this.character});

  @override
  State<CharacterEntry> createState() => _CharacterEntryState();
}

class _CharacterEntryState extends State<CharacterEntry> {
  final TextEditingController hitController = TextEditingController();
  final TextEditingController missController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  late bool creation;

  @override
  void initState() {
    if (widget.character != null) {
      hitController.text = widget.character!.hit ?? '';
      missController.text = widget.character!.miss ?? '';
      titleController.text = widget.character!.name;
      descriptionController.text = widget.character!.description ?? '';
      ageController.text = '${widget.character!.age ?? ''}';
      creation = false;
    } else {
      creation = true;
      widget.character = Character();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: titleController,
          decoration: const InputDecoration(
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          onEditingComplete: () async {
            widget.character!.name = titleController.text;
            await storage.updateCharacters([widget.character!]);
          },
        ),
        (creation)
            ? GestureDetector(
                child: Image(image: FileImage(File(widget.character!.image))),
                onTap: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(type: FileType.image);
                  if (result != null) {
                    setState(() {
                      widget.character!.image = result.files.single.path!;
                    });
                    await storage.updateCharacters([widget.character!]);
                  }
                },
              )
            : GestureDetector(
                child: const Icon(Icons.image),
                onTap: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(type: FileType.image);
                  if (result != null) {
                    setState(() {
                      widget.character!.image = result.files.single.path!;
                    });
                    await storage.updateCharacters([widget.character!]);
                  }
                },
              ),
        Row(
          children: [
            TextField(
              controller: hitController,
              decoration: const InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: "Hit",
              ),
              onEditingComplete: () async {
                widget.character!.hit = hitController.text;
                await storage.updateCharacters([widget.character!]);
              },
            ),
            TextField(
              controller: missController,
              decoration: const InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: "Miss",
              ),
              onEditingComplete: () async {
                widget.character!.miss = missController.text;
                await storage.updateCharacters([widget.character!]);
              },
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              child: Container(
                width: 16,
                height: 16,
                color: (creation)
                    ? Color(widget.character!.color ?? 0x00FFFFFF)
                    : const Color(0x00FFFFFF),
              ),
              onTap: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Pick a color!'),
                  content: SingleChildScrollView(
                    child: ColorPicker(
                      pickerColor: (creation)
                          ? Color(widget.character!.color ?? 0x00FFFFFF)
                          : const Color(0x00FFFFFF),
                      onColorChanged: ((color) => (() async {
                            widget.character!.color = color.value;
                            await storage.updateCharacters([widget.character!]);
                          })),
                    ),
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                      child: const Text('Got it'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: "Age",
              ),
              onEditingComplete: () async {
                widget.character!.age = int.parse(ageController.text);
                await storage.updateCharacters([widget.character!]);
              },
            ),
            TextWidget(
              text: '${widget.character!.matchesPlayed}',
            ),
            TextWidget(text: '${widget.character!.matchesWon}'),
          ],
        ),
        TextField(
          controller: descriptionController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: "Description",
          ),
          onEditingComplete: () async {
            widget.character!.description = descriptionController.text;
            await storage.updateCharacters([widget.character!]);
          },
        ),
      ],
    );
  }
}
