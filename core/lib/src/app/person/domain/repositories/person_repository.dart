import 'package:core/app_way_data_core.dart';

import 'package:dartz/dartz.dart';

abstract class PersonRepository {
  Future<Either<Failure, PersonEntity>> findAll({
    required FindAllPersonParams params,
  });
}
