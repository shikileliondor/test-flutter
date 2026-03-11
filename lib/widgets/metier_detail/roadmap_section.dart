
// ─────────────────────────────────────────────────────────────────
// widgets/metier_detail/roadmap_section.dart
// ─────────────────────────────────────────────────────────────────
import 'package:flutter/material.dart';
import '../../app_theme.dart';
import '../../models/metier.dart';
import 'section_card.dart';

class RoadmapSection extends StatelessWidget {
  const RoadmapSection({required this.roadmap, super.key});

  final RoadmapMetier roadmap;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Roadmap',
      icon: Icons.route_rounded,
      child: Column(
        children: [
          _RoadmapTile(
            index: 0,
            title: 'Diplôme requis',
            items: [roadmap.diplomeRequis],
            icon: Icons.school_rounded,
            color: AppColors.primary,
            bgColor: AppColors.primaryLight,
            isLast: false,
          ),
          _RoadmapTile(
            index: 1,
            title: 'Compétences à apprendre',
            items: roadmap.competencesAApprendre,
            icon: Icons.psychology_rounded,
            color: AppColors.orange,
            bgColor: AppColors.orangeLight,
            isLast: false,
          ),
          _RoadmapTile(
            index: 2,
            title: 'Expériences recommandées',
            items: roadmap.experiencesRecommandees,
            icon: Icons.work_history_rounded,
            color: AppColors.green,
            bgColor: AppColors.greenLight,
            isLast: true,
          ),
        ],
      ),
    );
  }
}

class _RoadmapTile extends StatelessWidget {
  const _RoadmapTile({
    required this.index,
    required this.title,
    required this.items,
    required this.icon,
    required this.color,
    required this.bgColor,
    required this.isLast,
  });

  final int index;
  final String title;
  final List<String> items;
  final IconData icon;
  final Color color;
  final Color bgColor;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline
          Column(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
                child: Icon(icon, size: 17, color: color),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    margin: const EdgeInsets.symmetric(vertical: 4),
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
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Badge numéro
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                        child: Center(
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.text,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ...items.map(
                    (item) => Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 6),
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                              color: color.withOpacity(0.5),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 13,
                                color: AppColors.textSub,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
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
}