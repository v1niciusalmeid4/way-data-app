import 'package:core/app_way_data_core.dart';

class CharacterLocationModel extends CharacterLocationEntity {
  CharacterLocationModel({required super.name, required super.url});

  factory CharacterLocationModel.fromMap(dynamic map) {
    return CharacterLocationModel(
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }
}
