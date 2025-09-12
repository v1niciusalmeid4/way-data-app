import 'package:core/app_way_data_core.dart';

class PersonInjector extends DependencyInjector {
  @override
  void dependencies() {
    put<PersonDataSource>(PersonDataSourceImpl(http: find()));

    put<PersonRepository>(PersonRepositoryImpl(dataSource: find()));

    put<FindAllPersonUseCase>(FindAllPersonUseCase(repository: find()));
  }
}
