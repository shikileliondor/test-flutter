import 'package:flutter/material.dart';

import 'models/ecole_model.dart';
import 'models/filiere.dart';
import 'services/filiere_repository.dart';
import 'widgets/ecole_card.dart';
import 'widgets/home_header.dart';
import 'widgets/metier_card.dart';
import 'widgets/modern_search_bar.dart';
import 'widgets/parcours_card.dart';
import 'widgets/section_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Filiere>> _filieresFuture;
  int _selectedIndex = 0;

  final List<_MetierItem> _metiers = const [
    _MetierItem('Développeur Web', Icons.code_rounded, Color(0xFFE3EDFF)),
    _MetierItem('Designer UI/UX', Icons.palette_outlined, Color(0xFFFFE9EF)),
    _MetierItem('Data Analyst', Icons.analytics_outlined, Color(0xFFE8F8EF)),
    _MetierItem('Médecin', Icons.local_hospital_outlined, Color(0xFFFFF1DE)),
    _MetierItem('Architecte', Icons.architecture_outlined, Color(0xFFEEEAFE)),
  ];

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
            final schools = filieres.expand((item) => item.ecoles).toList();

            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeHeader(),
                  const SizedBox(height: 18),
                  const ModernSearchBar(),
                  const SizedBox(height: 28),
                  const SectionTitle(title: 'Métiers populaires'),
                  const SizedBox(height: 12),
                  GridView.builder(
                    itemCount: _metiers.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 1.3,
                    ),
                    itemBuilder: (context, index) {
                      final item = _metiers[index];
                      return MetierCard.compact(
                        icon: item.icon,
                        title: item.label,
                        backgroundColor: item.color,
                      );
                    },
                  ),
                  const SizedBox(height: 28),
                  const SectionTitle(title: 'Parcours recommandés'),
                  const SizedBox(height: 12),
                  ...filieres.take(3).map(
                        (filiere) => ParcoursCard(
                          icon: _iconForFiliere(filiere.icone),
                          domain: filiere.nom,
                          description: filiere.description,
                        ),
                      ),
                  const SizedBox(height: 16),
                  const SectionTitle(title: 'Écoles recommandées'),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 155,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: schools.length >= 4 ? 4 : schools.length,
                      itemBuilder: (context, index) {
                        final school = schools[index];
                        return EcoleCard(
                          ecole: EcoleModel(
                            id: index,
                            nom: school.nom,
                            ville: school.ville,
                            type: 'ecole',
                            domaines: school.formations,
                            filieres: school.formations,
                            logoUrl: '',
                          ),
                          onTap: () {},
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        height: 70,
        surfaceTintColor: Colors.white,
        onDestinationSelected: (index) => setState(() => _selectedIndex = index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Accueil'),
          NavigationDestination(icon: Icon(Icons.work_outline), label: 'Métiers'),
          NavigationDestination(icon: Icon(Icons.school_outlined), label: 'Écoles'),
          NavigationDestination(icon: Icon(Icons.person_outline), label: 'Profil'),
        ],
      ),
    );
  }

  IconData _iconForFiliere(String rawIcon) {
    switch (rawIcon) {
      case 'computer':
        return Icons.computer_rounded;
      case 'biotech':
        return Icons.biotech_outlined;
      case 'architecture':
        return Icons.architecture_rounded;
      case 'business':
        return Icons.business_center_outlined;
      default:
        return Icons.auto_awesome_outlined;
    }
  }
}

class _MetierItem {
  const _MetierItem(this.label, this.icon, this.color);

  final String label;
  final IconData icon;
  final Color color;
}
