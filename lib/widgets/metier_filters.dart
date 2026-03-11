
// ─────────────────────────────────────────────────────────────────
// widgets/metier_filters.dart
// ─────────────────────────────────────────────────────────────────
import 'package:flutter/material.dart';
import '../app_theme.dart';

class MetierFilters extends StatelessWidget {
  const MetierFilters({
    required this.domaines,
    required this.durees,
    required this.niveaux,
    required this.selectedDomaine,
    required this.selectedDuree,
    required this.selectedNiveau,
    required this.onDomaineSelected,
    required this.onDureeSelected,
    required this.onNiveauSelected,
    super.key,
  });

  final List<String> domaines;
  final List<String> durees;
  final List<String> niveaux;
  final String selectedDomaine;
  final String selectedDuree;
  final String selectedNiveau;
  final ValueChanged<String> onDomaineSelected;
  final ValueChanged<String> onDureeSelected;
  final ValueChanged<String> onNiveauSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FilterRow(
          label: 'Domaine',
          options: domaines,
          selected: selectedDomaine,
          onSelected: onDomaineSelected,
        ),
        const SizedBox(height: 10),
        _FilterRow(
          label: 'Durée',
          options: durees,
          selected: selectedDuree,
          onSelected: onDureeSelected,
        ),
        const SizedBox(height: 10),
        _FilterRow(
          label: 'Niveau',
          options: niveaux,
          selected: selectedNiveau,
          onSelected: onNiveauSelected,
        ),
      ],
    );
  }
}

class _FilterRow extends StatelessWidget {
  const _FilterRow({
    required this.label,
    required this.options,
    required this.selected,
    required this.onSelected,
  });

  final String label;
  final List<String> options;
  final String selected;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.textSub,
            letterSpacing: 0.3,
          ),
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: options.map((opt) {
              final isSelected = selected == opt;
              return GestureDetector(
                onTap: () => onSelected(opt),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primary : AppColors.surface,
                    borderRadius: BorderRadius.circular(AppRadius.full),
                    boxShadow: isSelected ? [] : AppShadow.card,
                  ),
                  child: Text(
                    opt,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : AppColors.textSub,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

