


// ─────────────────────────────────────────────────────────────────
// screens/ecoles_screen.dart
// ─────────────────────────────────────────────────────────────────
import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../models/ecole_model.dart';
import '../services/ecole_service.dart';
import '../widgets/ecole_card.dart';
import '../widgets/ecole_filter_chips.dart';
import '../widgets/ecole_search_bar.dart';
import 'ecole_detail_screen.dart';

class EcolesScreen extends StatefulWidget {
  const EcolesScreen({super.key});

  @override
  State<EcolesScreen> createState() => _EcolesScreenState();
}

class _EcolesScreenState extends State<EcolesScreen> {
  final TextEditingController _searchController = TextEditingController();
  final EcoleService _ecoleService = EcoleService();
  late Future<List<EcoleModel>> _ecolesFuture;

  String? _selectedVille;
  String? _selectedDomaine;
  String? _selectedType;

  static const _villes    = ['Abidjan', 'Bouaké', 'Yamoussoukro'];
  static const _domaines  = ['Technologie', 'Ingénierie', 'Santé', 'Business', 'Créatif'];
  static const _types     = ['Université', 'Grande école', 'Institut'];

  @override
  void initState() {
    super.initState();
    _ecolesFuture = _loadEcoles();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<List<EcoleModel>> _loadEcoles() {
    return _ecoleService.fetchEcoles(
      search:  _searchController.text,
      ville:   _selectedVille,
      domaine: _selectedDomaine,
      type:    _selectedType,
    );
  }

  void _refresh() => setState(() => _ecolesFuture = _loadEcoles());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          color: AppColors.primary,
          onRefresh: () async => _refresh(),
          child: FutureBuilder<List<EcoleModel>>(
            future: _ecolesFuture,
            builder: (context, snapshot) {
              return ListView(
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 100),
                children: [
                  // ── Header ──────────────────────────────────────
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Écoles',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w800,
                                color: AppColors.text,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Les meilleures formations de CI',
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
                        child: const Icon(Icons.location_on_outlined, color: AppColors.primary, size: 20),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // ── Search ──────────────────────────────────────
                  EcoleSearchBar(
                    controller: _searchController,
                    onChanged: (_) => _refresh(),
                  ),
                  const SizedBox(height: 16),

                  // ── Filters ─────────────────────────────────────
                  EcoleFilterChips(
                    label: 'Ville',
                    options: _villes,
                    selectedValue: _selectedVille,
                    onSelected: (v) { _selectedVille = v; _refresh(); },
                  ),
                  const SizedBox(height: 10),
                  EcoleFilterChips(
                    label: 'Domaine',
                    options: _domaines,
                    selectedValue: _selectedDomaine,
                    onSelected: (v) { _selectedDomaine = v; _refresh(); },
                  ),
                  const SizedBox(height: 10),
                  EcoleFilterChips(
                    label: "Type d'établissement",
                    options: _types,
                    selectedValue: _selectedType,
                    onSelected: (v) { _selectedType = v; _refresh(); },
                  ),
                  const SizedBox(height: 22),

                  // ── Content ─────────────────────────────────────
                  ..._buildContent(snapshot),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  List<Widget> _buildContent(AsyncSnapshot<List<EcoleModel>> snap) {
    if (snap.connectionState != ConnectionState.done) {
      return const [SizedBox(height: 280, child: Center(child: CircularProgressIndicator()))];
    }
    if (snap.hasError) {
      return [
        SizedBox(
          height: 280,
          child: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              const Text('Une erreur est survenue.'),
              const SizedBox(height: 12),
              ElevatedButton(onPressed: _refresh, child: const Text('Réessayer')),
            ]),
          ),
        ),
      ];
    }
    final ecoles = snap.data ?? const <EcoleModel>[];
    if (ecoles.isEmpty) {
      return const [SizedBox(height: 280, child: Center(child: Text('Aucune école trouvée.')))];
    }
    return ecoles.map((e) => Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: EcoleCard(
        ecole: e,
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute<void>(builder: (_) => EcoleDetailScreen(ecole: e)),
        ),
      ),
    )).toList();
  }
}