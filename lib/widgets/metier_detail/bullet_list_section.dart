

// ─────────────────────────────────────────────────────────────────
// widgets/metier_detail/bullet_list_section.dart
// ─────────────────────────────────────────────────────────────────
import 'package:flutter/material.dart';
import '../../app_theme.dart';
import 'section_card.dart';

class BulletListSection extends StatelessWidget {
  const BulletListSection({
    required this.title,
    required this.items,
    required this.icon,
    super.key,
  });

  final String title;
  final List<String> items;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: title,
      icon: icon,
      child: Column(
        children: items.asMap().entries.map((e) {
          final isLast = e.key == items.length - 1;
          return Padding(
            padding: EdgeInsets.only(bottom: isLast ? 0 : 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icône check
                Container(
                  margin: const EdgeInsets.only(top: 1),
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: AppColors.greenLight,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check_rounded,
                    size: 12,
                    color: AppColors.green,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    e.value,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.4,
                      color: AppColors.text,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
