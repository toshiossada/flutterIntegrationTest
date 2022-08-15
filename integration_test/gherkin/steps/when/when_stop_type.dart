import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric whenIStopType() {
  return when<FlutterWidgetTesterWorld>(
    'paro de escrever',
    (context) async {
      final tester = context.world.rawAppDriver;

      await tester.pump();
    },
  );
}
