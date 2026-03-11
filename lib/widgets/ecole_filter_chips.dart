import 'package:flutter/material.dart';

class EcoleFilterChips extends StatelessWidget {
  const EcoleFilterChips({
    super.key,
    required this.label,
    required this.options,
    required this.selectedValue,
    required this.onSelected,
  });

  final String label;
  final List<String> options;
  final String? selectedValue;
  final ValueChanged<String?> onSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: const Color(0xFF6B7280),
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ChoiceChip(
              label: const Text('Tous'),
              selected: selectedValue == null,
              onSelected: (_) => onSelected(null),
            ),
            ...options.map(
              (option) => ChoiceChip(
                label: Text(option),
                selected: selectedValue == option,
                onSelected: (_) => onSelected(option),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
