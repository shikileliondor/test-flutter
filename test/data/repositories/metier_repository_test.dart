import 'package:app_test/data/models/metier.dart';
import 'package:app_test/data/repositories/metier_repository.dart';
import 'package:app_test/data/services/metier_api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMetierApiService extends Mock implements MetierApiService {}

void main() {
  late MockMetierApiService apiService;
  late MetierRepository repository;

  setUp(() {
    apiService = MockMetierApiService();
    repository = MetierRepository(apiService);
  });

  test('fetchMetiers returns data from API service', () async {
    const metiers = [
      Metier(id: 1, nom: 'Développeur', description: 'Construit des apps'),
    ];

    when(() => apiService.getMetiers()).thenAnswer((_) async => metiers);

    final result = await repository.fetchMetiers();

    expect(result, metiers);
    verify(() => apiService.getMetiers()).called(1);
  });
}
