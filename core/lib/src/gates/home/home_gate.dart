import 'package:core/app_way_data_core.dart';

class HomeGate {
  final Gate gate;

  HomeGate({required this.gate});

  Future<void>? open({required HomeParams params, required GateType type}) {
    return gate.open<HomeParams, void>(
      route: HomeBloc.route,
      type: type,
      params: params,
    );
  }
}
