import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/admin/pages/admin_ecoles_page.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/auth/presentation/providers/auth_providers.dart';
import '../features/ecoles/presentation/pages/ecole_detail_page.dart';
import '../features/ecoles/presentation/pages/ecoles_list_page.dart';
import '../features/metiers/presentation/pages/metier_detail_page.dart';
import '../features/metiers/presentation/pages/metiers_list_page.dart';
import 'home_shell_page.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/ecoles',
    routes: [
      ShellRoute(
        builder: (context, state, child) => HomeShellPage(child: child),
        routes: [
          GoRoute(
            path: '/ecoles',
            builder: (context, state) => const EcolesListPage(),
            routes: [
              GoRoute(
                path: ':id',
                builder: (context, state) =>
                    EcoleDetailPage(id: int.parse(state.pathParameters['id']!)),
              ),
            ],
          ),
          GoRoute(
            path: '/metiers',
            builder: (context, state) => const MetiersListPage(),
            routes: [
              GoRoute(
                path: ':id',
                builder: (context, state) =>
                    MetierDetailPage(id: int.parse(state.pathParameters['id']!)),
              ),
            ],
          ),
          GoRoute(path: '/admin/login', builder: (context, state) => const LoginPage()),
          GoRoute(
            path: '/admin/ecoles',
            redirect: (context, state) async {
              final auth = await ref.read(authRepositoryProvider).isAuthenticated();
              return auth ? null : '/admin/login';
            },
            builder: (context, state) => const AdminEcolesPage(),
          ),
        ],
      ),
    ],
  );
});
