import 'package:dartz/dartz.dart';

import 'package:core/app_way_data_core.dart';

class FindAllCharacterUseCase
    implements
        IUseCase<
          FindAllCharacterParams,
          Either<Failure, List<CharacterEntity>>
        > {
  final CharacterRepository repository;

  FindAllCharacterUseCase({required this.repository});
  @override
  Future<Either<Failure, List<CharacterEntity>>> call({
    required FindAllCharacterParams params,
  }) async {
    return await repository.findAll(params: params);
  }
}

class FindAllCharacterParams {}
