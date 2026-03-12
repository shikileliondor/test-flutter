
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
  int _selectedCategory = 0;

  static const _categories = [
    'Tous',
    'Tech',
    'Santé',
    'Design',
    'Business',
  ];

  @override
  void initState() {
    super.initState();
    _filieresFuture = FiliereRepository().loadFilieres();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF5F7FF), Color(0xFFEEF2FF), Color(0xFFF8F9FC)],
          ),
        ),
        child: SafeArea(
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

                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
                    child: _buildProgressCard(),
                  ),
                ),

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

                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 42,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      scrollDirection: Axis.horizontal,
                      itemCount: _categories.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 10),
                      itemBuilder: (context, index) {
                        final isSelected = _selectedCategory == index;
                        return GestureDetector(
                          onTap: () => setState(() => _selectedCategory = index),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 180),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: isSelected ? AppColors.primary : Colors.white,
                              borderRadius: BorderRadius.circular(AppRadius.full),
                              border: Border.all(
                                color: isSelected
                                    ? AppColors.primary
                                    : const Color(0xFFDCE3FF),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                _categories[index],
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : const Color(0xFF6D7392),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                // ── Filiere cards ────────────────────────────────────
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 14, 20, 100),
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
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF5968EF), Color(0xFF837BF6)],
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
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: const Icon(Icons.auto_awesome_rounded, color: Colors.white, size: 26),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        boxShadow: const [
          BoxShadow(
            color: Color(0x120F1A4A),
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: const [
          _MiniStat(icon: Icons.school_rounded, value: '12', label: 'Parcours'),
          SizedBox(width: 12),
          _MiniStat(icon: Icons.bolt_rounded, value: '38', label: 'Compétences'),
          SizedBox(width: 12),
          _MiniStat(icon: Icons.flag_rounded, value: '3', label: 'Objectifs'),
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
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 54,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppRadius.lg),
              boxShadow: AppShadow.card,
            ),
            child: Row(
              children: const [
                SizedBox(width: 16),
                Icon(Icons.search_rounded, color: AppColors.textMuted, size: 20),
                SizedBox(width: 12),
                Text(
                  'Métier, filière, école…',
                  style: TextStyle(color: AppColors.textMuted, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          width: 54,
          height: 54,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF5D6BF0), Color(0xFF877EF6)],
            ),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            boxShadow: const [
              BoxShadow(
                color: Color(0x335B6AF0),
                blurRadius: 12,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: const Icon(Icons.tune_rounded, color: Colors.white),
        ),
      ],
    );
  }
}

class _MiniStat extends StatelessWidget {
  const _MiniStat({
    required this.icon,
    required this.value,
    required this.label,
  });

  final IconData icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFF4F6FF),
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
        child: Column(
          children: [
            Icon(icon, color: AppColors.primary, size: 18),
            const SizedBox(height: 6),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: AppColors.text,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.textSub,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
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
