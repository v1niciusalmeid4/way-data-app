import 'package:core/app_way_data_core.dart';

class CharacterEntity {
  final int id;
  final String name;
  final CharacterStatus status;
  final CharacterGender gender;
  final String species;
  final String type;
  final String image;

  CharacterEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.gender,
    required this.species,
    required this.type,
    required this.image,
  });
}
