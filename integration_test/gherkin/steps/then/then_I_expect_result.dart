import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric thenIExpectResult() {
  return then1<String, FlutterWorld>(
    'I expect result {string}',
    (text, context) async {
      await context.world.appDriver.waitForAppToSettle();

      // get the parent list
      final finder = context.world.appDriver.findBy(
        text,
        FindType.text,
      );

      context.expect(finder, findsOneWidget);
    },
    configuration: StepDefinitionConfiguration()
      ..timeout = const Duration(seconds: 5),
  );
}
