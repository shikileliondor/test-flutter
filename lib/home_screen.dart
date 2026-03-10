import 'package:flutter/material.dart';

import 'detail_screen.dart';
import 'widgets/filiere_card.dart';
import 'models/filiere.dart';
import 'services/filiere_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Filiere>> _filieresFuture;
  int _selectedIndex = 0;

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
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 18, 20, 4),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Bonjour, Camille',
                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Explore des parcours adaptés à ton avenir',
                                style: TextStyle(color: Color(0xFF6B7280)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEAF0FF),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Icon(Icons.explore_outlined, color: Color(0xFF4464E0)),
                        ),
                      ],
                    ),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 14)),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverList.builder(
                    itemCount: filieres.length,
                    itemBuilder: (context, index) {
                      final filiere = filieres[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: FiliereCard(
                          filiere: filiere,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (_) => DetailScreen(filiere: filiere),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 100)),
              ],
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
}
