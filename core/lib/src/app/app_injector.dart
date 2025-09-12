import 'package:core/app_way_data_core.dart';

class AppInjector extends DependencyInjector {
  final List<DependencyInjector> injectors = [CharacterInjector()];

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
