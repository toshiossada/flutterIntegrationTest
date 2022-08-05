import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';


StepDefinitionGeneric whenIStopType() {
  return when<FlutterWidgetTesterWorld>(
    'I stop tapping',
    (context) async {
      final tester = context.world.rawAppDriver;

      await tester.pump();
    },
  );
}
