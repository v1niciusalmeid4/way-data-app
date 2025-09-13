import 'package:core/app_way_data_core.dart';

import 'package:dartz/dartz.dart';

abstract class LocationRepository {
  Future<Either<Failure, List<LocationEntity>>> findByName({
    required FindLocationByNameParams params,
  });
}
