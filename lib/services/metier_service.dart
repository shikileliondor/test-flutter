import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/metier.dart';

class MetierService {
  MetierService({
    required this.baseUrl,
    http.Client? client,
  }) : _client = client ?? http.Client();

  final String baseUrl;
  final http.Client _client;

  Future<List<Metier>> fetchMetiers({
    String? search,
    String? domaine,
    String? dureeEtudes,
    String? niveauRequis,
  }) async {
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

    return data
        .whereType<Map<String, dynamic>>()
        .map(Metier.fromJson)
        .toList();
  }

  Future<Metier> fetchMetierById(int id) async {
    final response = await _client.get(Uri.parse('$baseUrl/metiers/$id'));

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('Erreur API: ${response.statusCode}');
    }

    final payload = jsonDecode(response.body) as Map<String, dynamic>;
    return Metier.fromJson(payload['data'] as Map<String, dynamic>? ?? payload);
  }
}
