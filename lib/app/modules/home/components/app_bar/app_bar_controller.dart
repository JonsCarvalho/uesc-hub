import 'package:mobx/mobx.dart';

part 'app_bar_controller.g.dart';

class AppBarController = _AppBarBase with _$AppBarController;

abstract class _AppBarBase with Store {
  @observable
  double sizeProfileWidget = 35;

  _AppBarBase() {
    init();
  }

  @action
  init() async {
    updateSizeProfileWidget();
  }

  @action
  updateSizeProfileWidget() {
    if (sizeProfileWidget == 40) {
      sizeProfileWidget = 35;
    } else {
      sizeProfileWidget = 40;
    }
  }
}
