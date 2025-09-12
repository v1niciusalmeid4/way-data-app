import 'package:core/app_way_data_core.dart';

class CharacterModel extends CharacterEntity {
  CharacterModel({
    required super.id,
    required super.name,
    required super.status,
    required super.gender,
    required super.location,
    required super.origin,
    required super.species,
    required super.type,
    required super.image,
  });

  factory CharacterModel.fromMap(dynamic map) {
    return CharacterModel(
      id: map['id'] as int,
      name: map['name'] as String,
      status: CharacterStatus.fromKey(map['status']),
      gender: CharacterGender.fromKey(map['gender']),
      location: LocationModel.fromMap(map['location']),
      origin: LocationModel.fromMap(map['origin']),
      species: map['species'] as String,
      type: map['type'] as String,
      image: map['image'] as String,
    );
  }
}
