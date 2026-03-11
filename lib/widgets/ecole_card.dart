import 'package:flutter/material.dart';

class EcoleCard extends StatelessWidget {
  const EcoleCard({
    super.key,
    required this.schoolName,
    required this.city,
    required this.speciality,
  });

  final String schoolName;
  final String city;
  final String speciality;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            schoolName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF111827),
                ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.location_on_outlined, size: 16, color: Color(0xFF6B7280)),
              const SizedBox(width: 4),
              Text(city, style: const TextStyle(color: Color(0xFF6B7280))),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            speciality,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: const Color(0xFF4B5563),
                ),
          ),
        ],
      ),
    );
  }
}
