import 'package:dartz/dartz.dart';

import 'package:core/app_way_data_core.dart';

class FindLocationByNameUseCase
    implements
        IUseCase<
          FindLocationByNameParams,
          Either<Failure, List<LocationEntity>>
        > {
  final LocationRepository repository;

  FindLocationByNameUseCase({required this.repository});
  @override
  Future<Either<Failure, List<LocationEntity>>> call({
    required FindLocationByNameParams params,
  }) async {
    return await repository.findByName(params: params);
  }
}

class FindLocationByNameParams {
  final String name;

  FindLocationByNameParams({required this.name});
}
