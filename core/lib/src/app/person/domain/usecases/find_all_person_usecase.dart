import 'package:dartz/dartz.dart';

import 'package:core/app_way_data_core.dart';

class FindAllPersonUseCase
    implements IUseCase<FindAllPersonParams, Either<Failure, PersonEntity>> {
  final PersonRepository repository;

  FindAllPersonUseCase({required this.repository});
  @override
  Future<Either<Failure, PersonEntity>> call({
    required FindAllPersonParams params,
  }) async {
    return await repository.findAll(params: params);
  }
}

class FindAllPersonParams {}
