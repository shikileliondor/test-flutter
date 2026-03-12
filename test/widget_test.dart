import 'package:app_test/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('L\'application affiche la page liste des métiers', (tester) async {
    await tester.pumpWidget(const MetiersApp());

    expect(find.text('Liste des métiers'), findsOneWidget);
  });
}
