import 'package:flutter/material.dart';
import 'package:intergration_test/app/module/calculator/presentation/pages/home/enums/operator_enum.dart';

import 'viewmodel/home_view_model.dart';

class HomeStore extends ValueNotifier<HomeViewModel> {
  HomeStore() : super(HomeViewModel());

  clear() => value = HomeViewModel();
  resetOperator() => value = value.resetOperator();
  set num1(String v) => value = value.copyWith(
        number1: double.parse(v),
        textResult: v.toString(),
      );
  set num2(String v) {
    value = value.copyWith(
      number2: double.parse(v),
      textResult: v.toString(),
    );
  }

  result() {
    var result = value.calculator();

    var valueInt = '';

    if (result == result.truncateToDouble()) {
      valueInt = result.toInt().toString();
    } else {
      valueInt = result.toStringAsPrecision(2).toString();
    }

    value = value.copyWith(
      result: result,
      number2: result,
      textResult: valueInt,
    )..resetOperator();
  }

  clearResult() {
    value = value.copyWith(
      textResult: '',
    );
  }

  set operator(OperatorEnum v) => value = value.copyWith(operator: v);
}
