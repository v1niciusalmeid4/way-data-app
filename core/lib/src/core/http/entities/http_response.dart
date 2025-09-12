enum HttpMethod {
  post,
  get,
  put,
  delete,
  patch,
}

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

  HttpStatus({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'message': message,
    };
  }

  factory HttpStatus.fromMap(Map<String, dynamic> map) {
    return HttpStatus(
      code: map['code'] as int,
      message: map['message'] as String,
    );
  }
}

class HttpResponse<T, R> {
  final R? data;
  final List<String> errors;
  final HttpStatus status;

  final int? totalPages;
  final int? totalElements;

  HttpRequest? request;

  HttpResponse({
    required this.data,
    required this.errors,
    required this.status,
    this.totalPages,
    this.totalElements,
    this.request,
  });

  bool get isSuccess => status.message == 'success';
  String get errorMessage => errors.join('\n');

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data,
      'errors': errors,
      'status': status.toMap(),
    };
  }

  factory HttpResponse.fromMap(
    Map<String, dynamic> map,
    T Function(Map<String, dynamic>)? decoder,
  ) {
    var data = map['data'];

    if (decoder == null) {
      return HttpResponse<T, R>(
        data: data as R,
        errors: List.from(map['errors'] ?? []),
        status: HttpStatus.fromMap(map['status']),
      );
    }

    if (data is List) {
      data = data.map<T>((e) => decoder(e)).toList();
    }

    if (data is Map && data.isNotEmpty) {
      data = decoder(Map.from(data));
    }

    try {
      data = data as R;
    } on TypeError {
      data = null;
    }

    return HttpResponse<T, R>(
      data: data as R?,
      errors: List.from(map['errors'] ?? []),
      status: HttpStatus.fromMap(map['status']),
      totalPages: map['totalPages'] as int?,
      totalElements: map['totalElements'] as int?,
    );
  }
}
