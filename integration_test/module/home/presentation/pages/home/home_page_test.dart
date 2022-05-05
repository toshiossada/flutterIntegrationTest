import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:intergration_test/app/module/home/presentation/pages/home/home_page.dart';
import 'package:intergration_test/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized;

  testWidgets('''
    Given Application Started 
    When I input text 'Toshi'
    Then I should see the welcome message 'Olá Toshi'
    ''', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    app.main();
    await tester.pumpAndSettle();
    final txtName = find.byKey(const Key('txtName'));

    expect(find.byType(HomePage), findsOneWidget);
    final lblWelcome = find.byKey(const Key('lblWelcome'));
    expect(txtName, findsOneWidget);
    expect(find.text("Olá Toshi"), findsNothing);

    await tester.enterText(txtName, 'Toshi');
    await tester.pumpAndSettle();

    await tester.ensureVisible(lblWelcome);
    expect(find.text("Olá Toshi"), findsOneWidget);
  });
}
