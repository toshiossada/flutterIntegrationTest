import 'package:flutter/material.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric thenIExpectTheText() {
  return then1<String, FlutterWorld>(
    'I expect the text {string}',
    (text, context) async {
      await context.world.appDriver.waitForAppToSettle();

      // get the parent list
      final finder = context.world.appDriver.findBy(
        text,
        FindType.text,
      );

      var label = await context.world.appDriver.widget<Text>(finder);

      context.expect(label.data, text);
    },
    configuration: StepDefinitionConfiguration()
      ..timeout = const Duration(seconds: 5),
  );
}