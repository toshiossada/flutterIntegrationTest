import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intergration_test/app/module/calculator/presentation/pages/home/home_page.dart';
import 'package:intergration_test/app/module/calculator/presentation/pages/home/widgets/calculator_button_widget.dart';
import 'package:intergration_test/main.dart' as app;

void main() {
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

  group('Multiply Test', () {
    testWidgets('57 * 17 = 969', (WidgetTester tester) async {
      await _openCalculator(tester);

      final btnCalculator_1 = find.widgetWithText(CalculatorButtonWidget, '1');
      final btnCalculator_7 = find.widgetWithText(CalculatorButtonWidget, '7');
      final btnCalculator_5 = find.widgetWithText(CalculatorButtonWidget, '5');
      final btnCalculatorMultiply =
          find.widgetWithText(CalculatorButtonWidget, '*');
      final btnCalculatorEqual =
          find.widgetWithText(CalculatorButtonWidget, '=');

      final btnCalculatorClear =
          find.widgetWithText(CalculatorButtonWidget, 'C');

      final txtResult = find.descendant(
          of: find.byKey(const Key('txtResult')), matching: find.byType(Text));

      var txtResultText = txtResult.evaluate().single.widget as Text;

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
  });

  group('Sum Test', () {
    testWidgets('3 + 38 = 41', (WidgetTester tester) async {
      await _openCalculator(tester);

      final btnCalculatorAdd = find.widgetWithText(CalculatorButtonWidget, '+');
      final btnCalculatorEqual =
          find.widgetWithText(CalculatorButtonWidget, '=');
      final btnCalculator_3 = find.widgetWithText(CalculatorButtonWidget, '3');
      final btnCalculator_8 = find.widgetWithText(CalculatorButtonWidget, '8');

      final txtResult = find.descendant(
          of: find.byKey(const Key('txtResult')), matching: find.byType(Text));

      await _tap(tester, btnCalculator_3);
      await _tap(tester, btnCalculatorAdd);
      await _tap(tester, btnCalculator_8);
      await _tap(tester, btnCalculator_3);

      await tester.pump();
      var txtResultText = txtResult.evaluate().single.widget as Text;
      expect(txtResultText.data, '83');

      await _tap(tester, btnCalculatorEqual);

      await tester.pump();

      txtResultText = txtResult.evaluate().single.widget as Text;

      expect(txtResultText.data, '86');
    });
  });

  group('Subtract Test', () {
    testWidgets('72 - 2 = 70', (WidgetTester tester) async {
      await _openCalculator(tester);

      final btnCalculator_2 = find.widgetWithText(CalculatorButtonWidget, '2');
      final btnCalculator_7 = find.widgetWithText(CalculatorButtonWidget, '7');
      final btnCalculatorSubtract =
          find.widgetWithText(CalculatorButtonWidget, '-');
      final btnCalculatorEqual =
          find.widgetWithText(CalculatorButtonWidget, '=');

      final txtResult = find.descendant(
          of: find.byKey(const Key('txtResult')), matching: find.byType(Text));

      await _tap(tester, btnCalculator_7);
      await _tap(tester, btnCalculator_2);
      await _tap(tester, btnCalculatorSubtract);
      await _tap(tester, btnCalculator_2);
      await _tap(tester, btnCalculatorEqual);
      await tester.pump();

      var txtResultText = txtResult.evaluate().single.widget as Text;
      expect(txtResultText.data, '70');
    });
  });
}
