import 'package:core/app_way_data_core.dart';

class ILocationInjector extends DependencyInjector {
  @override
  void dependencies() {
    lazyPut<LocationBloc>(
      () => LocationBloc(findLocationByNameUseCase: find()),
    );
  }
}
