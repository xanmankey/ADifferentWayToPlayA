import 'package:freezed_annotation/freezed_annotation.dart';
part 'exposed_types.freezed.dart';

/// A union type combining all the exposed data types
@freezed
class DataTypes with _$DataTypes {
  const factory DataTypes.characterType() = CharacterType;
  const factory DataTypes.gamemodeType() = GamemodeType;
  const factory DataTypes.programType() = ProgramType;
  const factory DataTypes.teamType() = TeamType;
}
