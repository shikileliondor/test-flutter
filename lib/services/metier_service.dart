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

  Future<Metier> fetchMetierById(int id) async {
    final response = await _client.get(Uri.parse('$baseUrl/metiers/$id'));

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('Erreur API: ${response.statusCode}');
    }

    final payload = jsonDecode(response.body) as Map<String, dynamic>;
    return Metier.fromJson(payload['data'] as Map<String, dynamic>? ?? payload);
  }
}
