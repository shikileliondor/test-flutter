import 'package:flutter/material.dart';

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
        _buildSection('Domaine', domaines, selectedDomaine, onDomaineSelected),
        const SizedBox(height: 10),
        _buildSection('Durée des études', durees, selectedDuree, onDureeSelected),
        const SizedBox(height: 10),
        _buildSection('Niveau requis', niveaux, selectedNiveau, onNiveauSelected),
      ],
    );
  }

  Widget _buildSection(
    String title,
    List<String> options,
    String selected,
    ValueChanged<String> onSelected,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xFF344054),
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 6,
          children: options
              .map(
                (option) => FilterChip(
                  selected: selected == option,
                  label: Text(option),
                  onSelected: (_) => onSelected(option),
                  backgroundColor: Colors.white,
                  selectedColor: const Color(0xFFE9EEFF),
                  side: BorderSide(
                    color: selected == option ? const Color(0xFF4464E0) : const Color(0xFFD0D5DD),
                  ),
                  labelStyle: TextStyle(
                    color: selected == option ? const Color(0xFF2F49B3) : const Color(0xFF344054),
                    fontWeight: FontWeight.w500,
                  ),
                  showCheckmark: false,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
