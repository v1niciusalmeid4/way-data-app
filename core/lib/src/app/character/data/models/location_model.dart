import 'package:core/app_way_data_core.dart';

class LocationModel extends LocationEntity {
  LocationModel({required super.name, required super.url});

  factory LocationModel.fromMap(dynamic map) {
    return LocationModel(
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }
}
