class AppConfig {
  const AppConfig._();

  static const baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'http://10.0.2.2:8000',
  );

  // Hypothèse centralisée: endpoint login Laravel Sanctum/JWT.
  static const loginPath = '/api/login';
}
