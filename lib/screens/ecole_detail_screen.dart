import 'package:flutter/material.dart';

import '../models/ecole_model.dart';

class EcoleDetailScreen extends StatelessWidget {
  const EcoleDetailScreen({
    super.key,
    required this.ecole,
  });

  final EcoleModel ecole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(ecole.nom)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ecole.nom,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text('Ville: ${ecole.ville}'),
            const SizedBox(height: 8),
            Text('Type: ${ecole.type}'),
            const SizedBox(height: 16),
            const Text('Domaines'),
            const SizedBox(height: 6),
            Text(ecole.domaines.join(', ')),
            const SizedBox(height: 16),
            const Text('Filières principales'),
            const SizedBox(height: 6),
            Text(ecole.filieres.join(', ')),
          ],
        ),
      ),
    );
  }
}
