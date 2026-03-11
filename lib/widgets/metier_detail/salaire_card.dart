
// ─────────────────────────────────────────────────────────────────
// widgets/metier_detail/salaire_card.dart
// ─────────────────────────────────────────────────────────────────
import 'package:flutter/material.dart';
import '../../app_theme.dart';
import '../../models/metier.dart';
import 'section_card.dart';

class SalaireCard extends StatelessWidget {
  const SalaireCard({required this.salaire, super.key});

  final SalaireMetier salaire;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Salaire mensuel',
      icon: Icons.payments_outlined,
      child: Column(
        children: [
          // Barre de progression visuelle
          ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.full),
            child: Container(
              height: 6,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.green, AppColors.primary, AppColors.primaryDark],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // 3 colonnes : Min / Moyen / Max
          Row(
            children: [
              _SalaryItem(
                label: 'Minimum',
                amount: salaire.minimum,
                color: AppColors.textSub,
                bgColor: AppColors.border,
              ),
              // Séparateur vertical
              Container(
                height: 40,
                width: 1,
                color: AppColors.border,
                margin: const EdgeInsets.symmetric(horizontal: 8),
              ),
              _SalaryItem(
                label: 'Moyen',
                amount: salaire.moyen,
                color: AppColors.primary,
                bgColor: AppColors.primaryLight,
                isHighlighted: true,
              ),
              Container(
                height: 40,
                width: 1,
                color: AppColors.border,
                margin: const EdgeInsets.symmetric(horizontal: 8),
              ),
              _SalaryItem(
                label: 'Maximum',
                amount: salaire.maximum,
                color: AppColors.green,
                bgColor: AppColors.greenLight,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SalaryItem extends StatelessWidget {
  const _SalaryItem({
    required this.label,
    required this.amount,
    required this.color,
    required this.bgColor,
    this.isHighlighted = false,
  });

  final String label;
  final int amount;
  final Color color;
  final Color bgColor;
  final bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isHighlighted ? bgColor : Colors.transparent,
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
        child: Column(
          children: [
            Text(
              '${_formatAmount(amount)} FCFA',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isHighlighted ? 15 : 13,
                fontWeight: FontWeight.w800,
                color: color,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.textMuted,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatAmount(int amount) {
    // Formate avec séparateur de milliers : 42000 → 42 000
    return amount.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]} ',
    );
  }
}
