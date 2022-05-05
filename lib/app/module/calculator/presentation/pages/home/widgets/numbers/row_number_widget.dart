import 'package:flutter/material.dart';

import '../calculator_button_widget.dart';

class RowNumberWidget extends StatelessWidget {
  final int initialNumber;
  final void Function(String) onPressed;

  const RowNumberWidget({
    Key? key,
    required this.initialNumber,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      //childAspectRatio: 5,
      children: List.generate(
        3,
        (index) {
          final number = '${index + initialNumber}';
          return CalculatorButtonWidget(
            key: Key('btnCalculator_$number'),
            onPressed: () {
              onPressed(number);
            },
            text: number,
          );
        },
      ),
    );
  }
}
