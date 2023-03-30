# Roadmap and TODOs
> If I approach this, code that I haven't examined in a while, without a plan, it's like trying to find a friend when you only know the city they live in. I have to approach this carefully and intelligently, with psuedocode and planning playing pivotal roles in the development process!

FIRST TODO (before continuing review)
- [ ] Implement a doc_generator (@generated_docs; generates a doc string 
above a notated widget or class of the notated widget or class)
(if I can't finish this in time but I can finish the doc generator, I'll use that as my CSP submission)

ORDER
The most logical order to review and work on my app is to start by reviewing 
the whole thing before doing anything, then to work from the entities (core) upward

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
- [ ] test whether Object type is a suitable replacement for prior SettingsSchema

/utils
- [x] utils.dart

- [ ] Updated documentation and tests

DATA
- [ ] utils.dart is technically functional, but the implementation I currently have feels a bit choppy/rough, as it limits a lot of isar's functionality and goes against recommended dev practices
- [ ] vars.dart needs A LOT of renaming and refactoring; this is something that can wait until I want to start running tests

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

