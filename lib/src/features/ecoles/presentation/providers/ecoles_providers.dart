import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/storage/cache_service.dart';
import '../../../../core/network/dio_provider.dart';
import '../../data/datasources/ecoles_remote_datasource.dart';
import '../../data/models/ecole_filter_model.dart';
import '../../data/models/paginated_ecoles_model.dart';
import '../../data/repositories/ecoles_repository_impl.dart';
import '../../domain/repositories/ecoles_repository.dart';

class EcolesQuery {
  EcolesQuery({
    this.search,
    this.ville,
    this.domaine,
    this.type,
    this.sort = 'nom',
    this.order = 'asc',
    this.page = 1,
    this.perPage = 10,
  });

  final String? search;
  final String? ville;
  final String? domaine;
  final String? type;
  final String sort;
  final String order;
  final int page;
  final int perPage;

  Map<String, dynamic> toMap() => {
        'search': search,
        'ville': ville,
        'domaine': domaine,
        'type': type,
        'sort': sort,
        'order': order,
        'page': page,
        'per_page': perPage,
      }..removeWhere((key, value) => value == null || value == '');
}

final cacheServiceProvider = Provider((ref) => CacheService());

final ecolesRepositoryProvider = Provider<EcolesRepository>((ref) {
  return EcolesRepositoryImpl(
    EcolesRemoteDataSource(ref.watch(dioProvider)),
    ref.watch(cacheServiceProvider),
  );
});

final ecolesQueryProvider = StateProvider<EcolesQuery>((ref) => EcolesQuery());

final ecolesListProvider = FutureProvider<PaginatedEcolesModel>((ref) {
  final q = ref.watch(ecolesQueryProvider);
  return ref.watch(ecolesRepositoryProvider).getEcoles(q.toMap());
});

final ecolesFiltersProvider = FutureProvider<EcoleFilterModel>((ref) {
  return ref.watch(ecolesRepositoryProvider).getFilters();
});

final ecoleDetailProvider = FutureProvider.family((ref, int id) {
  return ref.watch(ecolesRepositoryProvider).getEcole(id);
});
