import 'package:app_test/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Parcours welcome screen is displayed', (tester) async {
    await tester.pumpWidget(const ParcoursApp());

    expect(find.text('Parcours'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Sign Up'), findsOneWidget);
  });
}
