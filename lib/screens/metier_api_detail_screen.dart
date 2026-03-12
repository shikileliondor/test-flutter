import 'package:flutter/material.dart';

import '../models/metier_api_models.dart';
import '../services/metier_api_service.dart';

class MetierApiDetailScreen extends StatefulWidget {
  const MetierApiDetailScreen({
    required this.metierId,
    required this.service,
    super.key,
  });

  final int metierId;
  final MetierApiService service;

  @override
  State<MetierApiDetailScreen> createState() => _MetierApiDetailScreenState();
}

class _MetierApiDetailScreenState extends State<MetierApiDetailScreen> {
  late Future<MetierDetail> _future;

  @override
  void initState() {
    super.initState();
    _future = widget.service.getMetierDetail(widget.metierId);
  }

  void _retry() {
    setState(() {
      _future = widget.service.getMetierDetail(widget.metierId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Détail métier (API)')),
      body: FutureBuilder<MetierDetail>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'Erreur réseau lors du chargement du détail métier.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: _retry,
                    child: const Text('Réessayer'),
                  ),
                ],
              ),
            );
          }

          final detail = snapshot.data;
          if (detail == null) {
            return const Center(child: Text('Aucun détail trouvé.'));
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(
                detail.nom,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(detail.description),
              const SizedBox(height: 16),
              _SectionTitle(title: 'Durée estimée'),
              Text(detail.dureeEstimee.isEmpty ? 'Non renseignée' : detail.dureeEstimee),
              const SizedBox(height: 16),
              _SectionTitle(title: 'Salaires'),
              if (detail.salaires.isEmpty)
                const Text('Aucune information salaire.')
              else
                ...detail.salaires.map((s) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(s.readable),
                    )),
              const SizedBox(height: 16),
              _SectionTitle(title: 'Compétences'),
              _BulletList(items: detail.competences.map((c) => c.nom).toList()),
              const SizedBox(height: 16),
              _SectionTitle(title: 'Parcours d\'études'),
              _BulletList(items: detail.parcoursEtudes.map((p) => p.nom).toList()),
              const SizedBox(height: 16),
              _SectionTitle(title: 'Écoles recommandées'),
              _BulletList(items: detail.ecolesRecommandees.map((e) => e.nom).toList()),
              const SizedBox(height: 16),
              _SectionTitle(title: 'Roadmap'),
              _BulletList(items: detail.roadmapEtapes.map((r) => r.titre).toList()),
            ],
          );
        },
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _BulletList extends StatelessWidget {
  const _BulletList({required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Text('Aucune donnée.');
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text('• $item'),
            ),
          )
          .toList(),
    );
  }
}
