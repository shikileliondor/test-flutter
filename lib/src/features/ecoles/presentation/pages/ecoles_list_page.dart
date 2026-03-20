import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/app_async_value.dart';
import '../providers/ecoles_providers.dart';
import '../widgets/ecole_card.dart';

class EcolesListPage extends ConsumerWidget {
  const EcolesListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listValue = ref.watch(ecolesListProvider);
    final filtersValue = ref.watch(ecolesFiltersProvider);
    final query = ref.watch(ecolesQueryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Écoles')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Recherche école...',
                prefixIcon: Icon(Icons.search),
              ),
              onSubmitted: (v) => ref.read(ecolesQueryProvider.notifier).state =
                  EcolesQuery(
                search: v,
                ville: query.ville,
                domaine: query.domaine,
                type: query.type,
                sort: query.sort,
                order: query.order,
                page: 1,
              ),
            ),
          ),
          filtersValue.when(
            data: (filters) => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  DropdownButton<String>(
                    hint: const Text('Ville'),
                    value: query.ville,
                    items: filters.villes
                        .map((v) => DropdownMenuItem(value: v, child: Text(v)))
                        .toList(),
                    onChanged: (v) => ref.read(ecolesQueryProvider.notifier).state =
                        EcolesQuery(
                      search: query.search,
                      ville: v,
                      domaine: query.domaine,
                      type: query.type,
                    ),
                  ),
                  const SizedBox(width: 8),
                  DropdownButton<String>(
                    hint: const Text('Tri'),
                    value: query.sort,
                    items: const [
                      DropdownMenuItem(value: 'nom', child: Text('Nom')),
                      DropdownMenuItem(value: 'ville', child: Text('Ville')),
                      DropdownMenuItem(value: 'created_at', child: Text('Création')),
                    ],
                    onChanged: (v) => ref.read(ecolesQueryProvider.notifier).state =
                        EcolesQuery(
                      search: query.search,
                      ville: query.ville,
                      domaine: query.domaine,
                      type: query.type,
                      sort: v ?? 'nom',
                      order: query.order,
                    ),
                  ),
                ],
              ),
            ),
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),
          Expanded(
            child: AppAsyncValue(
              value: listValue,
              onRetry: () => ref.invalidate(ecolesListProvider),
              data: (page) => ListView.builder(
                itemCount: page.items.length + 1,
                itemBuilder: (context, index) {
                  if (index == page.items.length) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: query.page > 1
                              ? () => ref.read(ecolesQueryProvider.notifier).state =
                                  EcolesQuery(
                                    search: query.search,
                                    ville: query.ville,
                                    domaine: query.domaine,
                                    type: query.type,
                                    page: query.page - 1,
                                  )
                              : null,
                          child: const Text('Précédent'),
                        ),
                        Text('Page ${query.page}/${page.lastPage}'),
                        TextButton(
                          onPressed: query.page < page.lastPage
                              ? () => ref.read(ecolesQueryProvider.notifier).state =
                                  EcolesQuery(
                                    search: query.search,
                                    ville: query.ville,
                                    domaine: query.domaine,
                                    type: query.type,
                                    page: query.page + 1,
                                  )
                              : null,
                          child: const Text('Suivant'),
                        ),
                      ],
                    );
                  }
                  final ecole = page.items[index];
                  return EcoleCard(
                    ecole: ecole,
                    onTap: () => context.push('/ecoles/${ecole.id}'),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
