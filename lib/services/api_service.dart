import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/metier_model.dart';

class ApiService {
  ApiService({
    http.Client? client,
    this.baseUrl = 'http://10.0.2.2:8000/api',
  }) : _client = client ?? http.Client();

  final http.Client _client;
  final String baseUrl;

  Future<List<Metier>> fetchMetiers() async {
    final response = await _client.get(Uri.parse('$baseUrl/metiers'));

    if (response.statusCode != 200) {
      throw Exception('Erreur lors de la récupération des métiers (${response.statusCode})');
    }

    final decoded = jsonDecode(response.body);
    final data = decoded is Map<String, dynamic>
        ? decoded['data'] as List<dynamic>? ?? const <dynamic>[]
        : decoded as List<dynamic>? ?? const <dynamic>[];

    return data
        .whereType<Map<String, dynamic>>()
        .map(Metier.fromJson)
        .toList();
  }

  Future<MetierFiche> fetchMetierFiche(int id) async {
    final response = await _client.get(Uri.parse('$baseUrl/metiers/$id/fiche'));

    if (response.statusCode != 200) {
      throw Exception('Erreur lors de la récupération de la fiche (${response.statusCode})');
    }

    final decoded = jsonDecode(response.body);
    final data = decoded is Map<String, dynamic>
        ? decoded['data'] as Map<String, dynamic>? ?? decoded
        : <String, dynamic>{};

    return MetierFiche.fromJson(data);
  }
}
