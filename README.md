# Parcours App (Flutter)

Application Flutter **production-ready skeleton** pour consommer le backend Laravel **Parcours API**.

## Hypothèses API (centralisées)
1. Endpoint d'auth admin: `POST /api/login` retournant `{ data: { token: "..." } }`.
2. `GET /api/v1/ecoles` retourne une pagination Laravel dans `data` (`data`, `current_page`, `last_page`, `per_page`, `total`).
3. Les routes métiers secondaires (`/fiche`, `/competences`, `/parcours-etudes`, `/ecoles`) retournent des tableaux simples dans `data`.

## Arborescence

```txt
lib/
  main.dart
  src/
    app/
      app_router.dart
      app_theme.dart
      home_shell_page.dart
    core/
      config/app_config.dart
      error/{app_exception.dart,error_mapper.dart}
      l10n/app_localizations.dart
      network/{api_response.dart,dio_provider.dart}
      storage/{cache_service.dart,secure_storage_service.dart}
      widgets/app_async_value.dart
    features/
      auth/
      ecoles/
      metiers/
      admin/
mock_api_responses/
  ecoles_success.json
  error_example.json
test/
  ecole_model_test.dart
  metier_model_test.dart
```

## Installation & exécution

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run --dart-define=BASE_URL=http://10.0.2.2:8000
```

## Tests

```bash
flutter test
flutter analyze
```

## Build

```bash
flutter build apk --release --dart-define=BASE_URL=https://api.example.com
flutter build ios --release --dart-define=BASE_URL=https://api.example.com
```

## Configuration env

`BASE_URL` est injecté par `--dart-define` et lu dans `AppConfig.baseUrl`.

## Stack
- Riverpod
- Dio (+ interceptor auth/log)
- go_router
- freezed + json_serializable
- flutter_secure_storage
- shared_preferences (cache simple)
- thème light/dark + i18n FR extensible
