import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/filiere.dart';

class FiliereRepository {
  Future<List<Filiere>> loadFilieres() async {
    final rawData = await rootBundle.loadString('assets/filieres.json');
    final parsed = jsonDecode(rawData) as List<dynamic>;

    return parsed
        .map((item) => Filiere.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
