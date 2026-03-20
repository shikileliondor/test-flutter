import 'package:flutter/foundation.dart';

enum AppEnvironment { local, staging, production }

class EnvConfig {
  const EnvConfig._();

  static AppEnvironment get environment {
    const raw = String.fromEnvironment('APP_ENV', defaultValue: 'local');
    switch (raw.toLowerCase()) {
      case 'production':
      case 'prod':
        return AppEnvironment.production;
      case 'staging':
      case 'stage':
        return AppEnvironment.staging;
      default:
        return AppEnvironment.local;
    }
  }

  static String get baseUrl {
    const manualOverride = String.fromEnvironment('API_BASE_URL', defaultValue: '');
    if (manualOverride.isNotEmpty) {
      return manualOverride;
    }

    switch (environment) {
      case AppEnvironment.local:
        if (kIsWeb) return 'http://localhost:3000';
        switch (defaultTargetPlatform) {
          case TargetPlatform.android:
            return 'http://10.0.2.2:3000';
          case TargetPlatform.iOS:
            return 'http://127.0.0.1:3000';
          default:
            return 'http://127.0.0.1:3000';
        }
      case AppEnvironment.staging:
        return 'https://staging.api.mondomaine.com/v1';
      case AppEnvironment.production:
        return 'https://api.mondomaine.com/v1';
    }
  }

  static String get environmentLabel => environment.name;
}
