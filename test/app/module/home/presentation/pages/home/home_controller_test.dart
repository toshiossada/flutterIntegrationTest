import 'package:flutter_test/flutter_test.dart';
import 'package:intergration_test/app/module/home/presentation/pages/home/home_controller.dart';
import 'package:intergration_test/app/module/home/presentation/pages/home/home_store.dart';

void main() {
  final _store = HomeStore();
  late final HomeController _controller;

  setUpAll(() {
    _controller = HomeController(store: _store);
  });

  group('HomeController', () {
    test('name deve inicializar vazio', () {
      expect(_controller.store.name.value.isEmpty, true);
    });

    test('name deve inicializar vazio', () {
      const name = 'Toshi';
      expect(_controller.store.name.value.isEmpty, true);
      _controller.changeName(name);

      expect(_controller.store.name.value.isNotEmpty, true);
      expect(_controller.store.name.value, name);
    });
  });
}
