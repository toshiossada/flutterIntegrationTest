import 'package:intergration_test/app/module/calculator/presentation/pages/home/enums/operator_enum.dart';

class HomeViewModel {
  final OperatorEnum? operator;
  final double number1;
  final double number2;
  final double result;
  final String textResult;

  double calculator() {
    switch (operator) {
      case OperatorEnum.add:
        return number2 + number1;
      case OperatorEnum.subtract:
        return number2 - number1;
      case OperatorEnum.multiply:
        return number2 * number1;
      case OperatorEnum.divide:
        return number2 / number1;
      default:
        return 0;
    }
  }

  HomeViewModel({
    this.operator,
    this.number1 = 0,
    this.number2 = 0,
    this.result = 0,
    this.textResult = '0',
  });

  HomeViewModel copyWith({
    OperatorEnum? operator,
    double? number1,
    double? number2,
    double? result,
    String? textResult,
  }) {
    return HomeViewModel(
      operator: operator ?? this.operator,
      number1: number1 ?? this.number1,
      number2: number2 ?? this.number2,
      textResult: textResult ?? this.textResult,
      result: result ?? this.result,
    );
  }

  HomeViewModel resetOperator() {
    return HomeViewModel(
      operator: null,
      number1: number1,
      number2: number2,
      result: result,
    );
  }
}
