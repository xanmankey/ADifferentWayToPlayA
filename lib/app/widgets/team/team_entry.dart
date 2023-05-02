// A widget for structuring entries in the character gallery
import 'dart:io';

import 'package:adifferentwaytoplay/data/utils/utils.dart';
import 'package:adifferentwaytoplay/domain/entities/team.dart';
import 'package:adifferentwaytoplay/app/widgets/utility/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';

/// Outlines the structure for what an entry in the
/// Gallery of Teams will look like
/// Can also be used as a team creator or editor
/// ```
///
/// ```
class TeamEntry extends StatefulWidget {
  Team? team;
  TeamEntry({super.key, this.team});

  @override
  State<TeamEntry> createState() => _TeamEntryState();
}

class _TeamEntryState extends State<TeamEntry> {
  final TextEditingController hitController = TextEditingController();
  final TextEditingController missController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  late bool creation;

  @override
  void initState() {
    if (widget.team != null) {
      titleController.text = widget.team!.name;
      descriptionController.text = widget.team!.description ?? '';
      creation = false;
    } else {
      creation = true;
      widget.team = Team();
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
            widget.team!.name = titleController.text;
            await storage.updateTeams([widget.team!]);
          },
        ),
        (creation)
            ? GestureDetector(
                child: Image(image: FileImage(File(widget.team!.logo))),
                onTap: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(type: FileType.image);
                  if (result != null) {
                    setState(() {
                      widget.team!.logo = result.files.single.path!;
                    });
                    await storage.updateTeams([widget.team!]);
                  }
                },
              )
            : GestureDetector(
                child: const Icon(Icons.image),
                onTap: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(type: FileType.image);
                  if (result != null) {
                    setState(
                      () {
                        widget.team!.logo = result.files.single.path!;
                      },
                    );
                    await storage.updateTeams([widget.team!]);
                  }
                },
              ),
        Row(
          children: [
            GestureDetector(
              child: Container(
                width: 16,
                height: 16,
                color: (creation)
                    ? Color(widget.team!.color)
                    : const Color(0x00FFFFFF),
              ),
              onTap: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Pick a color!'),
                  content: SingleChildScrollView(
                    child: ColorPicker(
                      pickerColor: (creation)
                          ? Color(widget.team!.color)
                          : const Color(0x00FFFFFF),
                      onColorChanged: ((color) => (() async {
                            widget.team!.color = color.value;
                            await storage.updateTeams([widget.team!]);
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
            TextWidget(
              text: '${widget.team!.matchesPlayed}',
            ),
            TextWidget(text: '${widget.team!.matchesWon}'),
          ],
        ),
        Row(
          children: [
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
                widget.team!.description = descriptionController.text;
                await storage.updateTeams([widget.team!]);
              },
            ),
          ],
        ),
      ],
    );
  }
}
