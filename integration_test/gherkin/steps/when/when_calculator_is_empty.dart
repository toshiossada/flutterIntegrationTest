import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric whenCalculatorIsEmpty() {
  return when<FlutterWidgetTesterWorld>(
    'calculator is empty',
    (context) async {
      final tester = context.world.rawAppDriver;
      await tester.pumpAndSettle();
      final finder = context.world.appDriver.findBy('=', FindType.text);
      await tester.tap(finder);
      await tester.pump();
    },
  );
}
