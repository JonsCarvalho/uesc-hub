import 'package:mobx/mobx.dart';

part 'sagres_controller.g.dart';

class SagresController = _SagresControllerBase with _$SagresController;

abstract class _SagresControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
