import 'package:flutter/material.dart';

import '../models/metier.dart';
import '../services/metier_service.dart';
import '../widgets/metier_card.dart';
import '../widgets/metier_filters.dart';
import '../widgets/metier_search_bar.dart';
import '../widgets/metiers_state_widgets.dart';
import 'metier_detail_screen.dart';

class MetiersScreen extends StatefulWidget {
  const MetiersScreen({super.key});

  @override
  State<MetiersScreen> createState() => _MetiersScreenState();
}

class _MetiersScreenState extends State<MetiersScreen> {
  static const _domaines = ['Tous', 'Technologie', 'Santé', 'Business', 'Ingénierie', 'Créatif'];
  static const _durees = ['Toutes', '2 ans', '3 ans', '5 ans', '6+ ans'];
  static const _niveaux = ['Tous', 'Bac', 'Bac+2', 'Bac+3', 'Bac+5'];

  final MetierService _service = MetierService(baseUrl: 'http://localhost:8000/api');

  bool _loading = true;
  String? _error;
  String _search = '';
  String _selectedDomaine = 'Tous';
  String _selectedDuree = 'Toutes';
  String _selectedNiveau = 'Tous';
  List<Metier> _metiers = const [];

  @override
  void initState() {
    super.initState();
    _loadMetiers();
  }

  Future<void> _loadMetiers() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final metiers = await _service.fetchMetiers(
        search: _search,
        domaine: _selectedDomaine == 'Tous' ? null : _selectedDomaine,
        dureeEtudes: _selectedDuree == 'Toutes' ? null : _selectedDuree,
        niveauRequis: _selectedNiveau == 'Tous' ? null : _selectedNiveau,
      );

      if (!mounted) {
        return;
      }
      setState(() {
        _metiers = metiers;
        _loading = false;
      });
    } catch (_) {
      if (!mounted) {
        return;
      }
      setState(() {
        _error = 'Impossible de charger les métiers pour le moment.';
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Métiers'),
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _loadMetiers,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(20, 6, 20, 20),
            children: [
              const Text(
                'Explore les métiers et découvre ton futur.',
                style: TextStyle(color: Color(0xFF667085)),
              ),
              const SizedBox(height: 16),
              MetierSearchBar(
                onChanged: (value) {
                  _search = value;
                  _loadMetiers();
                },
              ),
              const SizedBox(height: 14),
              MetierFilters(
                domaines: _domaines,
                durees: _durees,
                niveaux: _niveaux,
                selectedDomaine: _selectedDomaine,
                selectedDuree: _selectedDuree,
                selectedNiveau: _selectedNiveau,
                onDomaineSelected: (value) {
                  setState(() => _selectedDomaine = value);
                  _loadMetiers();
                },
                onDureeSelected: (value) {
                  setState(() => _selectedDuree = value);
                  _loadMetiers();
                },
                onNiveauSelected: (value) {
                  setState(() => _selectedNiveau = value);
                  _loadMetiers();
                },
              ),
              const SizedBox(height: 18),
              if (_loading)
                const SizedBox(height: 280, child: MetiersLoadingView())
              else if (_error != null)
                SizedBox(
                  height: 280,
                  child: MetiersErrorView(message: _error!, onRetry: _loadMetiers),
                )
              else if (_metiers.isEmpty)
                const SizedBox(height: 280, child: MetiersEmptyView())
              else
                ..._metiers.map(
                  (metier) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: MetierCard(
                      metier: metier,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(builder: (_) => MetierDetailScreen(metier: metier)),
                        );
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
