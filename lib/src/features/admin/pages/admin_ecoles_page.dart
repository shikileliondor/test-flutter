import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/presentation/providers/auth_providers.dart';
import '../../ecoles/data/models/ecole_model.dart';
import '../../ecoles/presentation/providers/ecoles_providers.dart';
import '../providers/admin_ecoles_provider.dart';

class AdminEcolesPage extends ConsumerWidget {
  const AdminEcolesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(ecolesListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin - Écoles'),
        actions: [
          IconButton(
            onPressed: () => ref.read(authNotifierProvider.notifier).logout(),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openForm(context, ref),
        child: const Icon(Icons.add),
      ),
      body: list.when(
        data: (page) => ListView(
          children: page.items
              .map((e) => ListTile(
                    title: Text(e.nom),
                    subtitle: Text(e.ville),
                    trailing: Wrap(
                      spacing: 4,
                      children: [
                        IconButton(
                          onPressed: () => _openForm(context, ref, initial: e),
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () => ref
                              .read(adminEcolesProvider.notifier)
                              .delete(e.id),
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
      ),
    );
  }

  Future<void> _openForm(
    BuildContext context,
    WidgetRef ref, {
    EcoleModel? initial,
  }) async {
    await showDialog(
      context: context,
      builder: (_) => _EcoleFormDialog(initial: initial),
    );
  }
}

class _EcoleFormDialog extends ConsumerStatefulWidget {
  const _EcoleFormDialog({this.initial});
  final EcoleModel? initial;

  @override
  ConsumerState<_EcoleFormDialog> createState() => _EcoleFormDialogState();
}

class _EcoleFormDialogState extends ConsumerState<_EcoleFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late final _nom = TextEditingController(text: widget.initial?.nom);
  late final _ville = TextEditingController(text: widget.initial?.ville);
  late final _type = TextEditingController(text: widget.initial?.type);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.initial == null ? 'Créer école' : 'Modifier école'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(controller: _nom, validator: _req, decoration: const InputDecoration(labelText: 'Nom')),
            TextFormField(controller: _ville, validator: _req, decoration: const InputDecoration(labelText: 'Ville')),
            TextFormField(controller: _type, validator: _req, decoration: const InputDecoration(labelText: 'Type')),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Annuler')),
        FilledButton(
          onPressed: () async {
            if (!_formKey.currentState!.validate()) return;
            final payload = {
              'nom': _nom.text,
              'ville': _ville.text,
              'type': _type.text,
              'domaines': <String>[],
              'filieres': <String>[],
            };
            if (widget.initial == null) {
              await ref.read(adminEcolesProvider.notifier).create(payload);
            } else {
              await ref.read(adminEcolesProvider.notifier).update(widget.initial!.id, payload);
            }
            if (mounted) Navigator.pop(context);
          },
          child: const Text('Enregistrer'),
        ),
      ],
    );
  }

  String? _req(String? v) => (v == null || v.trim().isEmpty) ? 'Champ requis' : null;
}
