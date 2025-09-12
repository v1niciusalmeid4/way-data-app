import 'package:core/app_way_data_core.dart';
import 'package:dartz/dartz.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterDataSource dataSource;

  CharacterRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<CharacterEntity>>> findAll({
    required FindAllCharacterParams params,
  }) async {
    try {
      return Right(await dataSource.findAll(params: params));
    } on RemoteException catch (ex) {
      return Left(RemoteFailure(message: ex.message));
    }
  }
}
