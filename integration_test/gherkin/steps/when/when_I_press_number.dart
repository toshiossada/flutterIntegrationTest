import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric whenIPressNumber() {
  return when1<int, FlutterWidgetTesterWorld>(
    'I press number {int}',
    (number, context) async {
      final tester = context.world.rawAppDriver;
      await tester.pumpAndSettle();
      final finder = context.world.appDriver.findBy('btn$number', FindType.key);
      await tester.tap(finder);
      await tester.pump();
    },
  );
}
