import 'package:core/app_way_data_core.dart';

class EnvConfigFactory {
  static EnvConfig get prd =>
      EnvConfig(baseUrl: 'https://rickandmortyapi.com/api', env: Env.prd);
}
