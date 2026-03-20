# API Integration Guide (Flutter + Dio + Clean Architecture)

## Endpoints backend détectés dans le projet

| Domaine | Méthode | Path | Query params | Auth | Payload request | Réponse attendue |
|---|---|---|---|---|---|---|
| Métiers | GET | `/api/metiers` | `search`, `domaine`, `duree_etudes`, `niveau_requis` | Non (actuellement) | Aucun | `[]` ou `{ data: [] }` |
| Métiers | GET | `/api/metiers/{id}` | Aucun | Non (actuellement) | Aucun | `{...}` ou `{ data: {...} }` |
| Écoles | GET | `/api/ecoles` | `search`, `ville`, `domaine`, `type` | Non (actuellement) | Aucun | `[]` ou `{ data: [] }` |

> Base URL runtime: `--dart-define=API_BASE_URL=https://ton-backend.com`

## Schéma logique

```text
UI (Screens/Widgets)
   ↓
State management (Riverpod Providers)
   ↓
Repository (MetierRepository, EcoleRepository)
   ↓
Domain API Services (MetierApiService, EcoleApiService)
   ↓
Core network (ApiClient + Interceptors + ResponseParser + ErrorMapper)
   ↓
Backend REST API
```

## Pseudo-code (niveau junior)

```text
1) Construire ApiClient avec Dio
   - lire API_BASE_URL
   - configurer timeout
   - ajouter logs et retry

2) Dans un service métier
   - appeler GET /api/metiers
   - parser réponse:
     - si [] -> convertir chaque item
     - si {data: []} -> convertir data
   - gérer exceptions Dio -> ApiError

3) Dans le repository
   - exposer listMetiers(), getMetierById()
   - déléguer au service

4) Dans Riverpod
   - créer metierRepositoryProvider
   - créer metiersProvider(search)
   - dans l’UI, afficher loading/error/data
```

## Checklist finale de branchement API

- [ ] Démarrer backend.
- [ ] Lancer app Flutter avec `--dart-define=API_BASE_URL=...`.
- [ ] Vérifier `GET /api/metiers` (liste).
- [ ] Vérifier `GET /api/metiers/{id}` (détail).
- [ ] Vérifier `GET /api/ecoles` (liste écoles).
- [ ] Tester les 4 formats de réponse (`[]`, `{data:[]}`, `{}`, `{data:{}}`).
- [ ] Couper internet pour tester erreur offline.
- [ ] Simuler timeout (retard backend).
- [ ] Vérifier retries sur erreur réseau/5xx.
- [ ] Vérifier affichage UI actuel inchangé.

## Exemple de commande run

```bash
flutter run --dart-define=API_BASE_URL=http://10.0.2.2:8000
```
