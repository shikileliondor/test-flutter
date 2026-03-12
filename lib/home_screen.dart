// screens/home_screen.dart
import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../models/filiere.dart';
import '../models/metier.dart';
import '../services/filiere_repository.dart';
import '../widgets/filiere_card.dart';
import '../screens/metier_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Filiere>> _filieresFuture;

  // Domaines populaires (grille)
  static const _domaines = [
    _DomaineItem('Technologie', Icons.computer_rounded,         Color(0xFFEEF0FF), AppColors.primary),
    _DomaineItem('Santé',       Icons.local_hospital_rounded,   Color(0xFFFFF0F0), AppColors.red),
    _DomaineItem('Business',    Icons.business_center_rounded,  Color(0xFFFFF4E5), AppColors.orange),
    _DomaineItem('Design',      Icons.palette_rounded,          Color(0xFFFCE8F3), Color(0xFFE83E8C)),
    _DomaineItem('Ingénierie',  Icons.architecture_rounded,     Color(0xFFE6FAF4), AppColors.green),
    _DomaineItem('Droit',       Icons.balance_rounded,          Color(0xFFF5F0FF), Color(0xFF7C3AED)),
  ];

  @override
  void initState() {
    super.initState();
    _filieresFuture = FiliereRepository().loadFilieres();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: FutureBuilder<List<Filiere>>(
        future: _filieresFuture,
        builder: (context, snapshot) {
          final filieres = snapshot.data ?? [];

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Zone bleue (header + search) ────────────────────
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF5B6AF0), Color(0xFF7B89F4)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                  ),
                  child: SafeArea(
                    bottom: false,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
                      child: Column(
                        children: [
                          // ── Ligne avatar / notif ─────────────────
                          Row(
                            children: [
                              // Avatar
                              Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.25),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.5),
                                    width: 2,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.person_rounded,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),
                              const SizedBox(width: 12),

                              // Texte salutation
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: const [
                                        Text(
                                          'Bonjour, Camille ',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text('👋', style: TextStyle(fontSize: 16)),
                                      ],
                                    ),
                                    const SizedBox(height: 2),
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.location_on_rounded,
                                          size: 12,
                                          color: Color(0xCCFFFFFF),
                                        ),
                                        SizedBox(width: 3),
                                        Text(
                                          'Abidjan, Côte d\'Ivoire',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xCCFFFFFF),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              // Cloche notif
                              Container(
                                width: 42,
                                height: 42,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(AppRadius.md),
                                ),
                                child: const Icon(
                                  Icons.notifications_none_rounded,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),

                          // ── Barre de recherche ───────────────────
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(AppRadius.lg),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color(0x20000000),
                                        blurRadius: 12,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: const TextField(
                                    style: TextStyle(fontSize: 14, color: AppColors.text),
                                    decoration: InputDecoration(
                                      hintText: 'Chercher un métier ou une école…',
                                      hintStyle: TextStyle(
                                        color: AppColors.textMuted,
                                        fontSize: 13,
                                      ),
                                      prefixIcon: Icon(
                                        Icons.search_rounded,
                                        color: AppColors.textMuted,
                                        size: 20,
                                      ),
                                      border: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 15),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),

                              // Bouton filtre
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(AppRadius.md),
                                ),
                                child: const Icon(
                                  Icons.tune_rounded,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // ── Hero Banner ──────────────────────────────────────
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 160,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF1A1A3E), Color(0xFF3D4DC4)],
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
                    child: Stack(
                      children: [
                        // Cercles décoratifs
                        Positioned(
                          right: -20,
                          top: -20,
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.06),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 60,
                          bottom: -30,
                          child: Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.05),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),

                        // Contenu textuel
                        Padding(
                          padding: const EdgeInsets.all(22),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Trouve ton métier\nde rêve 🚀',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  height: 1.3,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Explore + de 50 métiers disponibles\nen Côte d\'Ivoire',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xCCFFFFFF),
                                  height: 1.4,
                                ),
                              ),
                              const SizedBox(height: 14),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.circular(AppRadius.full),
                                  ),
                                  child: const Text(
                                    'Explorer →',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Illustration droite
                        Positioned(
                          right: 16,
                          bottom: 0,
                          top: 0,
                          child: Center(
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.15),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.explore_rounded,
                                size: 42,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                // ── Domaines populaires ──────────────────────────────
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Domaines populaires',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: AppColors.text,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Voir tout',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),

                // Grille 3 colonnes
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _domaines.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 1.0,
                    ),
                    itemBuilder: (context, i) {
                      final d = _domaines[i];
                      return _DomaineCard(item: d);
                    },
                  ),
                ),

                const SizedBox(height: 28),

                // ── Parcours recommandés ─────────────────────────────
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Parcours recommandés',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: AppColors.text,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Voir tout',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),

                // Cards filières en scroll horizontal
                if (snapshot.connectionState != ConnectionState.done)
                  const SizedBox(
                    height: 130,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                        strokeWidth: 2,
                      ),
                    ),
                  )
                else
                  SizedBox(
                    height: 130,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: filieres.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, i) {
                        final f = filieres[i];
                        return GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (_) => MetierDetailScreen(
                                metier: _buildMetier(f, i),
                              ),
                            ),
                          ),
                          child: _ParcoursHorizontalCard(filiere: f),
                        );
                      },
                    ),
                  ),

                const SizedBox(height: 100),
              ],
            ),
          );
        },
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
      filieresEtudes: const [
        'BTS / BUT lié au domaine',
        'Licence professionnelle',
        'Master ou école spécialisée',
      ],
      dureeEtudes: f.niveau,
      ecolesRecommandees:
          f.ecoles.map((e) => '${e.nom} (${e.ville})').toList(),
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


// ─── Widget : carte domaine (grille) ─────────────────────────────
class _DomaineCard extends StatelessWidget {
  const _DomaineCard({required this.item});
  final _DomaineItem item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          boxShadow: AppShadow.card,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: item.bgColor,
                shape: BoxShape.circle,
              ),
              child: Icon(item.icon, color: item.iconColor, size: 22),
            ),
            const SizedBox(height: 8),
            Text(
              item.label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// ─── Widget : carte parcours horizontale ─────────────────────────
class _ParcoursHorizontalCard extends StatelessWidget {
  const _ParcoursHorizontalCard({required this.filiere});
  final Filiere filiere;

  static const _iconMap = {
    'computer':         (Icons.computer_rounded,        Color(0xFFEEF0FF), AppColors.primary),
    'medical_services': (Icons.medical_services_rounded, Color(0xFFFFF0F0), AppColors.red),
    'palette':          (Icons.palette_rounded,          Color(0xFFFCE8F3), Color(0xFFE83E8C)),
    'business':         (Icons.business_center_rounded,  Color(0xFFFFF4E5), AppColors.orange),
    'architecture':     (Icons.architecture_rounded,     Color(0xFFE6FAF4), AppColors.green),
    'biotech':          (Icons.biotech_rounded,          Color(0xFFE6FAF4), AppColors.green),
  };

  @override
  Widget build(BuildContext context) {
    final data = _iconMap[filiere.icone] ??
        const (Icons.work_outline_rounded, AppColors.primaryLight, AppColors.primary);

    return Container(
      width: 160,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: AppShadow.card,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: data.$2,
              borderRadius: BorderRadius.circular(AppRadius.sm),
            ),
            child: Icon(data.$1, color: data.$3, size: 20),
          ),
          const Spacer(),
          Text(
            filiere.nom,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: AppColors.text,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            filiere.niveau,
            style: const TextStyle(
              fontSize: 11,
              color: AppColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}


// ─── Modèle interne ──────────────────────────────────────────────
class _DomaineItem {
  const _DomaineItem(this.label, this.icon, this.bgColor, this.iconColor);
  final String label;
  final IconData icon;
  final Color bgColor;
  final Color iconColor;
}