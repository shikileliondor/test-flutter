import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/repositories/metier_repository.dart';
import '../providers/metier_providers.dart';

class MetierFicheScreen extends StatelessWidget {
  const MetierFicheScreen({super.key, required this.metierId});

  final int metierId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MetierFicheNotifier(context.read<MetierRepository>())..loadFiche(metierId),
      child: Scaffold(
        appBar: AppBar(title: const Text('Fiche métier')),
        body: Consumer<MetierFicheNotifier>(
          builder: (context, state, _) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.error != null) {
              return Center(child: Text(state.error!));
            }
            final fiche = state.fiche;
            if (fiche == null) {
              return const Center(child: Text('Aucune fiche trouvée.'));
            }

            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text(fiche.nom, style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 8),
                Text(fiche.description ?? 'Pas de description.'),
                const SizedBox(height: 16),
                Text('Compétences (${fiche.competences.length})'),
                ...fiche.competences.map((item) => ListTile(title: Text(item.nom))),
                const SizedBox(height: 8),
                Text('Parcours (${fiche.parcoursEtudes.length})'),
                ...fiche.parcoursEtudes.map((item) => ListTile(
                      title: Text(item.nom),
                      subtitle: item.niveau != null ? Text(item.niveau!) : null,
                    )),
                const SizedBox(height: 8),
                Text('Écoles (${fiche.ecolesRecommandees.length})'),
                ...fiche.ecolesRecommandees.map((item) => ListTile(
                      title: Text(item.nom),
                      subtitle: Text('${item.ville ?? '-'} • ${item.pays ?? '-'}'),
                    )),
              ],
            );
          },
        ),
      ),
    );
  }
}
