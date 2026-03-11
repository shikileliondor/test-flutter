
// ─────────────────────────────────────────────────────────────────
// widgets/modern_search_bar.dart
// ─────────────────────────────────────────────────────────────────
import 'package:flutter/material.dart';
import '../app_theme.dart';

class ModernSearchBar extends StatelessWidget {
  const ModernSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: AppShadow.card,
      ),
      child: const TextField(
        style: TextStyle(fontSize: 14, color: AppColors.text),
        decoration: InputDecoration(
          hintText: 'Métier, filière ou école…',
          hintStyle: TextStyle(color: AppColors.textMuted, fontSize: 14),
          prefixIcon: Icon(Icons.search_rounded, color: AppColors.textMuted, size: 20),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}
