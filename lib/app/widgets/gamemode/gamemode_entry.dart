// A widget for structuring entries in the character gallery
import 'package:adifferentwaytoplay/domain/entities/gamemode.dart';
import 'package:adifferentwaytoplay/domain/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:adifferentwaytoplay/app/utils/utils.dart';

class GamemodeEntry extends StatefulWidget {
  // Becomes a character creator if a character isn't specified
  Gamemode? gamemode;
  GamemodeEntry({super.key, this.gamemode});

  @override
  State<GamemodeEntry> createState() => _GamemodeEntryState();
}

class _GamemodeEntryState extends State<GamemodeEntry> {
  final TextEditingController titleController = TextEditingController();
  late bool creation;
  List<Widget> buttonWidgets = [];
  List<Widget> triggerWidgets = [];
  List<Widget> stickWidgets = [];
  List<Widget> otherWidgets = [];

  @override
  void initState() async {
    if (widget.gamemode != null) {
      titleController.text = widget.gamemode!.name;
      creation = false;
    } else {
      creation = true;
      widget.gamemode = Gamemode();
    }
    Map<String, List<Widget>> settingsWidgets =
        sortByInputType(widget.gamemode!.settings.toList());
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
