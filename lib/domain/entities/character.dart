// import 'dart:convert';
import 'package:adifferentwaytoplay/domain/entities/player.dart';
import 'package:adifferentwaytoplay/domain/utils/utils.dart';
import 'package:isar/isar.dart';

/// Thoughts on my FIRST Isar collection
/// The incredible type support means working w/ json isn't necessary
/// I believe that I can keep functions, essentially using
/// the class as a class AND a collection
/// I also learned that you need to include a part header
/// (regardless of the error) in order to generate your code using build_runner
/// I also learned that the constructors aren't really necessary, and
/// that you can work entirely through isar (which makes the process more convenient).
/// It increases the reliance on isar a bit, but that's a sacrifice I'm willing
/// to make.

part 'character.g.dart';

/// An entity outlining Character objects, which can be viewed in a
/// Character gallery or selected by the Player in the main mode
///
/// ```
/// Character()
/// ..image = 'assets/images/appleKid.png'
/// ..name = 'appleKid'
/// ..hit = 'Apple inc.'
/// ..miss = 'Instruction manuals'
/// ..description = """appleKid is an avid apple-enthusiast, touting his inventiveness and ingenuity as a result of sustained apple consumption""";
/// ```
///
/// Backlinks to Player
///
/// Indexes: name, age, color, matches played, matches won
@collection
class Character {
  Id id = Isar.autoIncrement;

  // Sort Characters by names alphabetically
  @Index(unique: true, caseSensitive: false)
  late String name;

  late String image;

  @Index()
  int? age;

  String? hit;

  String? miss;

  String? description;

  // Note that the color property is a hex value
  @Index()
  int? color;

  @Index()
  int matchesPlayed = 0;

  @Index()
  int matchesWon = 0;

  @Backlink(to: 'character')
  final player = IsarLink<Player>();

  @override
  String toString() {
    return '''$id: {name: $name, image: $image, age: $age, hit: $hit, 
    miss: $miss, description: $description, color: $color, 
    matchesPlayed: $matchesPlayed, matchesWon: $matchesWon}''';
  }

  // Constructor
  // Character({
  //   required this.image,
  //   required this.name,
  //   this.hit,
  //   this.miss,
  //   this.description,
  //   this.age,
  //   this.color,
  // }) : id = Isar.autoIncrement;

  /*
  // For creating a character from a character
  Character.fromCharacter(Character character)
      : this(
          image: character.image,
          name: character.name,
          hit: character.hit,
          miss: character.miss,
          description: character.description,
          age: character.age,
          color: character.color,
        );

  /// Commenting out all my utility functions for the time being
  /// So JSON is NOT necessary;
  // For encoding json
  Map<String, dynamic> toJson() => {
        'image': image,
        'name': name,
        'hit': hit,
        'miss': miss,
        'description': description,
      };

  // For decoding json
  factory Character.fromJson(Map<String, dynamic> map) {
    final image = map['image'] as String;
    final name = map['name'] as String;
    final hit = map['hit'] as String?;
    final miss = map['miss'] as String?;
    final description = map['description'] as String?;

    return Character(
      image: image,
      name: name,
      hit: hit,
      miss: miss,
      description: description,
    );
  }
  */
}
