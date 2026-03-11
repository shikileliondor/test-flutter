
// ─────────────────────────────────────────────────────────────────
// widgets/metier_card.dart
// ─────────────────────────────────────────────────────────────────
import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../models/metier.dart';

class MetierCard extends StatelessWidget {
  const MetierCard({
    required this.metier,
    required this.onTap,
    super.key,
  })  : icon = null,
        title = null,
        backgroundColor = null;

  const MetierCard.compact({
    required this.icon,
    required this.title,
    required this.backgroundColor,
    super.key,
  })  : metier = null,
        onTap = null;

  final Metier? metier;
  final VoidCallback? onTap;
  final IconData? icon;
  final String? title;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return metier != null ? _buildFull(context) : _buildCompact();
  }

  // ── Version complète (liste des métiers) ─────────────────────
  Widget _buildFull(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          boxShadow: AppShadow.card,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icône
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(AppRadius.md),
              ),
              child: Icon(
                _iconFromString(metier!.icone),
                color: AppColors.primary,
                size: 24,
              ),
            ),
            const SizedBox(width: 14),

            // Contenu
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          metier!.nom,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: AppColors.text,
                          ),
                        ),
                      ),
                      // Badge domaine
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: AppColors.primaryLight,
                          borderRadius: BorderRadius.circular(AppRadius.full),
                        ),
                        child: Text(
                          metier!.domaine.isEmpty ? '—' : metier!.domaine,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                            letterSpacing: 0.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    metier!.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.textSub,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Ligne salaire
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: AppColors.greenLight,
                          borderRadius: BorderRadius.circular(AppRadius.sm),
                        ),
                        child: const Icon(
                          Icons.attach_money_rounded,
                          size: 13,
                          color: AppColors.green,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        metier!.salaireFormate,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppColors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Version compacte (accueil / grille) ──────────────────────
  Widget _buildCompact() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.primaryLight,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: AppShadow.card,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(AppRadius.sm),
            ),
            child: Icon(icon, size: 20, color: AppColors.primary),
          ),
          const Spacer(),
          Text(
            title ?? '',
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: AppColors.text,
            ),
          ),
        ],
      ),
    );
  }

  IconData _iconFromString(String key) {
    switch (key) {
      case 'engineering': return Icons.engineering_outlined;
      case 'science':     return Icons.science_outlined;
      case 'health':      return Icons.health_and_safety_outlined;
      case 'business':    return Icons.business_center_outlined;
      case 'palette':     return Icons.palette_outlined;
      default:            return Icons.work_outline_rounded;
    }
  }
 }