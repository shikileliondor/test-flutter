import 'package:flutter/material.dart';

import '../models/metier_model.dart';
import '../services/api_service.dart';
import 'metier_detail_screen.dart';

class MetiersListScreen extends StatefulWidget {
  const MetiersListScreen({super.key});

  @override
  State<MetiersListScreen> createState() => _MetiersListScreenState();
}

class _MetiersListScreenState extends State<MetiersListScreen> {
  final ApiService _apiService = ApiService();
  late Future<List<Metier>> _metiersFuture;

  @override
  void initState() {
    super.initState();
    _metiersFuture = _apiService.fetchMetiers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Liste des métiers')),
      body: FutureBuilder<List<Metier>>(
        future: _metiersFuture,
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

          final metiers = snapshot.data ?? const <Metier>[];
          if (metiers.isEmpty) {
            return const Center(child: Text('Aucun métier trouvé'));
          }

          return ListView.builder(
            itemCount: metiers.length,
            itemBuilder: (context, index) {
              final metier = metiers[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  title: Text(metier.nom),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      '${metier.description}\nSalaire moyen: ${metier.salaireMoyen.toStringAsFixed(0)}',
                    ),
                  ),
                  isThreeLine: true,
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (_) => MetierDetailScreen(metierId: metier.id),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
