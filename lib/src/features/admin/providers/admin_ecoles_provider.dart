import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../ecoles/presentation/providers/ecoles_providers.dart';

class AdminEcolesNotifier extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<void> create(Map<String, dynamic> payload) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async => ref.read(ecolesRepositoryProvider).createEcole(payload),
    );
    ref.invalidate(ecolesListProvider);
  }

  Future<void> update(int id, Map<String, dynamic> payload) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async => ref.read(ecolesRepositoryProvider).updateEcole(id, payload),
    );
    ref.invalidate(ecolesListProvider);
  }

  Future<void> delete(int id) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async => ref.read(ecolesRepositoryProvider).deleteEcole(id),
    );
    ref.invalidate(ecolesListProvider);
  }
}

final adminEcolesProvider = AsyncNotifierProvider<AdminEcolesNotifier, void>(
  AdminEcolesNotifier.new,
);
