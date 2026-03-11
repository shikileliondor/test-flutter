import 'package:app_test/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Parcours home screen displays modern key sections', (tester) async {
    await tester.pumpWidget(const ParcoursApp());
    await tester.pumpAndSettle();

    expect(find.text('Parcours'), findsOneWidget);
    expect(find.text('Découvre ton futur métier'), findsOneWidget);
    expect(find.text('Métiers populaires'), findsOneWidget);
    expect(find.text('Développeur Web'), findsOneWidget);
    expect(find.text('Parcours recommandés'), findsOneWidget);
    expect(find.text('Écoles recommandées'), findsOneWidget);
  });
}
