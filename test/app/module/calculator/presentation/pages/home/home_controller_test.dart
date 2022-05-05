import 'package:flutter_test/flutter_test.dart';
import 'package:intergration_test/app/module/calculator/presentation/pages/home/enums/operator_enum.dart';
import 'package:intergration_test/app/module/calculator/presentation/pages/home/home_controller.dart';
import 'package:intergration_test/app/module/calculator/presentation/pages/home/home_store.dart';

void main() {
  final _store = HomeStore();
  late final HomeController _controller;

  setUpAll(() {
    _controller = HomeController(store: _store);
  });

  group('Inicialização', () {
    test('operator deve inicializar null', () {
      expect(_controller.store.value.operator, null);
      expect(_controller.pressed, false);
    });
    test('set number 1', () {
      _controller.setNumber('1');
      _controller.setNumber('2');
      _controller.setNumber('0');
      expect(_controller.pressed, true);
      expect(_controller.store.value.textResult, '120');
    });
    test('plus number2', () {
      _controller.setOperator(OperatorEnum.add);
      expect(_controller.pressed, false);
      expect(_controller.store.value.operator, OperatorEnum.add);
      _controller.setNumber('3');
      _controller.setNumber('5');
      expect(_controller.store.value.number2, 120);
      expect(_controller.store.value.number1, 35);
    });
    test('equal', () {
      _controller.setResult();
      expect(_controller.pressed, false);
      expect(_controller.store.value.number2, 155);
      expect(_controller.store.value.number1, 35);
      expect(_controller.store.value.textResult, '155');
    });
  });
}
