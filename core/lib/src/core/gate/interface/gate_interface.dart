enum GateType {
  offAll,
  to,
  off,
}

abstract class Gate {
  Future<Return?> open<Params, Return>({
    required String route,
    required GateType type,
    Params? params,
  });
}
