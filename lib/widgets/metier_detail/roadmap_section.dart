import 'package:flutter/material.dart';

import '../../models/metier.dart';
import 'section_card.dart';

class RoadmapSection extends StatelessWidget {
  const RoadmapSection({required this.roadmap, super.key});

  final RoadmapMetier roadmap;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Roadmap',
      icon: Icons.route_outlined,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _RoadmapTile(
            title: 'Diplôme requis',
            content: [roadmap.diplomeRequis],
            icon: Icons.school_outlined,
          ),
          _RoadmapTile(
            title: 'Compétences à apprendre',
            content: roadmap.competencesAApprendre,
            icon: Icons.psychology_outlined,
          ),
          _RoadmapTile(
            title: 'Expériences recommandées',
            content: roadmap.experiencesRecommandees,
            icon: Icons.work_history_outlined,
            showDivider: false,
          ),
        ],
      ),
    );
  }
}

class _RoadmapTile extends StatelessWidget {
  const _RoadmapTile({
    required this.title,
    required this.content,
    required this.icon,
    this.showDivider = true,
  });

  final String title;
  final List<String> content;
  final IconData icon;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 2),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFEFF6FF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: const Color(0xFF2563EB), size: 18),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 6),
                  ...content.map((item) => Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text('• $item', style: const TextStyle(color: Color(0xFF334155))),
                      )),
                ],
              ),
            ),
          ],
        ),
        if (showDivider) const Divider(height: 24),
      ],
    );
  }
}
