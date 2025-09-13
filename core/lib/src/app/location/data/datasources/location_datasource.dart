import 'package:core/app_way_data_core.dart';

abstract class LocationDataSource {
  Future<List<LocationEntity>> findByName({
    required FindLocationByNameParams params,
  });
}
