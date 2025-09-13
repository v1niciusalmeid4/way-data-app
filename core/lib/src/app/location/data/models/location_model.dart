import 'package:core/app_way_data_core.dart';

class LocationModel extends LocationEntity {
  LocationModel({
    required super.id,
    required super.name,
    required super.type,
    required super.dimension,
    required super.residents,
    required super.url,
    required super.created,
  });

  factory LocationModel.fromMap(dynamic map) {
    return LocationModel(
      id: map['id'] as int,
      name: map['name'] as String,
      type: map['type'] as String,
      dimension: map['dimension'] as String,
      residents: List.from(map['residents'] as List<dynamic>),
      url: map['url'] as String,
      created: DateTime.parse(map['created'] as String),
    );
  }
}
