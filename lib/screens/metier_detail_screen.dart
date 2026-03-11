

// ─────────────────────────────────────────────────────────────────
// screens/metier_detail_screen.dart
// ─────────────────────────────────────────────────────────────────
import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../models/metier.dart';
import '../widgets/metier_detail/bullet_list_section.dart';
import '../widgets/metier_detail/metier_header.dart';
import '../widgets/metier_detail/roadmap_section.dart';
import '../widgets/metier_detail/salaire_card.dart';
import '../widgets/app_bottom_navigation.dart';
import 'main_navigation_screen.dart';

class MetierDetailScreen extends StatelessWidget {
  const MetierDetailScreen({required this.metier, super.key});

  final Metier metier;

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = MediaQuery.sizeOf(context).width > 600 ? 24.0 : 18.0;

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // ── Hero Header ────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Stack(
              children: [
                // Gradient background
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF5B6AF0), Color(0xFF8B7FF5)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                // Back button
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(AppRadius.md),
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                // Title overlay
                Positioned(
                  bottom: 20,
                  left: horizontalPadding,
                  right: horizontalPadding,
                  child: Text(
                    metier.nom,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ── Body ──────────────────────────────────────────────────
          SliverPadding(
            padding: EdgeInsets.fromLTRB(horizontalPadding, 20, horizontalPadding, 40),
            sliver: SliverList.list(
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
                  title: 'Parcours d\'étude',
                  items: [...metier.filieresEtudes, 'Durée estimée : ${metier.dureeEtudes}'],
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
        ],
      ),
      bottomNavigationBar: AppBottomNavigation(
        currentIndex: 1,
        onDestinationSelected: (index) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute<void>(
              builder: (_) => MainNavigationScreen(initialIndex: index),
            ),
            (route) => false,
          );
        },
      ),
    );
  }
}
