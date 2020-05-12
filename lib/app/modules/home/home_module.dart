import 'package:flutter_modular/flutter_modular.dart';
import 'package:uesc_hub/app/modules/home/components/app_bar/app_bar_controller.dart';
import 'package:uesc_hub/app/modules/home/components/navigation_bar/navigation_bar_controller.dart';
import 'package:uesc_hub/app/modules/home/components/next_class/next_class_controller.dart';
import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
        Bind((i) => NextClassController()),
        Bind((i) => AppBarController()),
        Bind((i) => NavigationBarController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject.of();
}
