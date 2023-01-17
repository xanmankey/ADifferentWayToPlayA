import 'package:adifferentwaytoplay/domain/entities/player.dart';
import 'package:adifferentwaytoplay/domain/utils/utils.dart';
import 'package:isar/isar.dart';

part 'team.g.dart';

/// An entity for Team objects, which allows players to affiliate themselves
/// with other players based on interest. Also has a display gallery.
///
/// ```
/// Team()
/// ..name = "Your name here"
/// ..logo = "Path to your logo here"
/// ..description = "Your description here"
/// ..color = Colors.red;
/// ```
///
/// Backlinks to player
///
/// Indexes name, color, score, matches played, matches won
@collection
class Team {
  Id id = Isar.autoIncrement;

  @Index(unique: true, caseSensitive: false)
  late String name;

  late String logo;

  String? description;

  // Do I want to force teams to have unique colors?
  // No, because the logo is required
  // In the case of teams, the player's color becomes the team color
  @Index()
  late int color;

  @Index()
  int score = 0;

  @Index()
  int matchesPlayed = 0;

  @Index()
  int matchesWon = 0;

  @Backlink(to: 'team')
  var player = IsarLink<Player>();

  @override
  String toString() {
    return '''$id: {name: $name, logo: $logo, score: $score, description: $description, color: $color, 
    matchesPlayed: $matchesPlayed, matchesWon: $matchesWon}''';
  }

  /*
  Team({
    required this.name,
    required this.logo,
    required this.color,
    this.description,
  });

  // From Team
  Team.fromTeam(Team team)
      : this(
          name: team.name,
          description: team.description,
          logo: team.logo,
          color: team.color,
        );

  // To json
  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'image': image,
      };

  // From json
  factory Team.fromJson(Map<String, dynamic> map) {
    final name = map['name'] as String;
    final description = map['description'] as String?;
    final image = map['image'] as String?;

    return Team(
      name: name,
      description: description,
      image: image,
    );
  }
  */
}
