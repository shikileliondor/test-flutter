import 'package:app_test/core/network/api_client.dart';
import 'package:app_test/features/metier/metier_api_service.dart';
import 'package:app_test/features/metier/metier_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('MetierRepository', () {
    late MockDio dio;
    late MetierRepository repository;

    setUp(() {
      dio = MockDio();
      final client = ApiClient(dio: dio, enableLogs: false);
      repository = MetierRepository(service: MetierApiService(client: client));
    });

    test('returns list from /api/metiers', () async {
      when(() => dio.get<dynamic>(
            '/api/metiers',
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
          )).thenAnswer(
        (_) async => Response<dynamic>(
          requestOptions: RequestOptions(path: '/api/metiers'),
          data: {
            'data': [
              {'id': 1, 'nom': 'Dev Web', 'description': 'Créer des apps web'}
            ]
          },
        ),
      );

      final result = await repository.listResumes();

      expect(result, hasLength(1));
      expect(result.first.nom, 'Dev Web');
    });
  });
}
