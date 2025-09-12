import 'package:core/app_way_data_core.dart';

class PersonModel extends PersonEntity {
  PersonModel({
    required super.image,
    required super.name,
    required super.status,
  });

  factory PersonModel.fromMap(Map<String, dynamic> map) {
    return PersonModel(
      image: map['image'],
      name: map['name'],
      status: map['status'],
    );
  }
}
