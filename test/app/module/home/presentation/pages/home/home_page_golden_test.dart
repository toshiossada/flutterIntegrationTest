import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intergration_test/app/app_module.dart';
import 'package:intergration_test/app/module/home/home_module.dart';
import 'package:intergration_test/app/module/home/presentation/pages/home/home_page.dart';
import 'package:mockito/annotations.dart';
import 'package:modular_test/modular_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'home_page_test.mocks.dart';

@GenerateMocks([IModularNavigator])
void main() {
  final _navigatorMock = MockIModularNavigator();

  setUpAll(() {
    initModules([
      AppModule(),
      HomeModule(),
    ]);
    Modular.navigatorDelegate = _navigatorMock;
  });

  //GOLDEN TESTS
  testGoldens('''
    Dado a tela o acesso a tela Home vazia
    Quando eu digitar Toshi no inputText
    Então deve ser exibir a mensagem Olá Toshi
    ''', (tester) async {
    await loadAppFonts();
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [
        Device.phone,
        Device.iphone11,
        Device.tabletPortrait,
        Device.tabletLandscape,
      ])
      ..addScenario(
        name: 'Olá Toshi',
        widget: const HomePage(),
        onCreate: (scenarioWidgetKey) async {
          final txtName = find.byKey(const Key('txtName'));
          expect(txtName, findsWidgets);
          await tester.enterText(txtName.first, 'Toshi');
          await tester.pumpAndSettle();
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'HomeScreenToshi');
  });
  testGoldens('''
    Dado a tela o acesso a tela Home vazia
    Quando nao digitar nenhum texto
    Então não deve exibir nenhuma mensagem
    ''', (tester) async {
    await loadAppFonts();
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [
        Device.phone,
        Device.iphone11,
        Device.tabletPortrait,
        Device.tabletLandscape,
      ])
      ..addScenario(
        name: 'Empty State',
        widget: const HomePage(),
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'HomeScreenEmpty');
  });
}
