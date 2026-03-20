import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/app_async_value.dart';
import '../providers/ecoles_providers.dart';

class EcoleDetailPage extends ConsumerWidget {
  const EcoleDetailPage({required this.id, super.key});
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Détail école')),
      body: AppAsyncValue(
        value: ref.watch(ecoleDetailProvider(id)),
        onRetry: () => ref.invalidate(ecoleDetailProvider(id)),
        data: (ecole) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(ecole.nom, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text('${ecole.ville} - ${ecole.type}'),
            const SizedBox(height: 16),
            const Text('Domaines'),
            Wrap(spacing: 6, children: ecole.domaines.map((d) => Chip(label: Text(d))).toList()),
            const SizedBox(height: 16),
            const Text('Filières'),
            Wrap(spacing: 6, children: ecole.filieres.map((f) => Chip(label: Text(f))).toList()),
          ],
        ),
      ),
    );
  }
}
