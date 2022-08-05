This is a Test Integration Example

Execute 
```flutter test integration_test/app/app_test.dart ```




To run Gherkin's test Execute

```
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
flutter drive --driver=test_driver/integration_test_driver.dart --target=integration_test/gherkin_suite_test.dart
```