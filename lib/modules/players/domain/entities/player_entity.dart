import '../value_objects/height_vo.dart';
import '../value_objects/weight_vo.dart';

class PlayerEntity {
  int sofifaId;
  String avatarUrl;
  String playerUrl;
  String shortName;
  String longName;
  String nationality;
  int age;
  HeightVO heightInMetters;
  WeightVO weightInKg;
  String clubName;
  String leagueName;
  int overall;
  String preferredFoot;
  int pace;
  int shooting;
  int passing;
  int dribbling;
  int defending;
  int physic;

  PlayerEntity(
      {required this.sofifaId,
      required this.shortName,
      required this.avatarUrl,
      required this.playerUrl,
      required this.longName,
      required this.nationality,
      required this.age,
      required this.heightInMetters,
      required this.weightInKg,
      this.clubName = '',
      this.leagueName = '',
      required this.overall,
      this.preferredFoot = '',
      this.pace = 0,
      this.shooting = 0,
      this.passing = 0,
      this.dribbling = 0,
      this.defending = 0,
      this.physic = 0});
}
