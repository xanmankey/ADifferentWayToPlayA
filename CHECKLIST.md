# Roadmap and TODOs
> If I approach this, code that I haven't examined in a while, without a plan, it's like trying to find a friend when you only know the city they live in. I have to approach this carefully and intelligently, with psuedocode and planning playing pivotal roles in the development process!

GOAL
- Save the project through simplification and organization
- What this project really needs is testing and usage; for that a first version needs to be finished and usable, and it can be refactored from there

PRIORITY TODO
- [ ] How can I move forward without a solid plan for controller-style navigation? GitHub seems to suggest a plugin for the WinRT API, but I can't find information about this...

KEY
ℹ️: to be implemented at a later date

DOMAIN
- [ ] main.dart
/entities
- [x] character.dart
- [x] gamemode.dart
- [x] gamepad.dart
- [x] player.dart
- [x] program.dart
- [x] team.dart
- [ ] test whether Object type is a suitable replacement for prior SettingsSchema (right now I'm assuming it is; that could be a dangerous assumption)

/utils
- [x] utils.dart

- [ ] Updated documentation and tests

DATA
- [ ] utils.dart is technically functional, but the implementation I currently have feels a bit choppy/rough, as it limits a lot of isar's functionality and goes against recommended dev practices
(I'll leave for now, but if it ends up requiring refactoring, that's something I might look into)
- [x] vars.dart is mostly done as of the time being; the only thing that might be added is further enums for further consistency when working w/ mapValues

- [ ] Updated documentation and tests

APP
/pages
- [ ] app_settings.dart (build)
- [ ] victory_screen.dart (build)
- [ ] DWTP_view.dart (build)
- [ ] Updated documentation and tests
/utils
- [ ] constants.dart (UI_Constants)
- [ ] utils.dart (generateSettingsWidgets)
- [ ] ℹ️: controllers.dart (registering and retrieving inputs from USB-HID devices)
/widgets
- [x] character_entry, program_entry, gamemode_entry, team_entry
- [ ] individual gamemode and program options to satisfy the gamemodeOptions and programOptions of the GamemodeSchema and ProgramSchema respectively
- [ ] review gamemode_selector (page view might be implemented incorrectly)
- [ ] refactor and change setting (now utility) widgets; the purpose of these now is to make code more readable and make working with the code easier. Not all of these are implemented (and not all of these NEED to be implemented), so take a close look here!

TESTS
- [ ] Still have to FIGURE OUT what KIND of tests I need 
(and for what code!)
/app
- [ ]
/data
- [ ]

PYTHON
Scripts
- [ ] MIOP
- [ ] TC
- [ ] FC
- [ ] RC
- [ ] DC (optionally?)
- [ ] A main entry point and organizer for the scripts; also serves to streamline the process for creating new scripts
- [ ] A dart wrapper? Looking into the library to call the file...

