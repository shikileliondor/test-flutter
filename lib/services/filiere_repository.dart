import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/filiere.dart';

/// Service de lecture des données locales JSON (assets/filieres.json).
class FiliereRepository {
  /// Charge toutes les filières depuis les assets puis les convertit en modèles Dart.
  Future<List<Filiere>> loadFilieres() async {
    final data = await rootBundle.loadString('assets/filieres.json');
    final parsed = jsonDecode(data) as List<dynamic>;

    return parsed
        .map((item) => Filiere.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
