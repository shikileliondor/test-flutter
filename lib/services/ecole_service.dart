import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/ecole_model.dart';
import 'mock_data.dart';

class EcoleService {
  EcoleService({
    this.baseUrl,
    this.useMockData = true,
    http.Client? client,
  }) : _client = client ?? http.Client();

  final String? baseUrl;
  final bool useMockData;
  final http.Client _client;

  Future<List<EcoleModel>> fetchEcoles({
    String? search,
    String? ville,
    String? domaine,
    String? type,
  }) async {
    if (useMockData) {
      final normalizedSearch = (search ?? '').trim().toLowerCase();
      return MockData.ecoles.where((ecole) {
        final searchMatches = normalizedSearch.isEmpty ||
            ecole.nom.toLowerCase().contains(normalizedSearch) ||
            ecole.ville.toLowerCase().contains(normalizedSearch);
        final villeMatches = ville == null || ville.isEmpty || ecole.ville == ville;
        final domaineMatches =
            domaine == null || domaine.isEmpty || ecole.domaines.contains(domaine);
        final typeMatches = type == null || type.isEmpty || ecole.type == type;
        return searchMatches && villeMatches && domaineMatches && typeMatches;
      }).toList();
    }

    final query = <String, String>{
      if (search != null && search.isNotEmpty) 'search': search,
      if (ville != null && ville.isNotEmpty) 'ville': ville,
      if (domaine != null && domaine.isNotEmpty) 'domaine': domaine,
      if (type != null && type.isNotEmpty) 'type': type,
    };

    final uri = Uri.parse('$baseUrl/ecoles').replace(queryParameters: query.isEmpty ? null : query);

    final response = await _client.get(uri);

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('Erreur API: ${response.statusCode}');
    }

    final payload = jsonDecode(response.body);

    if (payload is List<dynamic>) {
      return payload.whereType<Map<String, dynamic>>().map(EcoleModel.fromJson).toList();
    }

    if (payload is Map<String, dynamic>) {
      final data = payload['data'];
      if (data is List<dynamic>) {
        return data.whereType<Map<String, dynamic>>().map(EcoleModel.fromJson).toList();
      }
      return [EcoleModel.fromJson(payload)];
    }

    return const <EcoleModel>[];
  }
}
