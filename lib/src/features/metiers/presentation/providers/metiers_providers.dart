import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../data/datasources/metiers_remote_datasource.dart';
import '../../data/repositories/metiers_repository_impl.dart';
import '../../domain/repositories/metiers_repository.dart';

final metiersRepositoryProvider = Provider<MetiersRepository>((ref) {
  return MetiersRepositoryImpl(MetiersRemoteDataSource(ref.watch(dioProvider)));
});

final metiersListProvider = FutureProvider((ref) {
  return ref.watch(metiersRepositoryProvider).getMetiers();
});

final metierDetailProvider = FutureProvider.family((ref, int id) {
  return ref.watch(metiersRepositoryProvider).getMetier(id);
});
