import 'package:core/app_way_data_core.dart';

class InstanceInjector extends DependencyInjector {
  final EnvConfig envConfig;

  InstanceInjector({required this.envConfig});

  @override
  void dependencies() {
    put<EnvConfig>(envConfig);
    CoreInjector().dependencies();
    AppInjector().dependencies();
  }
}
