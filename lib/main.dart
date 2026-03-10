import 'package:flutter/material.dart';

import 'models/filiere.dart';
import 'models/metier.dart';
import 'services/filiere_repository.dart';

void main() {
  runApp(const ParcoursApp());
}

/// Widget racine de l'application Parcours.
class ParcoursApp extends StatelessWidget {
  const ParcoursApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parcours',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C63FF),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F8FC),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}

/// 1) Écran d'accueil avec logo, message de bienvenue et boutons Login / Sign Up.
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              // Logo simple basé sur une icône circulaire.
              const CircleAvatar(
                radius: 44,
                backgroundColor: Color(0xFFE7E9FF),
                child: Icon(Icons.explore_rounded, size: 42, color: Color(0xFF6C63FF)),
              ),
              const SizedBox(height: 16),
              const Text(
                'Parcours',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Text(
                'Bienvenue sur Parcours.\nDécouvrez votre orientation idéale.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (_) => const InterestsSelectionScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text('Login'),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (_) => const InterestsSelectionScreen(),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 2) Écran de sélection des centres d'intérêt (recherche + choix multiple).
class InterestsSelectionScreen extends StatefulWidget {
  const InterestsSelectionScreen({super.key});

  @override
  State<InterestsSelectionScreen> createState() => _InterestsSelectionScreenState();
}

class _InterestsSelectionScreenState extends State<InterestsSelectionScreen> {
  final List<String> _allInterests = [
    'Maths',
    'Sciences',
    'Arts',
    'Informatique',
    'Littérature',
    'Santé',
    'Économie',
    'Communication',
    'Droit',
    'Design',
  ];

  final Set<String> _selectedInterests = <String>{};
  String _search = '';

  @override
  Widget build(BuildContext context) {
    final filtered = _allInterests
        .where((item) => item.toLowerCase().contains(_search.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Centres d\'intérêt')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Barre de recherche pour filtrer les centres d'intérêt.
            TextField(
              decoration: InputDecoration(
                hintText: 'Rechercher une matière...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) => setState(() => _search = value),
            ),
            const SizedBox(height: 16),
            const Text(
              'Sélectionnez vos intérêts :',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            // Liste de tags cliquables (choix multiple via FilterChip).
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: filtered
                      .map(
                        (interest) => FilterChip(
                          label: Text(interest),
                          selected: _selectedInterests.contains(interest),
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                _selectedInterests.add(interest);
                              } else {
                                _selectedInterests.remove(interest);
                              }
                            });
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _selectedInterests.isEmpty
                    ? null
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (_) => RecommendationsScreen(
                              selectedInterests: _selectedInterests.toList(),
                            ),
                          ),
                        );
                      },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text('Voir mes recommandations'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 3) Écran de recommandations: affiche les filières compatibles sous forme de cartes.
class RecommendationsScreen extends StatelessWidget {
  RecommendationsScreen({super.key, required this.selectedInterests});

  final List<String> selectedInterests;
  final FiliereRepository _repository = FiliereRepository();

  bool _isMatch(Filiere filiere) {
    return filiere.interets.any(
      (interest) => selectedInterests.contains(interest),
    );
  }


  IconData _iconForFiliere(String iconName) {
    switch (iconName) {
      case 'computer':
        return Icons.computer_rounded;
      case 'science':
        return Icons.science_rounded;
      case 'palette':
        return Icons.palette_rounded;
      default:
        return Icons.school_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recommandations')),
      body: FutureBuilder<List<Filiere>>(
        future: _repository.loadFilieres(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Erreur de chargement : ${snapshot.error}'),
            );
          }

          final matches = (snapshot.data ?? []).where(_isMatch).toList();

          if (matches.isEmpty) {
            return const Center(
              child: Text(
                'Aucune filière trouvée pour ces intérêts.',
                textAlign: TextAlign.center,
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: matches.length,
            itemBuilder: (context, index) {
              final filiere = matches[index];

              return Card(
                elevation: 1,
                margin: const EdgeInsets.only(bottom: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                child: InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () {
                    final firstMetier = filiere.metiers.first;
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (_) => MetierDetailsScreen(
                          metier: firstMetier,
                          filiereName: filiere.nom,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                width: 56,
                                height: 56,
                                color: const Color(0xFFEFF1FF),
                                child: Icon(
                                  _iconForFiliere(filiere.iconName),
                                  color: const Color(0xFF6C63FF),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                filiere.nom,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Métiers principaux :',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 6),
                        ...filiere.metiers.map(
                          (metier) => Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Text('• ${metier.titre} — ${metier.niveau}'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

/// 4) Écran de détail métier avec description, filière et niveau d'études.
class MetierDetailsScreen extends StatelessWidget {
  const MetierDetailsScreen({
    super.key,
    required this.metier,
    required this.filiereName,
  });

  final Metier metier;
  final String filiereName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(metier.titre)),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              metier.titre,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 14),
            Text(metier.description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            _InfoLine(label: 'Filière associée', value: filiereName),
            _InfoLine(label: 'Niveau d\'études requis', value: metier.niveau),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                child: const Text('Voir filière complète'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Widget utilitaire pour afficher une ligne de détail label + valeur.
class _InfoLine extends StatelessWidget {
  const _InfoLine({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: [
            TextSpan(
              text: '$label : ',
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}
