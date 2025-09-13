import 'package:core/app_way_data_core.dart';

class LocationGate {
  final Gate gate;

  LocationGate({required this.gate});

  Future<void>? open({required LocationParams params, required GateType type}) {
    return gate.open<LocationParams, void>(
      route: LocationBloc.route,
      type: type,
      params: params,
    );
  }
}
