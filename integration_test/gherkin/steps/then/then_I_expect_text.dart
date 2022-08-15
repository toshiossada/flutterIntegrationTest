import 'package:flutter/material.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric thenIExpectTheText() {
  return then1<String, FlutterWorld>(
    'Espero o texto {string}',
    (text, context) async {
      await context.world.appDriver.waitForAppToSettle();

      // get the parent list
      final finder = context.world.appDriver.findBy(
        text,
        FindType.text,
      );

      var label = await context.world.appDriver.widget<Text>(finder);

      context.expect(label.data, text);
      context.expect(finder, findsOneWidget);
    },
    configuration: StepDefinitionConfiguration()
      ..timeout = const Duration(seconds: 5),
  );
}
