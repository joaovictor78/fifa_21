import '../../domain/entities/nationality_entity.dart';

class NationalityDTO {
  static NationalityEntity fromMap(Map<String, dynamic> map) {
    return NationalityEntity(id: map['nationality_id'], name: map['name']);
  }

  static Map<String, dynamic> toMap(NationalityEntity nationality) {
    Map<String, dynamic> data = {
      'id': nationality.id,
      'name': nationality.name
    };
    return data;
  }
}
