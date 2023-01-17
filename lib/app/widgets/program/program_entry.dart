// A widget for structuring entries in the character gallery
import 'dart:io';

import 'package:adifferentwaytoplay/app/utils/utils.dart';
import 'package:adifferentwaytoplay/app/widgets/custom_text_input.dart';
import 'package:adifferentwaytoplay/domain/entities/program.dart';
import 'package:adifferentwaytoplay/app/widgets/text.dart';
import 'package:adifferentwaytoplay/domain/entities/settings.dart';
import 'package:adifferentwaytoplay/domain/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';

class ProgramEntry extends StatefulWidget {
  // Becomes a character creator if a character isn't specified
  Program? program;
  ProgramEntry({super.key, this.program});

  @override
  State<ProgramEntry> createState() => _ProgramEntryState();
}

class _ProgramEntryState extends State<ProgramEntry> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController scriptController = TextEditingController();
  late bool creation;
  List<Widget> buttonWidgets = [];
  List<Widget> triggerWidgets = [];
  List<Widget> stickWidgets = [];
  List<Widget> otherWidgets = [];

  @override
  void initState() async {
    if (widget.program != null) {
      titleController.text = widget.program!.name;
      descriptionController.text = widget.program!.description ?? '';
      if (await Directory(widget.program!.script).exists()) {
        scriptController.text = widget.program!.script;
      }
      creation = false;
    } else {
      creation = true;
      widget.program = Program();
    }
    Map<String, List<Widget>> settingsWidgets =
        sortByInputType(widget.program!.settings.toList());
    List<Widget> buttonWidgets = settingsWidgets['button'] ?? [];
    List<Widget> triggerWidgets = settingsWidgets['trigger'] ?? [];
    List<Widget> stickWidgets = settingsWidgets['stick'] ?? [];
    List<Widget> otherWidgets = settingsWidgets['other'] ?? [];
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
        ),
        (creation)
            ? GestureDetector(
                child: Image(image: FileImage(File(widget.program!.image))),
                onTap: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(type: FileType.image);
                  if (result != null) {
                    setState(() {
                      widget.program!.image = result.files.single.path!;
                    });
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
                      widget.program!.image = result.files.single.path!;
                    });
                  }
                },
              ),
        Row(
          children: [
            ListView(
              children: [for (Widget widget in buttonWidgets) widget],
            ),
            ListView(
              children: [for (Widget widget in triggerWidgets) widget],
            ),
            ListView(
              children: [for (Widget widget in stickWidgets) widget],
            ),
            ListView(
              children: [for (Widget widget in otherWidgets) widget],
            )
          ],
        ),
      ],
    );
  }
}
