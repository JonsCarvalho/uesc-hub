import 'package:mobx/mobx.dart';

part 'news_controller.g.dart';

class NewsController = _NewsControllerBase with _$NewsController;

abstract class _NewsControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
