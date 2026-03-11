

// ─────────────────────────────────────────────────────────────────
// widgets/filiere_card.dart
// ─────────────────────────────────────────────────────────────────
import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../models/filiere.dart';

class FiliereCard extends StatefulWidget {
  const FiliereCard({
    required this.filiere,
    required this.onTap,
    super.key,
  });

  final Filiere filiere;
  final VoidCallback onTap;

  @override
  State<FiliereCard> createState() => _FiliereCardState();
}

class _FiliereCardState extends State<FiliereCard> {
  bool _pressed = false;

  // Associe un couple couleur de fond / couleur d'icône à chaque icône
  static const _palette = {
    'computer':          (Color(0xFFEEF0FF), AppColors.primary),
    'medical_services':  (Color(0xFFFFF0F0), AppColors.red),
    'palette':           (Color(0xFFFCE8F3), Color(0xFFE83E8C)),
    'business':          (Color(0xFFFFF4E5), AppColors.orange),
    'architecture':      (Color(0xFFE6FAF4), AppColors.green),
    'biotech':           (Color(0xFFE6FAF4), AppColors.green),
  };

  @override
  Widget build(BuildContext context) {
    final icon = _iconFromName(widget.filiere.icone);
    final colors = _palette[widget.filiere.icone] ??
        const (AppColors.primaryLight, AppColors.primary);

    return GestureDetector(
      onTapDown:  (_) => setState(() => _pressed = true),
      onTapCancel: () => setState(() => _pressed = false),
      onTapUp:    (_) { setState(() => _pressed = false); widget.onTap(); },
      child: AnimatedScale(
        duration: const Duration(milliseconds: 160),
        curve: Curves.easeOut,
        scale: _pressed ? 0.97 : 1.0,
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.xl),
            boxShadow: AppShadow.card,
          ),
          child: Row(
            children: [
              // Icône colorée
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: colors.$1,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                child: Icon(icon, color: colors.$2, size: 26),
              ),
              const SizedBox(width: 16),

              // Texte
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.filiere.nom,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.text,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.filiere.niveau,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.textSub,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Compétences mini-chips
                    if (widget.filiere.competences.isNotEmpty)
                      Wrap(
                        spacing: 6,
                        runSpacing: 4,
                        children: widget.filiere.competences.take(3).map((c) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: colors.$1,
                              borderRadius: BorderRadius.circular(AppRadius.full),
                            ),
                            child: Text(
                              c,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: colors.$2,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted, size: 20),
            ],
          ),
        ),
      ),
    );
  }

  IconData _iconFromName(String name) {
    switch (name) {
      case 'medical_services': return Icons.medical_services_outlined;
      case 'palette':          return Icons.palette_outlined;
      case 'business':         return Icons.business_center_outlined;
      case 'architecture':     return Icons.architecture_outlined;
      case 'biotech':          return Icons.biotech_outlined;
      case 'computer':
      default:                 return Icons.computer_rounded;
    }
  }
}
