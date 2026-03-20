import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeShellPage extends StatelessWidget {
  const HomeShellPage({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    int current = 0;
    if (location.startsWith('/metiers')) current = 1;
    if (location.startsWith('/admin')) current = 2;

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: current,
        onDestinationSelected: (i) {
          if (i == 0) context.go('/ecoles');
          if (i == 1) context.go('/metiers');
          if (i == 2) context.go('/admin/login');
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.school), label: 'Écoles'),
          NavigationDestination(icon: Icon(Icons.work), label: 'Métiers'),
          NavigationDestination(icon: Icon(Icons.admin_panel_settings), label: 'Admin'),
        ],
      ),
    );
  }
}
