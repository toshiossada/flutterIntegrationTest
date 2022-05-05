import 'package:flutter/material.dart';

import 'row_number_widget.dart';

class NumbersWidget extends StatelessWidget {
  final void Function(String) onPressed;
  const NumbersWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowNumberWidget(
          initialNumber: 7,
          onPressed: onPressed,
        ),
        RowNumberWidget(
          initialNumber: 4,
          onPressed: onPressed,
        ),
        RowNumberWidget(initialNumber: 1, onPressed: onPressed),
      ],
    );
  }
}
