
// ─────────────────────────────────────────────────────────────────
// widgets/roadmap_step.dart
// ─────────────────────────────────────────────────────────────────
import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../models/filiere.dart';

class RoadmapStep extends StatelessWidget {
  const RoadmapStep({
    required this.step,
    required this.index,
    required this.isLast,
    super.key,
  });

  final RoadmapItem step;
  final int index;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final color = _colorFromName(step.couleur);
    final bgColor = color.withOpacity(0.12);
    final icon = _iconFromName(step.icone);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline
          Column(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: bgColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 18, color: color),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [color.withOpacity(0.3), AppColors.border],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 14),

          // Contenu
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppRadius.lg),
                boxShadow: AppShadow.card,
                border: Border.all(color: AppColors.border, width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Badge numéro
                      Container(
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          step.titre,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: AppColors.text,
                          ),
                        ),
                      ),
                      // Badge durée
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(AppRadius.full),
                        ),
                        child: Text(
                          step.duree,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: color,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    step.details,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.textSub,
                      height: 1.45,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _colorFromName(String name) {
    switch (name) {
      case 'green':  return AppColors.green;
      case 'orange': return AppColors.orange;
      case 'red':    return AppColors.red;
      case 'blue':
      default:       return AppColors.primary;
    }
  }

  IconData _iconFromName(String name) {
    switch (name) {
      case 'school':    return Icons.school_rounded;
      case 'work':      return Icons.work_rounded;
      case 'menu_book':
      default:          return Icons.menu_book_rounded;
    }
  }
}

