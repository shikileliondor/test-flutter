import 'package:flutter/material.dart';

import '../models/metier_model.dart';
import '../services/api_service.dart';

class MetierDetailScreen extends StatefulWidget {
  const MetierDetailScreen({
    super.key,
    this.metierId,
    this.metier,
  });

  final int? metierId;
  final dynamic metier;

  @override
  State<MetierDetailScreen> createState() => _MetierDetailScreenState();
}

class _MetierDetailScreenState extends State<MetierDetailScreen> {
  final ApiService _apiService = ApiService();
  late Future<MetierFiche> _ficheFuture;

  int get _id {
    if (widget.metierId != null) {
      return widget.metierId!;
    }

    final dynamic rawId = widget.metier?.id;
    if (rawId is int) {
      return rawId;
    }

    throw ArgumentError('MetierDetailScreen nécessite metierId ou metier.id');
  }

  @override
  void initState() {
    super.initState();
    _ficheFuture = _apiService.fetchMetierFiche(_id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fiche métier')),
      body: FutureBuilder<MetierFiche>(
        future: _ficheFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text('Erreur: ${snapshot.error}'),
              ),
            );
          }

          final fiche = snapshot.data;
          if (fiche == null) {
            return const Center(child: Text('Fiche introuvable'));
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(fiche.nom, style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 16),
              _sectionCard(
                context,
                title: 'Description',
                child: Text(fiche.description),
              ),
              _sectionCard(
                context,
                title: 'Salaire',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Min: ${fiche.salaire.min.toStringAsFixed(0)} ${fiche.salaire.devise}'),
                    Text('Moyen: ${fiche.salaire.moyen.toStringAsFixed(0)} ${fiche.salaire.devise}'),
                    Text('Max: ${fiche.salaire.max.toStringAsFixed(0)} ${fiche.salaire.devise}'),
                  ],
                ),
              ),
              _sectionCard(
                context,
                title: 'Durée estimée',
                child: Text(fiche.dureeEstimee),
              ),
              _sectionCard(
                context,
                title: 'Compétences',
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: fiche.competences
                      .map((competence) => Chip(label: Text(competence)))
                      .toList(),
                ),
              ),
              _sectionCard(
                context,
                title: 'Parcours d’études',
                child: Column(
                  children: fiche.parcoursEtudes
                      .map((parcours) => ListTile(
                            dense: true,
                            contentPadding: EdgeInsets.zero,
                            leading: const Icon(Icons.school_outlined),
                            title: Text(parcours),
                          ))
                      .toList(),
                ),
              ),
              _sectionCard(
                context,
                title: 'Écoles recommandées',
                child: Column(
                  children: fiche.ecolesRecommandees
                      .map((ecole) => ListTile(
                            dense: true,
                            contentPadding: EdgeInsets.zero,
                            leading: const Icon(Icons.location_city_outlined),
                            title: Text(ecole.nom),
                            subtitle: Text(
                              [ecole.ville, ecole.pays]
                                  .where((item) => item != null && item!.isNotEmpty)
                                  .cast<String>()
                                  .join(', '),
                            ),
                          ))
                      .toList(),
                ),
              ),
              _sectionCard(
                context,
                title: 'Roadmap',
                child: Column(
                  children: fiche.roadmap
                      .asMap()
                      .entries
                      .map(
                        (entry) => ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            radius: 12,
                            child: Text('${entry.key + 1}'),
                          ),
                          title: Text(entry.value),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _sectionCard(
    BuildContext context, {
    required String title,
    required Widget child,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            child,
          ],
        ),
      ),
    );
  }
}
