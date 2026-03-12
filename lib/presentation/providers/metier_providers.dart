import 'package:flutter/material.dart';

import '../../data/models/metier.dart';
import '../../data/models/metier_fiche.dart';
import '../../data/repositories/metier_repository.dart';

class MetiersNotifier extends ChangeNotifier {
  MetiersNotifier(this._repository);

  final MetierRepository _repository;

  bool isLoading = false;
  String? error;
  List<Metier> metiers = const [];

  Future<void> loadMetiers() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      metiers = await _repository.fetchMetiers();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

class MetierFicheNotifier extends ChangeNotifier {
  MetierFicheNotifier(this._repository);

  final MetierRepository _repository;

  bool isLoading = false;
  String? error;
  MetierFiche? fiche;

  Future<void> loadFiche(int id) async {
    isLoading = true;
    error = null;
    fiche = null;
    notifyListeners();

    try {
      fiche = await _repository.fetchMetierFiche(id);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
