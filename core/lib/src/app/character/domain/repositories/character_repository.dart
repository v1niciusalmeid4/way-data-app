import 'package:core/app_way_data_core.dart';

import 'package:dartz/dartz.dart';

abstract class CharacterRepository {
  Future<Either<Failure, List<CharacterEntity>>> findAll({
    required FindAllCharacterParams params,
  });
}
