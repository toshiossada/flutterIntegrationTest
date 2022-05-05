import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intergration_test/app/app_module.dart';
import 'package:intergration_test/app/module/calculator/calculator_module.dart';
import 'package:intergration_test/app/module/calculator/presentation/pages/home/home_page.dart';
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
      CalculatorModule(),
    ]);
    Modular.navigatorDelegate = _navigatorMock;
  });

  _tap(WidgetTester tester, Finder btn) async {
    await tester.dragUntilVisible(
        btn, // what you want to find
        find.byType(SingleChildScrollView),
        const Offset(0, 500) // delta to move
        );
    await tester.tap(btn);
  }

  testWidgets('Initialize Calculator', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(testableWidget(const HomePage()));
    final btnCalculatorClear = find.byKey(const Key('btnCalculatorClear'));
    final btnCalculatorEqual = find.byKey(const Key('btnCalculatorEqual'));
    final btnCalculator_0 = find.byKey(const Key('btnCalculator_0'));
    final btnCalculator_1 = find.byKey(const Key('btnCalculator_1'));
    final btnCalculator_4 = find.byKey(const Key('btnCalculator_4'));
    final btnCalculator_7 = find.byKey(const Key('btnCalculator_7'));
    final txtResult = find.descendant(
        of: find.byKey(const Key('txtResult')), matching: find.byType(Text));

    expect(find.byType(HomePage), findsOneWidget);
    expect(btnCalculatorClear, findsOneWidget);
    expect(btnCalculatorEqual, findsOneWidget);
    expect(btnCalculator_0, findsOneWidget);
    expect(btnCalculator_1, findsOneWidget);
    expect(btnCalculator_4, findsOneWidget);
    expect(btnCalculator_7, findsOneWidget);
    expect(txtResult, findsOneWidget);
    final txtResultText = txtResult.evaluate().single.widget as Text;
    expect(txtResultText.data, '0');
  });
  testWidgets('57 * 17 = 969', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(testableWidget(const HomePage()));
    final btnCalculator_1 = find.descendant(
        of: find.byKey(const Key('btnCalculator_1')), matching: find.text("1"));
    final btnCalculator_7 = find.descendant(
        of: find.byKey(const Key('btnCalculator_7')), matching: find.text("7"));
    final btnCalculator_5 = find.descendant(
        of: find.byKey(const Key('btnCalculator_5')), matching: find.text("5"));
    final btnCalculatorMultiply = find.descendant(
        of: find.byKey(const Key('btnCalculator_multiply')),
        matching: find.text("*"));
    final btnCalculatorEqual = find.descendant(
        of: find.byKey(const Key('btnCalculatorEqual')),
        matching: find.text("="));
    final btnCalculatorClear = find.descendant(
        of: find.byKey(const Key('btnCalculatorClear')),
        matching: find.text("C"));

    final txtResult = find.descendant(
        of: find.byKey(const Key('txtResult')), matching: find.byType(Text));

    expect(find.byType(HomePage), findsOneWidget);
    expect(btnCalculator_1, findsOneWidget);
    expect(btnCalculator_7, findsOneWidget);
    expect(txtResult, findsOneWidget);
    var txtResultText = txtResult.evaluate().single.widget as Text;
    expect(txtResultText.data, '0');
    await _tap(tester, btnCalculator_5);
    await _tap(tester, btnCalculator_7);
    await _tap(tester, btnCalculatorMultiply);
    await _tap(tester, btnCalculator_1);
    await _tap(tester, btnCalculator_7);
    await _tap(tester, btnCalculatorEqual);
    await tester.pump();
    txtResultText = txtResult.evaluate().single.widget as Text;
    expect(txtResultText.data, '969');
    await _tap(tester, btnCalculatorClear);
    await tester.pump();
    txtResultText = txtResult.evaluate().single.widget as Text;
    expect(txtResultText.data, '0');
  });

  testWidgets('3 + 38 = 41', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(testableWidget(const HomePage()));
    final btnCalculatorAdd = find.descendant(
        of: find.byKey(const Key('btnCalculator_add')),
        matching: find.text("+"));
    final btnCalculatorEqual = find.descendant(
        of: find.byKey(const Key('btnCalculatorEqual')),
        matching: find.text("="));
    final btnCalculator_3 = find.descendant(
        of: find.byKey(const Key('btnCalculator_3')), matching: find.text("3"));
    final btnCalculator_8 = find.descendant(
        of: find.byKey(const Key('btnCalculator_8')), matching: find.text("8"));

    final txtResult = find.descendant(
        of: find.byKey(const Key('txtResult')), matching: find.byType(Text));

    expect(find.byType(HomePage), findsOneWidget);
    expect(btnCalculatorAdd, findsOneWidget);
    expect(btnCalculator_3, findsOneWidget);
    expect(txtResult, findsOneWidget);

    await _tap(tester, btnCalculator_3);
    await _tap(tester, btnCalculatorAdd);
    await _tap(tester, btnCalculator_3);
    await _tap(tester, btnCalculator_8);

    await tester.pump();
    var txtResultText = txtResult.evaluate().single.widget as Text;
    expect(txtResultText.data, '38');

    await _tap(tester, btnCalculatorEqual);

    await tester.pump();
    txtResultText = txtResult.evaluate().single.widget as Text;
    expect(txtResultText.data, '41');
  });
}
