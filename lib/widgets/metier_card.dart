import 'package:flutter/material.dart';

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
    if (metier != null) {
      return InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Color(0x12000000),
                blurRadius: 18,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFFE9EEFF),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(_iconFromString(metier!.icone), color: const Color(0xFF2F49B3)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      metier!.nom,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF101828),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      metier!.domaine.isEmpty ? 'Domaine non renseigné' : metier!.domaine,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF667085),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Salaire moyen: ${metier!.salaireFormate}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF344054),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      metier!.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Color(0xFF475467)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF1F2937)),
          ),
          const Spacer(),
          Text(
            title ?? '',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1F2937),
                ),
          ),
        ],
      ),
    );
  }

  IconData _iconFromString(String key) {
    switch (key) {
      case 'engineering':
        return Icons.engineering_outlined;
      case 'science':
        return Icons.science_outlined;
      case 'health':
        return Icons.health_and_safety_outlined;
      case 'business':
        return Icons.business_center_outlined;
      case 'palette':
        return Icons.palette_outlined;
      default:
        return Icons.work_outline;
    }
  }
}
