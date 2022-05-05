import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:intergration_test/app/module/calculator/presentation/pages/home/home_page.dart';
import 'package:intergration_test/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized;

  _tap(WidgetTester tester, Finder btn) async {
    await tester.dragUntilVisible(
      btn,
      find.byType(SingleChildScrollView),
      const Offset(0, 0),
    );
    await tester.tap(btn);
  }

  _openCalculator(WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();
    final btnCalculate = find.byKey(const Key('btnCalculate'));
    await tester.tap(btnCalculate);
    await tester.pumpAndSettle();
  }

  testWidgets('Initialize Calculator', (WidgetTester tester) async {
    await _openCalculator(tester);
    await Future.delayed(const Duration(seconds: 2));

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
    await Future.delayed(const Duration(seconds: 2));
  });
  testWidgets('57 * 17 = 969', (WidgetTester tester) async {
    await _openCalculator(tester);
    await Future.delayed(const Duration(seconds: 2));

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
    await Future.delayed(const Duration(seconds: 2));
  });

  testWidgets('3 + 38 = 41', (WidgetTester tester) async {
    await _openCalculator(tester);
    await Future.delayed(const Duration(seconds: 2));

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
    await Future.delayed(const Duration(seconds: 2));
  });
}
