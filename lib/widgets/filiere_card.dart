import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    final icon = _iconFromName(widget.filiere.icone);

    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapCancel: () => setState(() => _pressed = false),
      onTapUp: (_) {
        setState(() => _pressed = false);
        widget.onTap();
      },
      child: AnimatedScale(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        scale: _pressed ? 0.98 : 1,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [
              BoxShadow(
                color: Color(0x14000000),
                blurRadius: 20,
                offset: Offset(0, 8),
              ),
            ],
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 64,
                  height: 64,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF2F6FF),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: const Color(0xFF4464E0), size: 32),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                widget.filiere.nom,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 6),
              Text(
                widget.filiere.niveau,
                style: const TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _iconFromName(String iconName) {
    switch (iconName) {
      case 'medical_services':
        return Icons.medical_services_outlined;
      case 'palette':
        return Icons.palette_outlined;
      case 'computer':
      default:
        return Icons.computer_outlined;
    }
  }
}
