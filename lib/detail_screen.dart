import 'package:flutter/material.dart';

import 'models/filiere.dart';
import 'widgets/roadmap_step.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({required this.filiere, super.key});

  final Filiere filiere;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 14, 20, 24),
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                ),
                Expanded(
                  child: Text(
                    filiere.nom,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Description', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            Text(
              filiere.description,
              style: const TextStyle(height: 1.45, color: Color(0xFF374151)),
            ),
            const SizedBox(height: 10),
            Text(
              'Taille du métier: ${filiere.tailleMetier}',
              style: const TextStyle(color: Color(0xFF6B7280), fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 18),
            const Text('Compétences clés', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: filiere.competences
                  .map(
                    (skill) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFF4FF),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(skill),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 22),
            const Text('Roadmap', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 10),
            ...filiere.roadmap.asMap().entries.map(
                  (entry) => RoadmapStep(
                    step: entry.value,
                    index: entry.key,
                    isLast: entry.key == filiere.roadmap.length - 1,
                  ),
                ),
            const SizedBox(height: 10),
            const Text('Écoles recommandées', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 12),
            SizedBox(
              height: 170,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: filiere.ecoles.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final ecole = filiere.ecoles[index];
                  return Container(
                    width: 230,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
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
                        Text(ecole.nom, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                        const SizedBox(height: 4),
                        Text(ecole.ville, style: const TextStyle(color: Color(0xFF6B7280))),
                        const SizedBox(height: 8),
                        ...ecole.formations.map(
                          (formation) => Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Text('• $formation', style: const TextStyle(fontSize: 13)),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
