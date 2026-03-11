
// ─────────────────────────────────────────────────────────────────
// widgets/metier_detail/metier_header.dart
// ─────────────────────────────────────────────────────────────────
import 'package:flutter/material.dart';
import '../../app_theme.dart';
import '../../models/metier.dart';

class MetierHeader extends StatelessWidget {
  const MetierHeader({required this.metier, super.key});

  final Metier metier;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: AppShadow.card,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icône domaine
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: Icon(
              _mapIcon(metier.icone),
              color: AppColors.primary,
              size: 26,
            ),
          ),
          const SizedBox(width: 14),

          // Texte
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Badges
                Row(
                  children: [
                    _Badge(
                      label: metier.domaine.isEmpty ? 'Général' : metier.domaine,
                      bgColor: AppColors.primaryLight,
                      textColor: AppColors.primary,
                    ),
                    const SizedBox(width: 6),
                    _Badge(
                      label: metier.niveauRequis,
                      bgColor: AppColors.greenLight,
                      textColor: AppColors.green,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  metier.description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textSub,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData _mapIcon(String iconName) {
    switch (iconName) {
      case 'computer':          return Icons.computer_rounded;
      case 'medical_services':  return Icons.medical_services_outlined;
      case 'palette':           return Icons.palette_outlined;
      case 'engineering':       return Icons.engineering_outlined;
      case 'business':          return Icons.business_center_outlined;
      default:                  return Icons.work_outline_rounded;
    }
  }
}

class _Badge extends StatelessWidget {
  const _Badge({
    required this.label,
    required this.bgColor,
    required this.textColor,
  });

  final String label;
  final Color bgColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: textColor,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}
