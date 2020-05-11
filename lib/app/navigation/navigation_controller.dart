import 'package:mobx/mobx.dart';

part 'navigation_controller.g.dart';

class NavigationController = _NavigationControllerBase
    with _$NavigationController;

abstract class _NavigationControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
