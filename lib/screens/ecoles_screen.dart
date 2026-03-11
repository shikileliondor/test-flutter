import 'package:flutter/material.dart';

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

  static const _villes = ['Paris', 'Lyon', 'La Défense'];
  static const _domaines = ['Technologie', 'Ingénierie', 'Santé', 'Business', 'Créatif'];
  static const _types = ['Université', 'Grande école', 'Institut'];

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
      search: _searchController.text,
      ville: _selectedVille,
      domaine: _selectedDomaine,
      type: _selectedType,
    );
  }

  void _refresh() {
    setState(() {
      _ecolesFuture = _loadEcoles();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Écoles')),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final horizontalPadding = constraints.maxWidth > 600 ? 24.0 : 20.0;

            return RefreshIndicator(
              onRefresh: () async => _refresh(),
              child: FutureBuilder<List<EcoleModel>>(
                future: _ecolesFuture,
                builder: (context, snapshot) {
                  return ListView(
                    physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                    padding: EdgeInsets.fromLTRB(horizontalPadding, 12, horizontalPadding, 20),
                    children: [
                      Text(
                        'Écoles',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Découvre les écoles et universités qui forment les professionnels de demain.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: const Color(0xFF6B7280),
                            ),
                      ),
                      const SizedBox(height: 18),
                      EcoleSearchBar(
                        controller: _searchController,
                        onChanged: (_) => _refresh(),
                      ),
                      const SizedBox(height: 16),
                      EcoleFilterChips(
                        label: 'Ville',
                        options: _villes,
                        selectedValue: _selectedVille,
                        onSelected: (value) {
                          _selectedVille = value;
                          _refresh();
                        },
                      ),
                      const SizedBox(height: 12),
                      EcoleFilterChips(
                        label: 'Domaine',
                        options: _domaines,
                        selectedValue: _selectedDomaine,
                        onSelected: (value) {
                          _selectedDomaine = value;
                          _refresh();
                        },
                      ),
                      const SizedBox(height: 12),
                      EcoleFilterChips(
                        label: 'Type d\'établissement',
                        options: _types,
                        selectedValue: _selectedType,
                        onSelected: (value) {
                          _selectedType = value;
                          _refresh();
                        },
                      ),
                      const SizedBox(height: 18),
                      ..._buildEcolesContent(snapshot),
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  List<Widget> _buildEcolesContent(AsyncSnapshot<List<EcoleModel>> snapshot) {
    if (snapshot.connectionState != ConnectionState.done) {
      return const [
        SizedBox(
          height: 280,
          child: Center(child: CircularProgressIndicator()),
        ),
      ];
    }

    if (snapshot.hasError) {
      return [
        SizedBox(
          height: 280,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Une erreur est survenue lors du chargement.'),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: _refresh,
                  child: const Text('Réessayer'),
                ),
              ],
            ),
          ),
        ),
      ];
    }

    final ecoles = snapshot.data ?? const <EcoleModel>[];
    if (ecoles.isEmpty) {
      return const [
        SizedBox(
          height: 280,
          child: Center(child: Text('Aucune école trouvée.')),
        ),
      ];
    }

    return [
      ...ecoles.map(
        (ecole) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: EcoleCard(
            ecole: ecole,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => EcoleDetailScreen(ecole: ecole),
                ),
              );
            },
          ),
        ),
      ),
    ];
  }
}
