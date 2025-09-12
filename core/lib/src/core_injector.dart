import 'package:core/app_way_data_core.dart';

class CoreInjector extends DependencyInjector {
  final List<DependencyInjector> injectors = [
    MorphlingInjector(),
    GateInjector(),
    GatesInjector(),
    HttpInjector(),
  ];

  // For test pourposes
  void inject(DependencyInjector injector) {
    injector.dependencies();
  }

  @override
  void dependencies() {
    for (final injector in injectors) {
      inject(injector);
    }
  }
}
