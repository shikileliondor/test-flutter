import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/widgets/app_async_value.dart';
import '../providers/metiers_providers.dart';

class MetierDetailPage extends ConsumerWidget {
  const MetierDetailPage({required this.id, super.key});
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Détail métier')),
      body: AppAsyncValue(
        value: ref.watch(metierDetailProvider(id)),
        onRetry: () => ref.invalidate(metierDetailProvider(id)),
        data: (metier) {
          final f = NumberFormat('#,###', 'fr_FR');
          return DefaultTabController(
            length: 4,
            child: Column(
              children: [
                Card(
                  margin: const EdgeInsets.all(12),
                  child: ListTile(
                    title: Text(metier.nom),
                    subtitle: Text(
                      'Salaire: ${f.format(metier.salaires.min)} - ${f.format(metier.salaires.max)} ${metier.salaires.devise}/${metier.salaires.periode}',
                    ),
                  ),
                ),
                const TabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(text: 'Fiche'),
                    Tab(text: 'Compétences'),
                    Tab(text: 'Parcours'),
                    Tab(text: 'Écoles'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      ListView(padding: const EdgeInsets.all(16), children: [Text(metier.description)]),
                      _bulletList(metier.competences),
                      _bulletList(metier.parcoursEtudes),
                      _bulletList(metier.ecolesRecommandees),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _bulletList(List<String> items) => ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (_, i) => ListTile(leading: const Icon(Icons.check), title: Text(items[i])),
      );
}
