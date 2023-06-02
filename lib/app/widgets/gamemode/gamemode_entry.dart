import 'package:adifferentwaytoplay/app/widgets/utility/text.dart';
import 'package:adifferentwaytoplay/data/utils/utils.dart';
import 'package:adifferentwaytoplay/domain/entities/setting.dart';
import 'package:flutter/material.dart';

import 'package:adifferentwaytoplay/domain/entities/gamemode.dart';
import 'package:adifferentwaytoplay/domain/utils/utils.dart';
import 'package:adifferentwaytoplay/app/utils/utils.dart';

/// A stateful widget for displaying a gamemode in PageView format as
/// specified by DWTP_view.dart
/// ```
///
/// ```
class GamemodeEntry extends StatefulWidget {
  Gamemode gamemode;
  GamemodeEntry({super.key, required this.gamemode});

  @override
  State<GamemodeEntry> createState() => _GamemodeEntryState();
}

class _GamemodeEntryState extends State<GamemodeEntry> {
  final TextEditingController titleController = TextEditingController();

  @override
  void initState() {
    titleController.text = widget.gamemode.name;
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
            widget.gamemode.name = titleController.text;
            await storage.isarDB.gamemodes.put(widget.gamemode);
          },
        ),
        Row(
          children: [
            (widget.gamemode.teams == true)
                ? const TextWidget(
                    text: "TEAMS",
                  )
                : (widget.gamemode.teams == false)
                    ? const TextWidget(
                        text: "SOLO",
                      )
                    : const TextWidget(
                        text: "RANDOM",
                      ),
            TextWidget(text: '${widget.gamemode.timesPlayed}'),
          ],
        ),
        // Generate and render desired settingsWidgets
        for (Widget widget
            in generateSettingsWidgets(widget.gamemode.settings.toList()))
          widget
      ],
    );
  }
}
