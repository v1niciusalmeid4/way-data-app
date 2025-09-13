import 'package:core/app_way_data_core.dart';

class LocationInjector extends DependencyInjector {
  @override
  void dependencies() {
    put<LocationDataSource>(LocationDataSourceImpl(http: find()));

    put<LocationRepository>(LocationRepositoryImpl(dataSource: find()));

    put<FindLocationByNameUseCase>(
      FindLocationByNameUseCase(repository: find()),
    );
  }
}
