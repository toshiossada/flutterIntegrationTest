import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intergration_test/app/module/calculator/presentation/pages/home/widgets/result_label_widget.dart';

import 'home_controller.dart';
import 'home_store.dart';
import 'viewmodel/home_view_model.dart';
import 'widgets/calculator_button_widget.dart';
import 'widgets/numbers/numbers_widget.dart';
import 'widgets/row_operator_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              RowOperatorWidget(
                onPressed: controller.setOperator,
              ),
              ValueListenableBuilder(
                  valueListenable: controller.store,
                  builder: (context, HomeViewModel value, _) {
                    return ResultTextWidget(
                      key: const Key('txtResult'),
                      text: value.textResult,
                    );
                  }),
              NumbersWidget(
                onPressed: controller.setNumber,
              ),
              Row(
                children: [
                  Expanded(
                    child: CalculatorButtonWidget(
                      onPressed: () => controller.setNumber('0'),
                      key: const Key('btnCalculator_0'),
                      text: '0',
                    ),
                  ),
                  Expanded(
                    child: CalculatorButtonWidget(
                      onPressed: controller.clear,
                      key: const Key('btnCalculatorClear'),
                      text: 'C',
                    ),
                  ),
                  Expanded(
                    child: CalculatorButtonWidget(
                      key: const Key('btnCalculatorEqual'),
                      onPressed: controller.setResult,
                      text: '=',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    Modular.dispose<HomeController>();
    Modular.dispose<HomeStore>();
  }
}
