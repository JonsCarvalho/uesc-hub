import 'package:mobx/mobx.dart';

part 'schedule_controller.g.dart';

class ScheduleController = _ScheduleControllerBase with _$ScheduleController;

abstract class _ScheduleControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
