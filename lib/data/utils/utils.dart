import 'package:adifferentwaytoplay/data/utils/initial_vars.dart';
import 'package:adifferentwaytoplay/domain/utils/utils.dart';
import 'package:flython/flython.dart';
import 'package:isar/isar.dart';
import 'dart:io';
import 'package:adifferentwaytoplay/domain/entities/gamepad.dart';
import 'package:adifferentwaytoplay/domain/entities/player.dart';
import 'package:adifferentwaytoplay/domain/entities/character.dart';
import 'package:adifferentwaytoplay/domain/entities/program.dart';
import 'package:adifferentwaytoplay/domain/entities/gamemode.dart';
import 'package:adifferentwaytoplay/domain/entities/team.dart';
import 'package:logging/logging.dart';

// A simple class for getting the current instance of Isar
// Or creating a new instance
class Storage {
  Logger logger = Logger("Data logger");
  late Future<Isar> isarDB;

  Storage() {
    isarDB = openDB();
  }

  Future<Isar> openDB() async {
    // Alternatively opens an Isar DB in test mode for testing purposes
    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      if (Isar.instanceNames.isEmpty) {
        // Create collection
        Isar isarDB = await Isar.open(
          [
            CharacterSchema,
            GamemodeSchema,
            GamepadSchema,
            PlayerSchema,
            ProgramSchema,
            TeamSchema,
          ],
          name: "test",
          inspector: true,
        );
        // Write test data if the database is empty
        await isarDB.writeTxn(() async {
          /// Default mock data is used for gamepads and players
          for (Character character in characters) {
            isarDB.characters.put(character);
          }
          // Write Gamepads
          for (Gamepad gamepad in testGamepads) {
            isarDB.gamepads.put(gamepad);
          }
          isarDB.programs.put(ProgramData.TC);
          isarDB.programs.put(ProgramData.RC);
          isarDB.programs.put(ProgramData.FC);
          // MIOP program (no settings)
          isarDB.programs.put(ProgramData.MIOP);
          // Write Teams
          for (Team team in teams) {
            isarDB.teams.put(team);
          }
          // Write Gamemode
          for (Gamemode gamemode in gamemodes) {
            isarDB.gamemodes.put(gamemode);
          }
          // Write Players
          int i = 0;
          for (Player player in testPlayers) {
            player.character.value = characters[i];
            player.gamepad.value = testGamepads[i];
            player.program.value = ProgramData.FC;
            if (i == 2) {
              player.program.value = ProgramData.RC;
            } else {
              player.team.value = teams[i];
            }
            isarDB.players.put(player);
            i++;
          }
        });
        return isarDB;
      }
      return Future.value(Isar.getInstance("test"));
    } else {
      if (Isar.instanceNames.isEmpty) {
        // Create collection
        // TODO: disable inspection once app is completed
        Isar isarDB = await Isar.open(
          [
            CharacterSchema,
            GamemodeSchema,
            GamepadSchema,
            PlayerSchema,
            ProgramSchema,
            TeamSchema,
          ],
          name: "real",
          inspector: true,
        );
        // Write initial data if the database is empty
        await isarDB.writeTxn(() async {
          /// Note that players and gamepads aren't written,
          /// because they haven't been initialized yet
          // Write Characters
          // The value of int.min just so happens to be the id of ALL my
          // characters; what significance does that have?
          // THE SIGNIFICANCE is that numerical values are used to replace
          // 'null' values in Isar, so Isar.autoIncrement = null
          print(Isar.autoIncrement);
          for (Character character in characters) {
            print(character.id);
            print(character.toString());
            await isarDB.characters.put(character);
          }
        });

        print('progress');
        await isarDB.writeTxn(() async {
          await isarDB.programs.put(ProgramData.TC);
          await isarDB.programs.put(ProgramData.RC);
          await isarDB.programs.put(ProgramData.FC);
          // MIOP program (no settings)
          await isarDB.programs.put(ProgramData.MIOP);
          // Write Teams
          for (Team team in teams) {
            await isarDB.teams.put(team);
          }
          // Write Gamemode
          for (Gamemode gamemode in gamemodes) {
            await isarDB.gamemodes.put(gamemode);
          }
        });
        return isarDB;
      }
      return Future.value(Isar.getInstance("real"));
    }
  }

  // Migrating ALL CRUD functions to one utility class
  /// Retrieve character by name, age, or color
  ///
  /// Each gallery has a 'by name' search bar w/ dropdown character selection
  Future<List<Character>> getCharacter(Map<String, dynamic> index) async {
    try {
      Isar db = await isarDB;
      switch (index.entries.first.key) {
        case "name":
          return await db.characters
              .filter()
              .nameStartsWith(index.entries.first.value)
              .findAll();
        case "age":
          return await db.characters
              .filter()
              .ageEqualTo(index.entries.first.value)
              .findAll();
        case "color":
          return await db.characters
              .filter()
              .colorEqualTo(index.entries.first.value)
              .findAll();
        default:
          return [];
      }
    } catch (e, stacktrace) {
      logger.warning("Whoops, that's an error! \n $e \n $stacktrace");
      return [];
    }
  }

  /// Returns a sorted list based on specified character indexes
  /// This is primarily a SORTING function
  ///
  /// In the GUI these are movable (orderable) checkboxes
  /// Maps have the index name and whether to sort increasing or decreasing
  /// (as well as intrinsically have an order property due to the list)
  Future<List<Character>> getCharacterList(
      List<Map<String, Sort>> indexes) async {
    try {
      Isar db = await isarDB;
      // Default case; sort by id
      if (indexes.isEmpty) {
        List<Character> characters = await db.characters.where().findAll();
        return characters;
      }
      // Building a dynamic query to execute based on the user sorting preferences
      List<SortProperty> sortProperties = [];
      for (Map<String, Sort> index in indexes) {
        switch (index.entries.first.key) {
          case "name":
            sortProperties.add(SortProperty(
                property: 'name', sort: index.entries.first.value));
            break;
          case "age":
            sortProperties.add(
                SortProperty(property: 'age', sort: index.entries.first.value));
            break;
          case "color":
            sortProperties.add(SortProperty(
                property: 'color', sort: index.entries.first.value));
            break;
          case "matchesPlayed":
            sortProperties.add(SortProperty(
                property: 'matchesPlayed', sort: index.entries.first.value));
            break;
          case "matchesWon":
            sortProperties.add(SortProperty(
                property: 'matchesWon', sort: index.entries.first.value));
            break;
        }
      }
      List<Character> characters = await db.characters
          .buildQuery<Character>(sortBy: sortProperties)
          .findAll();
      return characters;
    } catch (e, stacktrace) {
      logger.warning("Whoops, that's an error! \n $e \n $stacktrace");
      return [];
    }
  }

  /// Update all given characters
  Future<List<Character?>?> updateCharacters(List<Character> characters) async {
    try {
      Isar db = await isarDB;
      List<int> ids = await db.characters.putAll(characters);
      return await db.characters.getAll(ids);
    } catch (e, stacktrace) {
      logger.warning("Whoops, that's an error! \n $e \n $stacktrace");
      return null;
    }
  }

  /// Deletes all characters with the selected ids
  Future<int?> deleteCharacters(List<int> characterIds) async {
    try {
      Isar db = await isarDB;
      int numCharactersDeleted = await db.characters.deleteAll(characterIds);
      return numCharactersDeleted;
    } catch (e, stacktrace) {
      logger.warning("Whoops, that's an error! \n $e \n $stacktrace");
      return null;
    }
  }

  /// Retrieve gamemode by name index (maintains same structure
  /// to make it easy to add new indexes)
  Future<List<Gamemode>> getGamemode(Map<String, dynamic> index) async {
    try {
      Isar db = await isarDB;
      switch (index.entries.first.key) {
        case "name":
          return await db.gamemodes
              .filter()
              .nameStartsWith(index.entries.first.value)
              .findAll();
        default:
          return [];
      }
    } catch (e, stacktrace) {
      logger.warning("Whoops, that's an error! \n $e \n $stacktrace");
      return [];
    }
  }

  /// Returns a sorted list based on specified gamemode indexes
  Future<List<Gamemode>> getGamemodeList(
      List<Map<String, Sort>> indexes) async {
    try {
      Isar db = await isarDB;
      // Default case; sort by id
      if (indexes.isEmpty) {
        List<Gamemode> gamemodes = await db.gamemodes.where().findAll();
        return gamemodes;
      }
      // Building a dynamic query to execute based on the user sorting preferences
      List<SortProperty> sortProperties = [];
      for (Map<String, Sort> index in indexes) {
        switch (index.entries.first.key) {
          case "name":
            sortProperties.add(SortProperty(
                property: 'name', sort: index.entries.first.value));
            break;
          case "times played":
            sortProperties.add(SortProperty(
                property: 'timesPlayed', sort: index.entries.first.value));
            break;
        }
      }
      List<Gamemode> gamemodes = await db.gamemodes
          .buildQuery<Gamemode>(sortBy: sortProperties)
          .findAll();
      return gamemodes;
    } catch (e, stacktrace) {
      logger.warning("Whoops, that's an error! \n $e \n $stacktrace");
      return [];
    }
  }

  /// Update all given gamemodes
  Future<List<Gamemode?>?> updateGamemodes(List<Gamemode> gamemodes) async {
    try {
      Isar db = await isarDB;
      List<int> ids = await db.gamemodes.putAll(gamemodes);
      return await db.gamemodes.getAll(ids);
    } catch (e, stacktrace) {
      logger.warning("Whoops, that's an error! \n $e \n $stacktrace");
      return null;
    }
  }

  /// Deletes all gamemodes with the selected ids
  Future<int?> deleteGamemodes(List<int> gamemodeIds) async {
    try {
      Isar db = await isarDB;
      int numGamemodesDeleted = await db.gamemodes.deleteAll(gamemodeIds);
      return numGamemodesDeleted;
    } catch (e, stacktrace) {
      logger.warning("Whoops, that's an error! \n $e \n $stacktrace");
      return null;
    }
  }

  /// Retrieve gamepads by connected or color index
  Future<List<Gamepad>> getGamepad(Map<String, dynamic> index) async {
    try {
      Isar db = await isarDB;
      switch (index.entries.first.key) {
        case "connected":
          return await db.gamepads
              .filter()
              .connectedEqualTo(index.entries.first.value)
              .findAll();
        case "color":
          return await db.gamepads
              .filter()
              .colorEqualTo(index.entries.first.value)
              .findAll();
      }
      return [];
    } catch (e, stacktrace) {
      logger.warning("Whoops, that's an error! \n $e \n $stacktrace");
      return [];
    }
  }

  /// Returns a sorted list based on specified gamepad indexes
  Future<List<Gamepad>> getGamepadList(List<Map<String, Sort>> indexes) async {
    try {
      Isar db = await isarDB;
      // Default case; sort by id
      if (indexes.isEmpty) {
        List<Gamepad> gamepads = await db.gamepads.where().findAll();
        return gamepads;
      }
      // Building a dynamic query to execute based on the user sorting preferences
      List<SortProperty> sortProperties = [];
      for (Map<String, Sort> index in indexes) {
        switch (index.entries.first.key) {
          case "connected":
            sortProperties.add(SortProperty(
                property: 'connected', sort: index.entries.first.value));
            break;
          case "color":
            sortProperties.add(SortProperty(
                property: 'color', sort: index.entries.first.value));
            break;
        }
      }
      List<Gamepad> gamepads = await db.gamepads
          .buildQuery<Gamepad>(sortBy: sortProperties)
          .findAll();
      return gamepads;
    } catch (e, stacktrace) {
      logger.warning("Whoops, that's an error! \n $e \n $stacktrace");
      return [];
    }
  }

  /// Update all given gamepads
  Future<List<Gamepad?>?> updateGamepads(List<Gamepad> gamepads) async {
    try {
      Isar db = await isarDB;
      List<int> ids = await db.gamepads.putAll(gamepads);
      return await db.gamepads.getAll(ids);
    } catch (e, stacktrace) {
      logger.warning("Whoops, that's an error! \n $e \n $stacktrace");
      return null;
    }
  }

  /// Deletes all gamepads with the selected ids
  Future<int?> deleteGamepads(List<int> gamepadIds) async {
    try {
      Isar db = await isarDB;
      int numGamepadsDeleted = await db.gamepads.deleteAll(gamepadIds);
      return numGamepadsDeleted;
    } catch (e, stacktrace) {
      logger.warning("Whoops, that's an error! \n $e \n $stacktrace");
      return null;
    }
  }

  /// Retrieve player by gamepad index, character name, program abbreviation,
  /// team name, color, or score
  Future<List<Player>> getPlayer(Map<String, dynamic> index) async {
    try {
      Isar db = await isarDB;
      switch (index.entries.first.key) {
        case "character name":
          return await db.players.filter().character(((character) {
            return character.nameEqualTo(index.entries.first.value);
          })).findAll();
        case "index":
          return await db.players.filter().gamepad(((gamepad) {
            return gamepad.indexEqualTo(index.entries.first.value);
          })).findAll();
        case "abbreviation":
          return await db.players.filter().program(((program) {
            return program.abbreviationEqualTo(index.entries.first.value);
          })).findAll();
        case "teamName":
          return await db.players.filter().team(((team) {
            return team.nameEqualTo(index.entries.first.value);
          })).findAll();
        case "color":
          return await db.players
              .filter()
              .colorEqualTo(index.entries.first.value)
              .findAll();
        case "score":
          return await db.players
              .filter()
              .scoreEqualTo(index.entries.first.value)
              .findAll();
        default:
          return [];
      }
    } catch (e, stacktrace) {
      logger.warning("Whoops, that's an error! \n $e \n $stacktrace");
      return [];
    }
  }

  /// Returns a sorted list based on specified player indexes
  Future<List<Player>> getPlayerList(List<Map<String, Sort>> indexes) async {
    try {
      Isar db = await isarDB;
      // Default case; sort by id
      if (indexes.isEmpty) {
        List<Player> players = await db.players.where().findAll();
        return players;
      }
      // Building a dynamic query to execute based on the user sorting preferences
      // TODO: the issue w/ a dynamic query here is the SortProperty is a link...
      // 'name' itself is ambiguous; how would I do character.name or team.name
      // TODO: I used psuedocode for this, this implementation likely won't work
      List<SortProperty> sortProperties = [];
      for (Map<String, Sort> index in indexes) {
        switch (index.entries.first.key) {
          case "characterName":
            sortProperties.add(SortProperty(
                property: 'character.name', sort: index.entries.first.value));
            break;
          case "index":
            sortProperties.add(SortProperty(
                property: 'gamepad.index', sort: index.entries.first.value));
            break;
          case "abbreviation":
            sortProperties.add(SortProperty(
                property: 'program.abbreviation',
                sort: index.entries.first.value));
            break;
          case "teamName":
            sortProperties.add(SortProperty(
                property: 'team.name', sort: index.entries.first.value));
            break;
          case "color":
            sortProperties.add(SortProperty(
                property: 'color', sort: index.entries.first.value));
            break;
          case "score":
            sortProperties.add(SortProperty(
                property: 'score', sort: index.entries.first.value));
            break;
        }
      }
      List<Player> players =
          await db.players.buildQuery<Player>(sortBy: sortProperties).findAll();
      return players;
    } catch (e, stacktrace) {
      logger.warning("Whoops, that's an error! \n $e \n $stacktrace");
      return [];
    }
  }

  /// Update all given players
  Future<List<Player?>?> updatePlayers(List<Player> players) async {
    try {
      Isar db = await isarDB;
      List<int> ids = await db.players.putAll(players);
      return await db.players.getAll(ids);
    } catch (e, stacktrace) {
      logger.warning("Whoops, that's an error! \n $e \n $stacktrace");
      return null;
    }
  }

  /// Deletes all players with the selected ids
  Future<int?> deletePlayers(List<int> playerIds) async {
    try {
      Isar db = await isarDB;
      int numPlayersDeleted = await db.players.deleteAll(playerIds);
      return numPlayersDeleted;
    } catch (e, stacktrace) {
      logger.warning("Whoops, that's an error! \n $e \n $stacktrace");
      return null;
    }
  }

  /// Retrieve program by abbreviation index
  Future<List<Program>> getProgram(Map<String, dynamic> index) async {
    try {
      Isar db = await isarDB;
      switch (index.entries.first.key) {
        case "abbreviation":
          return await db.programs
              .filter()
              .nameStartsWith(index.entries.first.value)
              .findAll();
        default:
          return [];
      }
    } catch (e, stacktrace) {
      logger.warning("Whoops, that's an error! \n $e \n $stacktrace");
      return [];
    }
  }

  /// Returns a sorted list based on specified program indexes
  Future<List<Program>> getProgramList(List<Map<String, Sort>> indexes) async {
    try {
      Isar db = await isarDB;
      // Default case; sort by id
      if (indexes.isEmpty) {
        List<Program> programs = await db.programs.where().findAll();
        return programs;
      }
      // Building a dynamic query to execute based on the user sorting preferences
      List<SortProperty> sortProperties = [];
      for (Map<String, Sort> index in indexes) {
        switch (index.entries.first.key) {
          case "abbreviation":
            sortProperties.add(SortProperty(
                property: 'abbreviation', sort: index.entries.first.value));
            break;
          case "name":
            sortProperties.add(SortProperty(
                property: 'name', sort: index.entries.first.value));
            break;
        }
      }
      List<Program> programs = await db.programs
          .buildQuery<Program>(sortBy: sortProperties)
          .findAll();
      return programs;
    } catch (e, stacktrace) {
      logger.warning("Whoops, that's an error! \n $e \n $stacktrace");
      return [];
    }
  }

  /// Update all given programs
  Future<List<Program?>?> updatePrograms(List<Program> programs) async {
    try {
      Isar db = await isarDB;
      List<int> ids = await db.programs.putAll(programs);
      return await db.programs.getAll(ids);
    } catch (e, stacktrace) {
      logger.warning("Whoops, that's an error! \n $e \n $stacktrace");
      return null;
    }
  }

  /// Deletes all programs with the selected ids
  Future<int?> deletePrograms(List<int> programIds) async {
    try {
      Isar db = await isarDB;
      int numDeletedPrograms = await db.programs.deleteAll(programIds);
      return numDeletedPrograms;
    } catch (e, stacktrace) {
      logger.warning("Whoops, that's an error! \n $e \n $stacktrace");
      return null;
    }
  }

  /// Retrieve team by name, color, or score
  /// The score index is primarily for determining a winner
  Future<List<Team>> getTeam(Map<String, dynamic> index) async {
    try {
      Isar db = await isarDB;
      switch (index.entries.first.key) {
        case "name":
          return await db.teams
              .filter()
              .nameStartsWith(index.entries.first.value)
              .findAll();
        case "color":
          return await db.teams
              .filter()
              .colorEqualTo(index.entries.first.value)
              .findAll();
        case "score":
          return await db.teams
              .filter()
              .scoreEqualTo(index.entries.first.value)
              .findAll();
        default:
          return [];
      }
    } catch (e, stacktrace) {
      logger.warning("Whoops, that's an error! \n $e \n $stacktrace");
      return [];
    }
  }

  /// Returns a sorted list based on specified team indexes
  Future<List<Team>> getTeamList(List<Map<String, Sort>> indexes) async {
    try {
      Isar db = await isarDB;
      // Default case; sort by id
      if (indexes.isEmpty) {
        List<Team> teams = await db.teams.where().findAll();
        return teams;
      }
      // Building a dynamic query to execute based on the user sorting preferences
      List<SortProperty> sortProperties = [];
      for (Map<String, Sort> index in indexes) {
        switch (index.entries.first.key) {
          case "name":
            sortProperties.add(SortProperty(
                property: 'name', sort: index.entries.first.value));
            break;
          case "color":
            sortProperties.add(SortProperty(
                property: 'color', sort: index.entries.first.value));
            break;
          case "score":
            sortProperties.add(SortProperty(
                property: 'score', sort: index.entries.first.value));
            break;
          case "matchesPlayed":
            sortProperties.add(SortProperty(
                property: 'matchesPlayed', sort: index.entries.first.value));
            break;
          case "matchesWon":
            sortProperties.add(SortProperty(
                property: 'matchesWon', sort: index.entries.first.value));
            break;
        }
      }
      List<Team> teams =
          await db.teams.buildQuery<Team>(sortBy: sortProperties).findAll();
      return teams;
    } catch (e, stacktrace) {
      logger.warning("Whoops, that's an error! \n $e \n $stacktrace");
      return [];
    }
  }

  /// Update all given characters
  Future<List<Team?>?> updateTeams(List<Team> teams) async {
    try {
      Isar db = await isarDB;
      List<int> ids = await db.teams.putAll(teams);
      return await db.teams.getAll(ids);
    } catch (e, stacktrace) {
      logger.warning("Whoops, that's an error! \n $e \n $stacktrace");
      return null;
    }
  }

  /// Deletes all teams with the selected ids
  Future<int?> deleteTeams(List<int> teamIds) async {
    try {
      Isar db = await isarDB;
      int numTeamsDeleted = await db.teams.deleteAll(teamIds);
      return numTeamsDeleted;
    } catch (e, stacktrace) {
      logger.warning("Whoops, that's an error! \n $e \n $stacktrace");
      return null;
    }
  }
}

Storage storage = Storage();

/*
class ProgramRunner extends Flython {
  List<Player>? players;
  ProgramRunner({this.players});

  // Runs the DWTP script with the player parameters
  // TODO: change ```true``` to false once done debugging
  Flython flython = Flython()
    ..initialize('python.exe', 'assets/scripts/DWTP.py', true);

  Future<dynamic> runPrograms() async {
    if (players == null) {
      throw Exception("players cannot be null when running the program");
    }
    List<Map<String, dynamic>> command = [];
    for (Player player in players!) {
      command.add(player.toMap());
    }
    dynamic output = await runCommand(command);
  }

  Future<bool> checkToken(id) async {
    // Verify if the token is a valid text channel id
    List<Map<String, dynamic>> command = [];
    command.add({'program': 'utils.py', 'function': 'checkToken', 'id': id});
    bool output = await runCommand(command);
    return output;
  }
}
*/