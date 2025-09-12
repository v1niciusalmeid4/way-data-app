enum HttpMethod { post, get, put, delete, patch }

class HttpRequest<T> {
  final String url;
  final HttpMethod method;
  final Object? body;
  final Map<String, String>? headers;
  T Function(Map<String, dynamic>)? decoder;

  HttpRequest({
    required this.url,
    required this.method,
    this.body,
    this.headers,
    this.decoder,
  });

  HttpRequest<T> copyWith({
    String? url,
    HttpMethod? method,
    Object? body,
    Map<String, String>? headers,
    T Function(Map<String, dynamic>)? decoder,
  }) {
    return HttpRequest<T>(
      url: url ?? this.url,
      method: method ?? this.method,
      body: body ?? this.body,
      headers: headers ?? this.headers,
      decoder: decoder ?? this.decoder,
    );
  }
}

class HttpStatus {
  final int code;
  final String message;

  HttpStatus({required this.code, required this.message});
}

class HttpResponse<T, R> {
  final R? data;
  final HttpStatus status;
  HttpRequest? request;

  HttpResponse({required this.data, required this.status, this.request});

  bool get isSuccess => status.code >= 200 && status.code < 300;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'data': data, 'status': status};
  }

  factory HttpResponse.fromMap(
    dynamic map,
    T Function(Map<String, dynamic>)? decoder,
    HttpStatus status,
  ) {
    if (decoder == null) {
      return HttpResponse<T, R>(data: map, status: status);
    }

    if (map is List) {
      map = map.map<T>((e) => decoder(e)).toList();
    }

    if (map is Map && map.isNotEmpty) {
      map = decoder(Map.from(map));
    }

    try {
      map = map as R;
    } on TypeError {
      map = null;
    }

    return HttpResponse<T, R>(data: map as R?, status: status);
  }
}
