import 'package:flutter/material.dart';

import '../../models/metier.dart';
import 'section_card.dart';

class SalaireCard extends StatelessWidget {
  const SalaireCard({required this.salaire, super.key});

  final SalaireMetier salaire;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Salaire moyen',
      icon: Icons.euro_rounded,
      child: Row(
        children: [
          _SalaryItem(label: 'Min', value: salaire.minimum),
          _SalaryItem(label: 'Moyen', value: salaire.moyen, highlighted: true),
          _SalaryItem(label: 'Max', value: salaire.maximum),
        ],
      ),
    );
  }
}

class _SalaryItem extends StatelessWidget {
  const _SalaryItem({
    required this.label,
    required this.value,
    this.highlighted = false,
  });

  final String label;
  final int value;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    final color = highlighted ? const Color(0xFF1D4ED8) : const Color(0xFF64748B);
    return Expanded(
      child: Column(
        children: [
          Text(
            '${value.toString()} €',
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w700,
              fontSize: highlighted ? 20 : 17,
            ),
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(color: Color(0xFF64748B))),
        ],
      ),
    );
  }
}
