import 'package:core/app_way_data_core.dart';
import 'package:dartz/dartz.dart';

class PersonRepositoryImpl implements PersonRepository {
  final PersonDataSource dataSource;
  PersonRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, PersonEntity>> findAll({
    required FindAllPersonParams params,
  }) async {
    try {
      return Right(await dataSource.findAll(params: params));
    } on RemoteException catch (ex) {
      return Left(RemoteFailure(message: ex.message));
    }
  }
}
