import 'package:core/app_way_data_core.dart';

class GateInjector extends DependencyInjector {
  @override
  void dependencies() {
    put<Gate>(GateImpl(navigator: find()));
  }
}
