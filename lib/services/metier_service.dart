import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/metier.dart';
import 'mock_data.dart';

class MetierService {
  MetierService({
    this.baseUrl,
    this.useMockData = true,
    http.Client? client,
  }) : _client = client ?? http.Client();

  final String? baseUrl;
  final bool useMockData;
  final http.Client _client;

  Future<List<Metier>> fetchMetiers({
    String? search,
    String? domaine,
    String? dureeEtudes,
    String? niveauRequis,
  }) async {
    if (useMockData) {
      return _filterMockData(
        search: search,
        domaine: domaine,
        dureeEtudes: dureeEtudes,
        niveauRequis: niveauRequis,
      );
    }

    final uri = Uri.parse('$baseUrl/metiers').replace(
      queryParameters: {
        if (search != null && search.isNotEmpty) 'search': search,
        if (domaine != null && domaine.isNotEmpty) 'domaine': domaine,
        if (dureeEtudes != null && dureeEtudes.isNotEmpty) 'duree_etudes': dureeEtudes,
        if (niveauRequis != null && niveauRequis.isNotEmpty) 'niveau_requis': niveauRequis,
      },
    );

    final response = await _client.get(uri).timeout(const Duration(seconds: 10));

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('Erreur API: ${response.statusCode}');
    }

    final payload = jsonDecode(response.body);
    final data = payload is Map<String, dynamic>
        ? payload['data'] as List<dynamic>? ?? const <dynamic>[]
        : payload as List<dynamic>? ?? const <dynamic>[];

    return data.whereType<Map<String, dynamic>>().map(Metier.fromJson).toList();
  }

  Future<Metier> fetchMetierById(int id) async {
    if (useMockData) {
      return MockData.metiers.firstWhere((metier) => metier.id == id);
    }

    final response = await _client.get(Uri.parse('$baseUrl/metiers/$id'));

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('Erreur API: ${response.statusCode}');
    }

    final payload = jsonDecode(response.body) as Map<String, dynamic>;
    return Metier.fromJson(payload['data'] as Map<String, dynamic>? ?? payload);
  }

  List<Metier> _filterMockData({
    String? search,
    String? domaine,
    String? dureeEtudes,
    String? niveauRequis,
  }) {
    final normalizedSearch = (search ?? '').trim().toLowerCase();

    return MockData.metiers.where((metier) {
      final searchMatches = normalizedSearch.isEmpty ||
          metier.nom.toLowerCase().contains(normalizedSearch) ||
          metier.description.toLowerCase().contains(normalizedSearch);

      final domaineMatches = domaine == null || domaine.isEmpty || metier.domaine == domaine;
      final dureeMatches = dureeEtudes == null ||
          dureeEtudes.isEmpty ||
          metier.dureeEtudes == dureeEtudes ||
          (dureeEtudes == '6+ ans' && metier.dureeEtudes.contains('6+'));
      final niveauMatches =
          niveauRequis == null || niveauRequis.isEmpty || metier.niveauRequis == niveauRequis;

      return searchMatches && domaineMatches && dureeMatches && niveauMatches;
    }).toList();
  }
}
