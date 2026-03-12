import 'package:flutter/foundation.dart';

/// API configuration with platform-aware default base URL.
class ApiConfig {
  ApiConfig._();

  static String customBaseUrl = '';

  static String get baseUrl {
    if (customBaseUrl.isNotEmpty) return customBaseUrl;
    if (kIsWeb) return 'http://localhost:8000/api';
    return 'http://10.0.2.2:8000/api';
  }
}
