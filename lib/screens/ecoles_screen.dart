import 'package:flutter/material.dart';

import '../models/ecole_model.dart';
import '../services/ecole_service.dart';
import '../widgets/ecole_card.dart';
import '../widgets/ecole_filter_chips.dart';
import '../widgets/ecole_search_bar.dart';
import 'ecole_detail_screen.dart';

class EcolesScreen extends StatefulWidget {
  const EcolesScreen({
    super.key,
    required this.ecoleService,
  });

  final EcoleService ecoleService;

  @override
  State<EcolesScreen> createState() => _EcolesScreenState();
}

class _EcolesScreenState extends State<EcolesScreen> {
  final TextEditingController _searchController = TextEditingController();
  late Future<List<EcoleModel>> _ecolesFuture;

  String? _selectedVille;
  String? _selectedDomaine;
  String? _selectedType;

  static const _villes = ['Dakar', 'Abidjan', 'Paris', 'Lyon'];
  static const _domaines = ['Informatique', 'Santé', 'Commerce', 'Ingénierie'];
  static const _types = ['universite', 'grande ecole', 'institut'];

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
    return widget.ecoleService.fetchEcoles(
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
        child: RefreshIndicator(
          onRefresh: () async => _refresh(),
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                    ],
                  ),
                ),
              ),
              FutureBuilder<List<EcoleModel>>(
                future: _ecolesFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  if (snapshot.hasError) {
                    return SliverFillRemaining(
                      hasScrollBody: false,
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
                    );
                  }

                  final ecoles = snapshot.data ?? const <EcoleModel>[];
                  if (ecoles.isEmpty) {
                    return const SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(child: Text('Aucune école trouvée.')),
                    );
                  }

                  return SliverPadding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    sliver: SliverList.separated(
                      itemCount: ecoles.length,
                      itemBuilder: (context, index) {
                        final ecole = ecoles[index];
                        return EcoleCard(
                          ecole: ecole,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (_) => EcoleDetailScreen(ecole: ecole),
                              ),
                            );
                          },
                        );
                      },
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
