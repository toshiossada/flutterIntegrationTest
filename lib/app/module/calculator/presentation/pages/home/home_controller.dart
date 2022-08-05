import 'package:intergration_test/app/module/calculator/presentation/pages/home/enums/operator_enum.dart';

import 'home_store.dart';

class HomeController {
  final HomeStore store;
  bool pressed = false;

  HomeController({required this.store});



  setNumber(String v) {
    if (!pressed) {
      pressed = true;
      store.clearResult();
    }

    store.num1 = '${store.value.textResult}$v';
  }

  setOperator(OperatorEnum v) {
    store.operator = v;
    store.num2 = store.value.textResult;
    store.operator = v;
    pressed = false;
  }

  setResult() {
    store.result();
    pressed = false;
  }

  clear() {
    store.clear();
    pressed = false;
  }
}
