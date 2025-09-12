import 'package:core/app_way_data_core.dart';

class CharacterGate {
  final Gate gate;

  CharacterGate({required this.gate});

  Future<void>? open({
    required CharacterParams params,
    required GateType type,
  }) {
    return gate.open<CharacterParams, void>(
      route: CharacterBloc.route,
      type: type,
      params: params,
    );
  }
}
