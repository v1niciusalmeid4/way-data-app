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

class FindAllCharacterParams {
  final int page;
  final int size;
  final String query;
  final CharacterGender? gender;
  final CharacterStatus? status;

  FindAllCharacterParams({
    required this.page,
    required this.size,
    required this.query,
    required this.gender,
    required this.status,
  });
}
