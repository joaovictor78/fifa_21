import '../../domain/entities/player_entity.dart';
import '../../domain/value_objects/height_vo.dart';
import '../../domain/value_objects/weight_vo.dart';

class PlayerDTO {
  static PlayerEntity fromMap(Map<String, dynamic> map) {
    String sofifaId = map['sofifa_id'].toString();
    String avatarUrl = sofifaId.length < 5 || sofifaId.length > 6
        ? ''
        : sofifaId.length == 5
            ? "https://cdn.sofifa.com/players/0${sofifaId[0]}${sofifaId[1]}/${sofifaId[2]}${sofifaId[3]}${sofifaId[4]}/21_360.png"
            : "https://cdn.sofifa.com/players/${sofifaId[0]}${sofifaId[1]}${sofifaId[2]}/${sofifaId[3]}${sofifaId[4]}${sofifaId[5]}/21_360.png";
    return PlayerEntity(
        sofifaId: map['sofifa_id'],
        longName: map['long_name'],
        shortName: map['short_name'],
        playerUrl: map['player_url'],
        avatarUrl: avatarUrl,
        nationality: map['nationality'],
        age: map['age'],
        heightInMetters: HeightVO.create(map['height_cm'] as int),
        weightInKg: WeightVO.create(map['weight_kg'] as int),
        clubName: map['club_name'],
        leagueName: map['league_name'],
        overall: map['overall'],
        preferredFoot: map['preferred_foot'],
        pace: map['pace'],
        shooting: map['shooting'],
        passing: map['passing'],
        dribbling: map['dribbling'],
        defending: map['defending'],
        physic: map['physic']);
  }

  static Map<String, dynamic> toMap(PlayerEntity player) {
    Map<String, dynamic> data = {
      "sofifa_id": player.sofifaId,
      "player_url": player.playerUrl,
      "short_name": player.shortName,
      "long_name": player.longName,
      "nationality": player.nationality,
      "age": player.age,
      "height_cm": HeightVO.convertMettersInCM(double.parse(player
          .heightInMetters.value!
          .replaceAll(RegExp(r', m'), player.heightInMetters.value!))),
      "weight_kg": player.weightInKg.value,
      "club_name": player.clubName,
      "league_name": player.leagueName,
      "overall": player.overall,
      "preferred_foot": player.preferredFoot,
      "pace": player.pace,
      "shooting": player.shooting,
      "passing": player.passing,
      "dribbling": player.dribbling,
      "defending": player.defending,
      "physic": player.physic
    };
    return data;
  }
}
