import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/app_async_value.dart';
import '../providers/metiers_providers.dart';

class MetiersListPage extends ConsumerWidget {
  const MetiersListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Métiers')),
      body: AppAsyncValue(
        value: ref.watch(metiersListProvider),
        onRetry: () => ref.invalidate(metiersListProvider),
        data: (items) => ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final m = items[index];
            return Card(
              child: ListTile(
                title: Text(m.nom),
                subtitle: Text(m.description, maxLines: 2),
                onTap: () => context.push('/metiers/${m.id}'),
              ),
            );
          },
        ),
      ),
    );
  }
}
