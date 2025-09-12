import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:core/app_way_data_core.dart';
import 'package:http/http.dart' as http;

class HttpApiImpl implements HttpRemote {
  final EnvConfig config;
  final http.Client client;

  HttpApiImpl({required this.config, required this.client});

  @override
  Future<HttpResponse<T, R>> request<T, R>(
    String url, {
    required HttpMethod method,
    Object? body,
    Map<String, String>? headers,
    T Function(Map<String, dynamic>)? decoder,
  }) async {
    try {
      final request = HttpRequest(
        url: url,
        method: method,
        body: body,
        headers: headers,
        decoder: decoder,
      );

      final updatedRequest = request.copyWith(
        url: config.baseUrl + request.url,
      );

      final response = await _translateResponse<T, R>(
        await _doRequest(updatedRequest),
        decoder,
      );

      response.request = updatedRequest;
      return response;
    } on RemoteException {
      rethrow;
    } catch (e) {
      throw RemoteException(message: e.toString());
    }
  }

  Future<http.Response> _doRequest<T>(HttpRequest<T> request) async {
    switch (request.method) {
      case HttpMethod.post:
        return _post<T>(request);
      case HttpMethod.get:
        return _get<T>(request);
      case HttpMethod.put:
        return _put<T>(request);
      case HttpMethod.delete:
        return _delete<T>(request);
      case HttpMethod.patch:
        return _patch<T>(request);
    }
  }

  Future<http.Response> _post<T>(HttpRequest<T> request) {
    return client.post(
      Uri.parse(request.url),
      body: request.body,
      headers: request.headers,
    );
  }

  Future<http.Response> _get<T>(HttpRequest<T> request) {
    return client.get(Uri.parse(request.url), headers: request.headers);
  }

  Future<http.Response> _put<T>(HttpRequest<T> request) async {
    return client.put(
      Uri.parse(request.url),
      body: request.body,
      headers: request.headers,
    );
  }

  Future<http.Response> _delete<T>(HttpRequest<T> request) async {
    return client.delete(
      Uri.parse(request.url),
      body: request.body,
      headers: request.headers,
    );
  }

  Future<http.Response> _patch<T>(HttpRequest<T> request) async {
    return client.patch(
      Uri.parse(request.url),
      body: request.body,
      headers: request.headers,
    );
  }

  Future<HttpResponse<T, R>> _translateResponse<T, R>(
    http.Response response,
    T Function(Map<String, dynamic> map)? decoder,
  ) async {
    log('HTTP Request');
    log('Method: ${response.request?.method}');
    log('Url: ${response.request?.url}');
    log('Status: ${response.statusCode}');

    if (response.bodyBytes.isEmpty) {
      throw RemoteException(message: 'Falha na API');
    }

    final responseBody = utf8.decode(response.bodyBytes);
    final map = jsonDecode(responseBody);

    log('Body: $map');

    return HttpResponse<T, R>.fromMap(map, decoder);
  }
}
