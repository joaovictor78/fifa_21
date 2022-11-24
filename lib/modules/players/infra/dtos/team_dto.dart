import '../../domain/entities/team_entity.dart';

class TeamDTO {
  static TeamEntity fromMap(Map<String, dynamic> map) {
    return TeamEntity(id: map['team_id'], name: map['name']);
  }

  static Map<String, dynamic> toMap(TeamEntity team) {
    Map<String, dynamic> data = {'id': team.id, 'name': team.name};
    return data;
  }
}
