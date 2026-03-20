import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/metier/metier_repository.dart';
import '../models/metier.dart';

final metierRepositoryProvider = Provider<MetierRepository>((ref) {
  return MetierRepository();
});

final metiersProvider = FutureProvider.family<List<Metier>, String>((ref, search) {
  return ref.read(metierRepositoryProvider).listMetiers(search: search);
});
