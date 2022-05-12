import 'package:integration_test/integration_test.dart';

import 'modules/calculator/presentation/pages/home/home_page_test.dart'
    as calculator;
import 'modules/home/presentation/pages/home/home_page_test.dart' as home;

main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized;

  home.main();
  calculator.main();
}
