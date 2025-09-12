import 'package:core/app_way_data_core.dart';

class EnvConfigFactory {
  static EnvConfig get prd =>
      EnvConfig(baseUrl: 'http://localhost:8081', env: Env.prd);

  static EnvConfig get dev =>
      EnvConfig(baseUrl: 'http://localhost:8081', env: Env.dev);
}
