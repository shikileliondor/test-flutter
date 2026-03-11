import 'package:flutter/material.dart';

import '../models/metier.dart';
import '../widgets/metier_detail/bullet_list_section.dart';
import '../widgets/metier_detail/metier_header.dart';
import '../widgets/metier_detail/roadmap_section.dart';
import '../widgets/metier_detail/salaire_card.dart';

class MetierDetailScreen extends StatelessWidget {
  const MetierDetailScreen({required this.metier, super.key});

  final Metier metier;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final horizontalPadding = screenWidth > 600 ? 24.0 : 18.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Détail métier'),
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          padding: EdgeInsets.fromLTRB(horizontalPadding, 10, horizontalPadding, 24),
          children: [
            MetierHeader(metier: metier),
            const SizedBox(height: 16),
            SalaireCard(salaire: metier.salaireMoyen),
            const SizedBox(height: 14),
            BulletListSection(
              title: 'Compétences requises',
              items: metier.competencesRequises,
              icon: Icons.workspace_premium_outlined,
            ),
            const SizedBox(height: 14),
            BulletListSection(
              title: 'Parcours d’étude',
              items: [...metier.filieresEtudes, 'Durée estimée: ${metier.dureeEtudes}'],
              icon: Icons.menu_book_outlined,
            ),
            const SizedBox(height: 14),
            BulletListSection(
              title: 'Écoles recommandées',
              items: metier.ecolesRecommandees,
              icon: Icons.account_balance_outlined,
            ),
            const SizedBox(height: 14),
            RoadmapSection(roadmap: metier.roadmap),
          ],
        ),
      ),
    );
  }
}
