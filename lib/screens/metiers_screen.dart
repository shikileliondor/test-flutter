import 'package:flutter/material.dart';
import '../app_theme.dart';
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
  static const _durees   = ['Toutes', '3 ans', '3 à 5 ans', '5 ans', '6+ ans'];
  static const _niveaux  = ['Tous', 'Bac', 'Bac+2', 'Bac+3', 'Bac+5'];

  final MetierService _service = MetierService();

  bool _loading = true;
  String? _error;
  String _search = '';
  String _selectedDomaine = 'Tous';
  String _selectedDuree   = 'Toutes';
  String _selectedNiveau  = 'Tous';
  List<Metier> _metiers   = const [];

  @override
  void initState() {
    super.initState();
    _loadMetiers();
  }

  Future<void> _loadMetiers() async {
    setState(() { _loading = true; _error = null; });
    try {
      final metiers = await _service.fetchMetiers(
        search:       _search,
        domaine:      _selectedDomaine == 'Tous'    ? null : _selectedDomaine,
        dureeEtudes:  _selectedDuree   == 'Toutes'  ? null : _selectedDuree,
        niveauRequis: _selectedNiveau  == 'Tous'    ? null : _selectedNiveau,
      );
      if (!mounted) return;
      setState(() { _metiers = metiers; _loading = false; });
    } catch (_) {
      if (!mounted) return;
      setState(() { _error = 'Impossible de charger les métiers.'; _loading = false; });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          color: AppColors.primary,
          onRefresh: _loadMetiers,
          child: ListView(
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 100),
            children: [
              // ── Header ────────────────────────────────────────────
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Métiers',
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: AppColors.text),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Explore et découvre ton futur',
                          style: TextStyle(fontSize: 14, color: AppColors.textSub),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      borderRadius: BorderRadius.circular(AppRadius.md),
                    ),
                    child: const Icon(Icons.tune_rounded, color: AppColors.primary, size: 20),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // ── Search ────────────────────────────────────────────
              MetierSearchBar(
                onChanged: (v) { _search = v; _loadMetiers(); },
              ),
              const SizedBox(height: 16),

              // ── Filters ───────────────────────────────────────────
              MetierFilters(
                domaines: _domaines,
                durees: _durees,
                niveaux: _niveaux,
                selectedDomaine: _selectedDomaine,
                selectedDuree: _selectedDuree,
                selectedNiveau: _selectedNiveau,
                onDomaineSelected: (v) { setState(() => _selectedDomaine = v); _loadMetiers(); },
                onDureeSelected:   (v) { setState(() => _selectedDuree   = v); _loadMetiers(); },
                onNiveauSelected:  (v) { setState(() => _selectedNiveau  = v); _loadMetiers(); },
              ),
              const SizedBox(height: 22),

              // ── Content ───────────────────────────────────────────
              if (_loading)
                const SizedBox(height: 300, child: MetiersLoadingView())
              else if (_error != null)
                SizedBox(height: 300, child: MetiersErrorView(message: _error!, onRetry: _loadMetiers))
              else if (_metiers.isEmpty)
                const SizedBox(height: 300, child: MetiersEmptyView())
              else
                ..._metiers.map(
                  (m) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: MetierCard(
                      metier: m,
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => MetierDetailScreen(metier: m),
                        ),
                      ),
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