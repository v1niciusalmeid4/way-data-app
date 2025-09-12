import 'package:core/app_way_data_core.dart';

class GateImpl implements Gate {
  final NavigatorService navigator;

  GateImpl({required this.navigator});

  @override
  Future<Return?> open<Params, Return>({
    required String route,
    required GateType type,
    Params? params,
  }) async {
    switch (type) {
      case GateType.offAll:
        return await navigator.offAllNamed(route, arguments: params) as Return?;
      case GateType.to:
        return await navigator.toNamed(route, arguments: params) as Return?;
      case GateType.off:
        return await navigator.popAndToNamed(route, arguments: params)
            as Return?;
    }
  }
}
