import '../../domain/entities/position_entity.dart';

class PositionDTO {
  static PositionEntity fromMap(Map<String, dynamic> map) {
    return PositionEntity(id: map['position_id'], name: map['name']);
  }

  static Map<String, dynamic> toMap(PositionEntity position) {
    Map<String, dynamic> data = {
      'position_id': position.id,
      'name': position.name
    };
    return data;
  }
}
