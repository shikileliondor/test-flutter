import 'package:app_test/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Parcours home screen displays key sections', (tester) async {
    await tester.pumpWidget(const ParcoursApp());
    await tester.pumpAndSettle();

    expect(find.text('Bonjour, Camille'), findsOneWidget);
    expect(find.text('Développeur Web'), findsOneWidget);
    expect(find.text('Médecin'), findsOneWidget);
    expect(find.text('Designer Graphique'), findsOneWidget);
  });
}
