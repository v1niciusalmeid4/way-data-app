part of 'env.dart';

class EnvConfig {
  final String baseUrl;
  final Env env;

  bool get isRelease => env == Env.prd;

  EnvConfig({
    required this.baseUrl,
    required this.env,
  });
}
