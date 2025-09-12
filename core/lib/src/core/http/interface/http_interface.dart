import 'package:core/app_way_data_core.dart';

abstract class HttpRemote {
  Future<HttpResponse<T, R>> request<T, R>(
    String url, {
    required HttpMethod method,
    Object? body,
    Map<String, String>? headers,
    T Function(Map<String, dynamic>)? decoder,
  });
}
