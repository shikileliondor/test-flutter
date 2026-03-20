import 'package:app_test/core/network/api_client.dart';
import 'package:app_test/features/metier/metier_api_service.dart';
import 'package:app_test/features/metier/metier_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeMetierAdapter implements HttpClientAdapter {
  @override
  void close({bool force = false}) {}

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<List<int>>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    if (options.path == '/api/metiers') {
      return ResponseBody.fromString(
        '{"data":[{"id":3,"nom":"Data Engineer","description":"Pipelines"}]}',
        200,
        headers: {
          Headers.contentTypeHeader: ['application/json'],
        },
      );
    }

    return ResponseBody.fromString('{"id":0}', 404);
  }
}

void main() {
  test('full flow: ApiClient -> Service -> Repository', () async {
    final dio = Dio();
    dio.httpClientAdapter = FakeMetierAdapter();

    final repository = MetierRepository(
      service: MetierApiService(client: ApiClient(dio: dio, enableLogs: false)),
    );

    final items = await repository.listResumes();

    expect(items, hasLength(1));
    expect(items.first.id, 3);
    expect(items.first.nom, 'Data Engineer');
  });
}
