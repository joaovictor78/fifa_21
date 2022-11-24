import '../../domain/entities/league_entity.dart';

class LeagueDTO {
  static LeagueEntity fromMap(Map<String, dynamic> map) {
    return LeagueEntity(id: map['league_id'], name: map['name']);
  }

  static Map<String, dynamic> toMap(LeagueEntity league) {
    Map<String, dynamic> data = {'id': league.id, 'name': league.name};
    return data;
  }
}
