import 'package:core/app_way_data_core.dart';
import 'package:dartz/dartz.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationDataSource dataSource;

  LocationRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<LocationEntity>>> findByName({
    required FindLocationByNameParams params,
  }) async {
    try {
      return Right(await dataSource.findByName(params: params));
    } on RemoteException catch (ex) {
      return Left(RemoteFailure(message: ex.message));
    }
  }
}
