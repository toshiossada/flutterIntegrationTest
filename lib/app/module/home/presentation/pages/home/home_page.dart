import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';
import 'home_store.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ValueListenableBuilder(
            valueListenable: controller.store.name,
            builder: (context, String value, _) {
              return Visibility(
                visible: value.isNotEmpty,
                child: Text(
                  'Olá $value',
                  key: const Key('lblWelcome'),
                ),
              );
            },
          ),
          TextFormField(
            key: const Key('txtName'),
            initialValue: controller.store.name.value,
            onChanged: controller.changeName,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Titulo'),
            ),
          ),
          ElevatedButton(
            key: const Key('btnCalculate'),
            onPressed: () {
              Modular.to.pushNamed('/calculator');
            },
            child: const Text('Abrir Calculadors'),
          ),
        ],
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
