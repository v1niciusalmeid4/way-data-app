import 'package:core/app_way_data_core.dart';

class HomeInjector extends DependencyInjector {
  @override
  void dependencies() {
    lazyPut<HomeBloc>(
      () => HomeBloc(findAllCharacterUseCase: find(), characterGate: find()),
    );
  }
}
