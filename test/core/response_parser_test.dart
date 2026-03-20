import 'package:app_test/core/network/response_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ResponseParser', () {
    test('parse list from direct array', () {
      final result = ResponseParser.parseList([
        {'id': 1, 'nom': 'Dev'},
      ]);

      expect(result.length, 1);
      expect(result.first['id'], 1);
    });

    test('parse list from wrapped data', () {
      final result = ResponseParser.parseList({
        'data': [
          {'id': 2, 'nom': 'Data'},
        ],
      });

      expect(result.length, 1);
      expect(result.first['id'], 2);
    });

    test('parse object from wrapped data', () {
      final result = ResponseParser.parseObject({
        'data': {'id': 10, 'nom': 'Cyber'},
      });

      expect(result['id'], 10);
    });
  });
}
