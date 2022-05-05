import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intergration_test/app/app_module.dart';
import 'package:intergration_test/app/module/home/home_module.dart';
import 'package:intergration_test/app/module/home/presentation/pages/home/home_page.dart';
import 'package:mockito/annotations.dart';
import 'package:modular_test/modular_test.dart';

import '../../../../../../utils/testable_widget.dart';
import 'home_page_test.mocks.dart';

@GenerateMocks([IModularNavigator])
void main() {
  final _navigatorMock = MockIModularNavigator();

  setUpAll(() {
    initModules([
      AppModule(),
      HomeModule(),
    ]);
    Modular.navigatorDelegate = _navigatorMock;
  });

  testWidgets('Olá Toshi', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(testableWidget(const HomePage()));
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
