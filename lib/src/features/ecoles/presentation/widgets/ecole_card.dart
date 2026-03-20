import 'package:flutter/material.dart';

import '../../data/models/ecole_model.dart';

class EcoleCard extends StatelessWidget {
  const EcoleCard({required this.ecole, super.key, this.onTap});
  final EcoleModel ecole;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundImage: ecole.logoUrl != null ? NetworkImage(ecole.logoUrl!) : null,
          child: ecole.logoUrl == null ? const Icon(Icons.school) : null,
        ),
        title: Text(ecole.nom),
        subtitle: Text('${ecole.ville} • ${ecole.type}'),
        trailing: Wrap(
          spacing: 6,
          children: ecole.domaines.take(2).map((d) => Chip(label: Text(d))).toList(),
        ),
      ),
    );
  }
}
