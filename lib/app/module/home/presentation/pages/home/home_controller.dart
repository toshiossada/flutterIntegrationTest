import 'home_store.dart';

class HomeController {
  final HomeStore store;
  HomeController({
    required this.store,
  });

  changeName(text) => store.name.value = text;
}
