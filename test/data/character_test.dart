import 'package:adifferentwaytoplay/data/utils/utils.dart';
import 'package:adifferentwaytoplay/data/utils/initial_vars.dart';
import 'package:adifferentwaytoplay/domain/entities/character.dart';
import 'package:isar/isar.dart';

import 'package:test/test.dart';

// Testing database functions so I can have confidence in my logic
// and root out any errors early on in the process (TDD)
void main() async {
  // Initialize storage (which will initialize data)
  // Character tests
  group("Retrieve character by index: ", () {
    test('name', (() async {
      expect(
        await storage.getCharacter({"name": CharacterData.appleKid.name}),
        [CharacterData.appleKid],
      );
    }));
    test('age', (() async {
      expect(
        await storage.getCharacter({"age": CharacterData.appleKid.age}),
        [CharacterData.appleKid],
      );
    }));
    test('color', (() async {
      expect(
        await storage.getCharacter({"color": CharacterData.appleKid.color}),
        [CharacterData.appleKid],
      );
    }));
  });
  group("Sort character list: ", () {
    test('name', (() async {
      expect(
        await storage.getCharacterList([
          {"name": Sort.desc}
        ]),
        [
          CharacterData.appleKid,
          CharacterData.bananaKid,
          CharacterData.dinofish,
          CharacterData.gunlessGuy,
          CharacterData.john,
          CharacterData.refrigeratorExhibitionGuy,
          CharacterData.signQuadraticFormula,
          CharacterData.signPythagoreonTheorum,
        ],
      );
    }));
    // TODO: honestly, it would take a LOT of work to manually sort this
    // I'm more interested in what the initial output is
    test('name, age, color, matches played, and matches won', (() async {
      expect(
        await storage.getCharacterList([
          {"name": Sort.desc},
          {"age": Sort.asc},
          {"color": Sort.desc},
          {"matchesPlayed": Sort.desc},
          {"matchesWon": Sort.desc},
        ]),
        [
          CharacterData.appleKid,
          CharacterData.bananaKid,
          CharacterData.dinofish,
          CharacterData.gunlessGuy,
          CharacterData.john,
          CharacterData.refrigeratorExhibitionGuy,
          CharacterData.signQuadraticFormula,
          CharacterData.signPythagoreonTheorum,
        ],
      );
    }));
  });
  // Note the order of the following tests:
  // Insert -> Update -> Delete so as to preserve the original database structure
  group("CRUD new character: ", () {
    test('create', (() async {
      expect(
        await storage.updateCharacters([CharacterData.TESTCharacter]),
        [CharacterData.TESTCharacter],
      );
    }));
    // test('update', (() async {
    //   expect(
    //     await storage.updateCharacters([CharacterData.TESTCharacter2]),
    //     CharacterData.TESTCharacter2,
    //   );
    // }));
    test('delete', (() async {
      expect(
        await storage.deleteCharacters([CharacterData.TESTCharacter.id]),
        1,
      );
    }));
  });
  group("CRUD multiple new characters: ", () {
    test('create', (() async {
      expect(
        await storage.updateCharacters(
            [CharacterData.TESTCharacter, CharacterData.TESTCharacter2]),
        [CharacterData.TESTCharacter, CharacterData.TESTCharacter2],
      );
    }));
    // test('update', (() async {
    //   expect(
    //     await db.query("Characters",
    //         where: "name = ?", whereArgs: [Params.validCharacterName]),
    //     Character(),
    //   );
    // }));
    test('delete', (() async {
      expect(
        await storage.deleteCharacters([
          CharacterData.TESTCharacter.id,
          CharacterData.TESTCharacter2.id,
        ]),
        2,
      );
    }));
  });
  group("Invalid: ", (() {
    test('property on getCharacter', (() async {
      expect(
        await storage.getCharacter({"invalid": CharacterData.appleKid.color}),
        [],
      );
    }));
    test('property on getCharacterList', (() async {
      expect(
        await storage.getCharacterList([
          {"invalid": Sort.asc}
        ]),
        [],
      );
    }));
    test('unnecessary duplicates on updateCharacter', (() async {
      expect(
        await storage.updateCharacters([
          CharacterData.TESTCharacter,
          CharacterData.TESTCharacter,
        ]),
        [CharacterData.TESTCharacter],
      );
    }));
    test('property on deleteCharacter', (() async {
      // There's NO reason ANY DWTP database should contain this many entries
      expect(
        await storage.deleteCharacters([100000000]),
        [],
      );
    }));
  }));
}
