import 'package:core/app_way_data_core.dart';
import 'package:http/http.dart' as http;

class HttpInjector extends DependencyInjector {
  @override
  void dependencies() {
    lazyPut<HttpRemote>(
      () => HttpApiImpl(client: http.Client(), config: find()),
    );
  }
}
