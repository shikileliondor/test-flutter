import 'package:flutter_test/flutter_test.dart';
import 'package:parcours_app/src/features/ecoles/data/models/ecole_model.dart';

void main() {
  test('EcoleModel parse JSON', () {
    final model = EcoleModel.fromJson({
      'id': 1,
      'nom': 'ESMT',
      'ville': 'Dakar',
      'type': 'publique',
      'domaines': ['Informatique'],
      'filieres': ['GL'],
      'logo_url': 'https://example.com/logo.png',
    });

    expect(model.id, 1);
    expect(model.nom, 'ESMT');
    expect(model.logoUrl, isNotNull);
  });
}
