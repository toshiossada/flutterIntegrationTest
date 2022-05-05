import 'package:flutter/material.dart';

class CalculatorButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CalculatorButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        key: Key('btn$text'),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
