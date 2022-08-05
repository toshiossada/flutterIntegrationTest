import 'package:flutter_gherkin/flutter_gherkin.dart'; // notice new import name
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

// The application under test.
import 'package:intergration_test/main.dart' as app;

import 'gherkin/hooks/reset_app_hook.dart';
import 'gherkin/steps/given/given.dart';
import 'gherkin/steps/then/then.dart';
import 'gherkin/steps/when/when.dart';

part 'gherkin_suite_test.g.dart';

@GherkinTestSuite()
void main() {
  executeTestSuite(
    configuration: FlutterTestConfiguration(
      stepDefinitions: [
        ...thenSteps,
        ...givenSteps,
        ...whenSteps,
      ],
      hooks: [
        ResetAppHook(),
      ],
      order: ExecutionOrder.alphabetical,
      features: [RegExp('features/*.*.feature')],
      reporters: [
        StdoutReporter(MessageLevel.error)
          ..setWriteLineFn(print)
          ..setWriteFn(print),
        ProgressReporter()
          ..setWriteLineFn(print)
          ..setWriteFn(print),
        TestRunSummaryReporter()
          ..setWriteLineFn(print)
          ..setWriteFn(print),
        JsonReporter(
          writeReport: (_, __) => Future<void>.value(),
        ),
      ],
    ),
    appMainFunction: (World world) async => app.main(),
  );
}
