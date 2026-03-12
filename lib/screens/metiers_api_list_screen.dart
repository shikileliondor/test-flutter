import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../models/metier_api_models.dart';
import '../services/metier_api_service.dart';
import 'metier_api_detail_screen.dart';

class MetiersApiListScreen extends StatefulWidget {
  const MetiersApiListScreen({super.key, MetierApiService? service})
      : _service = service;

  final MetierApiService? _service;

  @override
  State<MetiersApiListScreen> createState() => _MetiersApiListScreenState();
}

class _MetiersApiListScreenState extends State<MetiersApiListScreen> {
  late final MetierApiService _service;
  late Future<List<MetierResume>> _future;

  @override
  void initState() {
    super.initState();
    _service = widget._service ?? MetierApiService();
    _future = _service.getMetiers();
  }

  void _retry() {
    setState(() {
      _future = _service.getMetiers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Métiers (API)')),
      body: FutureBuilder<List<MetierResume>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return _ErrorState(
              message: 'Erreur réseau lors du chargement des métiers.',
              onRetry: _retry,
            );
          }

          final data = snapshot.data ?? const <MetierResume>[];
          if (data.isEmpty) {
            return const Center(child: Text('Aucun métier disponible.'));
          }

          return RefreshIndicator(
            color: AppColors.primary,
            onRefresh: () async => _retry(),
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: data.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final metier = data[index];
                return Card(
                  child: ListTile(
                    title: Text(metier.nom),
                    subtitle: Text(
                      metier.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => MetierApiDetailScreen(
                            metierId: metier.id,
                            service: _service,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: onRetry, child: const Text('Réessayer')),
          ],
        ),
      ),
    );
  }
}
