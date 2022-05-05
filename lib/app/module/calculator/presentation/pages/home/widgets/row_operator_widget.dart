import 'package:flutter/material.dart';
import 'package:intergration_test/app/module/calculator/presentation/pages/home/enums/operator_enum.dart';

import 'calculator_button_widget.dart';

class RowOperatorWidget extends StatelessWidget {
  final void Function(OperatorEnum) onPressed;
  const RowOperatorWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      childAspectRatio: 5,
      children: [
        CalculatorButtonWidget(
          key: const Key('btnCalculator_add'),
          onPressed: () {
            onPressed(OperatorEnum.add);
          },
          text: '+',
        ),
        CalculatorButtonWidget(
          key: const Key('btnCalculator_subtract'),
          onPressed: () {
            onPressed(OperatorEnum.subtract);
          },
          text: '-',
        ),
        CalculatorButtonWidget(
          key: const Key('btnCalculator_divide'),
          onPressed: () {
            onPressed(OperatorEnum.divide);
          },
          text: '/',
        ),
        CalculatorButtonWidget(
          key: const Key('btnCalculator_multiply'),
          onPressed: () {
            onPressed(OperatorEnum.multiply);
          },
          text: '*',
        ),
      ],
    );
  }
}
