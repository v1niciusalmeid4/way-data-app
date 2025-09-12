import 'package:dartz/dartz.dart';

import 'package:core/app_way_data_core.dart';

class FindCharacterByIdUseCase
    implements
        IUseCase<FindCharacterByIdParams, Either<Failure, CharacterEntity>> {
  final CharacterRepository repository;

  FindCharacterByIdUseCase({required this.repository});
  @override
  Future<Either<Failure, CharacterEntity>> call({
    required FindCharacterByIdParams params,
  }) async {
    return await repository.findById(params: params);
  }
}

class FindCharacterByIdParams {
  final String id;

  FindCharacterByIdParams({required this.id});
}
