import 'env_config.dart';

class ApiConfig {
  const ApiConfig._();

  static String get apiBaseUrl => EnvConfig.baseUrl;
}
