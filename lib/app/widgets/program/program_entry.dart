// A widget for structuring entries in the character gallery
import 'dart:io';

import 'package:adifferentwaytoplay/app/pages/exception_view.dart';
import 'package:adifferentwaytoplay/app/widgets/utility/text.dart';
import 'package:adifferentwaytoplay/data/utils/utils.dart';
import 'package:adifferentwaytoplay/domain/entities/program.dart';
import 'package:adifferentwaytoplay/domain/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class ProgramEntry extends StatefulWidget {
  Program program;
  ProgramEntry({super.key, required this.program});

  @override
  State<ProgramEntry> createState() => _ProgramEntryState();
}

class _ProgramEntryState extends State<ProgramEntry> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  // The script must be a valid path
  final TextEditingController scriptController = TextEditingController();
  final TextEditingController scoreController = TextEditingController();
  late Future<List<Program?>?>? programFuture;

  @override
  void initState() {
    titleController.text = widget.program.name;
    descriptionController.text = widget.program.description ?? '';
    // The script must exist; if it does not, the program is disabled by default
    if ((Directory(widget.program.script).existsSync()) &&
        (widget.program.script.contains(".py"))) {
      scriptController.text = widget.program.script;
    } else {
      widget.program.enabled = false;
      programFuture = storage.updatePrograms([widget.program]);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget programEntryBuildCode = Column(
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
            widget.program.name = titleController.text;
            await storage.updatePrograms([widget.program]);
          },
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
            widget.program.description = descriptionController.text;
            await storage.updatePrograms([widget.program]);
          },
        ),
        GestureDetector(
          child: const Icon(Icons.image),
          onTap: () async {
            FilePickerResult? result =
                await FilePicker.platform.pickFiles(type: FileType.image);
            if (result != null) {
              setState(() {
                widget.program.image = result.files.single.path!;
              });
              await storage.updatePrograms([widget.program]);
            }
          },
        ),
        Row(
          children: [
            GestureDetector(
              child: TextWidget(text: widget.program.script),
              onTap: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                    type: FileType.custom, allowedExtensions: ['.py']);
                if (result != null) {
                  setState(() {
                    widget.program.script = result.files.single.path!;
                  });
                  await storage.updatePrograms([widget.program]);
                }
              },
            ),
          ],
        ),
        widget.program.programOptions.toWidget(),
      ],
    );

    return (programFuture != null)
        ? FutureBuilder(
            future: programFuture,
            builder: (context, snapshot) => (snapshot.hasData)
                ? programEntryBuildCode
                : (snapshot.hasError)
                    ? ExceptionWidget(error: snapshot.error.toString())
                    : const CircularProgressIndicator(),
          )
        : programEntryBuildCode;
  }
}
