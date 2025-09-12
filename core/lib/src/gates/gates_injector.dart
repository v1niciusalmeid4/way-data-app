import 'package:core/app_way_data_core.dart';

class GatesInjector extends DependencyInjector {
  @override
  void dependencies() {
    put<RouterGate>(RouterGate(gate: find()));
    put<HomeGate>(HomeGate(gate: find()));
    put<CharacterGate>(CharacterGate(gate: find()));
  }
}
