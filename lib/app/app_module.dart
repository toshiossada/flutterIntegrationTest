import 'package:flutter_modular/flutter_modular.dart';
import 'package:intergration_test/app/module/calculator/calculator_module.dart';
import 'package:intergration_test/app/module/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
        ModuleRoute('/calculator', module: CalculatorModule()),
      ];
}
