import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/metier_providers.dart';
import 'metier_fiche_screen.dart';

class MetiersListScreen extends StatefulWidget {
  const MetiersListScreen({super.key});

  @override
  State<MetiersListScreen> createState() => _MetiersListScreenState();
}

class _MetiersListScreenState extends State<MetiersListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MetiersNotifier>().loadMetiers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Métiers')),
      body: Consumer<MetiersNotifier>(
        builder: (context, state, _) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.error != null) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(state.error!),
              ),
            );
          }
          if (state.metiers.isEmpty) {
            return const Center(child: Text('Aucun métier disponible.'));
          }

          return RefreshIndicator(
            onRefresh: state.loadMetiers,
            child: ListView.separated(
              itemBuilder: (context, index) {
                final metier = state.metiers[index];
                return ListTile(
                  title: Text(metier.nom),
                  subtitle: Text(metier.description ?? 'Pas de description'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => MetierFicheScreen(metierId: metier.id),
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (_, __) => const Divider(height: 0),
              itemCount: state.metiers.length,
            ),
          );
        },
      ),
    );
  }
}
