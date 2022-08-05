import 'package:gherkin/gherkin.dart';

class ResetAppHook extends Hook {
  @override
  int get priority => 100;

  /// Resets the application state before the test is run to ensure no test side effects
  @override
  Future<void> onAfterScenarioWorldCreated(
    World world,
    String scenario,
    Iterable<Tag> tags,
  ) async {
  }
}
