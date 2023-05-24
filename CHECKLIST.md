# Roadmap and TODOs
> If I approach this, code that I haven't examined in a while, without a plan, it's like trying to find a friend when you only know the city they live in. I have to approach this carefully and intelligently, with psuedocode and planning playing pivotal roles in the development process!

TODAY GOALS
- TESTS!!! Once tests are done, then I can rework Provider and fix the stuff that needs to be fixed, but the tests should make the whole work experience a lot nicer
- Rework Provider
- Run, debug (I'm sure everything will break); writing tests should honestly be your debugging though
- Explore Python w/ Terry
- Rework freezed + FutureBuilders? A lot of this has too much complexity to manage IMO

CURRENT TODO
- Figure out inputs + adding players, freezed/exposed data types, and need to do a lot of testing to weed out logic and implementation issues
- See question/concerns for my plan for handling inputs; I'm not going to do another GitHub push until I handle inputs like so

OPTIMIZATIONS
- Wasn't using provider correctly (whoops); if I want to optimize the number of rebuilds, I should create more providers (not just one DWTPProvider...); I also could potentially add a list of teams in provider to make things a little simpler

QUESTIONS/CONCERNS
- Hopefully the player columns rebuild state appropriately
- The current plan for inputs is to use the XInput_gamepad library to handle set up in the app and then use python + Vgamepad to appropriately create and use emulated controllers.
    - For simplicity's sake, the controllers can ONLY be used on specific screens. Because they have limited use in the GUI, 
I'm going to go with an event-based solution; I would need to detect if something is being SELECTED by the controller and if the A or B buttons are being pressed. That means ALL the selectors would need to somehow handle controller input, in addition to dynamically adding players based on pressing buttons on the DWTP_view.dart screen... 
    - I wonder if there's a way I can dynamically change the subscribers of the event stream; then I could only subscribe the currently selected listener. I think that's my best bet! Continue looking into this idea here: https://api.flutter.dev/flutter/dart-html/Events-class.html
- Not sure how I'm going to bundle or handle the python part of this; I'm going to look into external dependencies for flutter projects.

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
- [x] settings.dart

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
- [ ] tournament_bracket.dart (FUTURE)
- [ ] tournament_setup.dart (FUTURE)
- [ ] Updated documentation and tests
/utils
- [ ] constants.dart (UI_Constants)
- [ ] utils.dart (generateSettingsWidgets)
- [ ] ℹ️: controllers.dart (registering and retrieving inputs from USB-HID devices)
/widgets
- [x] character_entry, program_entry, gamemode_entry, team_entry
- [ ] individual gamemode and program options to satisfy the gamemodeOptions and programOptions of the GamemodeSchema and ProgramSchema respectively
- [ ] review gamemode_selector (page view might be implemented incorrectly)
- [x] refactor and change setting (now utility) widgets; the purpose of these now is to make code more readable and make working with the code easier. Not all of these are implemented (and not all of these NEED to be implemented), so take a close look here!

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
- [ ] A main entry point and organizer for the scripts; also serves to streamline the process for creating new scripts
- [ ] Calling python scripts from dart...
- [ ] DC (FUTURE)

