
// ─────────────────────────────────────────────────────────────────
// screens/home_screen.dart
// ─────────────────────────────────────────────────────────────────
import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../models/filiere.dart';
import '../models/metier.dart';
import '../services/filiere_repository.dart';
import '../widgets/filiere_card.dart';
import 'metier_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Filiere>> _filieresFuture;

  @override
  void initState() {
    super.initState();
    _filieresFuture = FiliereRepository().loadFilieres();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<Filiere>>(
          future: _filieresFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError || !snapshot.hasData) {
              return const Center(child: Text('Impossible de charger les filières.'));
            }

            final filieres = snapshot.data!;

            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                // ── Header ──────────────────────────────────────────
                SliverToBoxAdapter(child: _buildHeader()),

                // ── Barre de recherche ───────────────────────────────
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: _SearchBar(),
                  ),
                ),

                // ── Section title : Parcours ─────────────────────────
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 22, 20, 14),
                    child: _SectionHeader(
                      title: 'Parcours recommandés',
                      subtitle: 'Choisis un domaine pour commencer',
                    ),
                  ),
                ),

                // ── Filiere cards ────────────────────────────────────
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
                  sliver: SliverList.separated(
                    itemCount: filieres.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, i) {
                      final f = filieres[i];
                      return FiliereCard(
                        filiere: f,
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) => MetierDetailScreen(
                              metier: _buildMetier(f, i),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF5B6AF0), Color(0xFF8B7FF5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppRadius.xl),
        boxShadow: const [
          BoxShadow(
            color: Color(0x405B6AF0),
            blurRadius: 24,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Bonjour, Camille 👋',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Explore des parcours\nadaptés à ton avenir',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xCCFFFFFF),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: const Icon(Icons.explore_rounded, color: Colors.white, size: 26),
          ),
        ],
      ),
    );
  }

  Metier _buildMetier(Filiere f, int i) {
    return Metier(
      id: i + 1,
      nom: f.nom,
      description: f.description,
      salaireMoyen: const SalaireMetier(minimum: 28000, moyen: 42000, maximum: 65000),
      competencesRequises: f.competences,
      filieresEtudes: const ['BTS / BUT lié au domaine', 'Licence professionnelle', 'Master ou école spécialisée'],
      dureeEtudes: f.niveau,
      ecolesRecommandees: f.ecoles.map((e) => '${e.nom} (${e.ville})').toList(),
      icone: f.icone,
      roadmap: RoadmapMetier(
        diplomeRequis: f.niveau,
        competencesAApprendre: f.competences,
        experiencesRecommandees: const [
          'Stages de 3 à 6 mois',
          'Alternance en entreprise',
          'Projets terrain ou freelance',
        ],
      ),
      domaine: 'Technologie',
      niveauRequis: f.niveau,
    );
  }
}

// ── Widgets locaux ────────────────────────────────────────────────
class _SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: AppShadow.card,
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          const Icon(Icons.search_rounded, color: AppColors.textMuted, size: 20),
          const SizedBox(width: 12),
          Text(
            'Métier, filière, école…',
            style: const TextStyle(color: AppColors.textMuted, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, this.subtitle});
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.text,
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 3),
          Text(
            subtitle!,
            style: const TextStyle(fontSize: 13, color: AppColors.textSub),
          ),
        ],
      ],
    );
  }
}
