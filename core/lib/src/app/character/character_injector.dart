import 'package:core/app_way_data_core.dart';

class CharacterInjector extends DependencyInjector {
  @override
  void dependencies() {
    put<CharacterDataSource>(CharacterDataSourceImpl(http: find()));

    put<CharacterRepository>(CharacterRepositoryImpl(dataSource: find()));

    put<FindAllCharacterUseCase>(FindAllCharacterUseCase(repository: find()));

    put<FindCharacterByIdUseCase>(FindCharacterByIdUseCase(repository: find()));
  }
}
