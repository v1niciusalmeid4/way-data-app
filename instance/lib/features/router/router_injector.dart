import 'package:core/app_way_data_core.dart';

class IRouterInjector extends DependencyInjector {
  @override
  void dependencies() {
    lazyPut<RouterBloc>(() => RouterBloc(homeGate: find()));
  }
}
