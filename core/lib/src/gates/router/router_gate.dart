import 'package:core/app_way_data_core.dart';

class RouterGate {
  final Gate gate;

  RouterGate({required this.gate});

  Future<void>? openRouter({
    required RouterParams params,
    required GateType type,
  }) {
    return gate.open<RouterParams, void>(
      route: RouterBloc.route,
      type: type,
      params: params,
    );
  }
}
