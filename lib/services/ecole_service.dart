import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/ecole_model.dart';

class EcoleService {
  EcoleService({
    required this.baseUrl,
    http.Client? client,
  }) : _client = client ?? http.Client();

  final String baseUrl;
  final http.Client _client;

  Future<List<EcoleModel>> fetchEcoles({
    String? search,
    String? ville,
    String? domaine,
    String? type,
  }) async {
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
      return payload
          .whereType<Map<String, dynamic>>()
          .map(EcoleModel.fromJson)
          .toList();
    }

    if (payload is Map<String, dynamic>) {
      final data = payload['data'];
      if (data is List<dynamic>) {
        return data
            .whereType<Map<String, dynamic>>()
            .map(EcoleModel.fromJson)
            .toList();
      }
      return [EcoleModel.fromJson(payload)];
    }

    return const <EcoleModel>[];
  }
}
