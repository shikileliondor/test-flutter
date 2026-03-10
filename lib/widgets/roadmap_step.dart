import 'package:flutter/material.dart';

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
    final Color color = _colorFromName(step.couleur);
    final IconData icon = _iconFromName(step.icone);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: color.withOpacity(0.16),
                child: Icon(icon, size: 18, color: color),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    color: const Color(0xFFE5E7EB),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x12000000),
                    blurRadius: 14,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${index + 1}. ${step.titre}',
                    style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                  ),
                  const SizedBox(height: 6),
                  Text(step.duree, style: const TextStyle(color: Color(0xFF4B5563))),
                  const SizedBox(height: 8),
                  Text(step.details, style: const TextStyle(height: 1.4)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _colorFromName(String colorName) {
    switch (colorName) {
      case 'green':
        return const Color(0xFF2BB673);
      case 'orange':
        return const Color(0xFFF59E0B);
      case 'blue':
      default:
        return const Color(0xFF4464E0);
    }
  }

  IconData _iconFromName(String iconName) {
    switch (iconName) {
      case 'school':
        return Icons.school_outlined;
      case 'work':
        return Icons.work_outline;
      case 'menu_book':
      default:
        return Icons.menu_book_outlined;
    }
  }
}
