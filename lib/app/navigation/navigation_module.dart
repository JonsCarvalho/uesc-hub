import 'package:uesc_hub/app/navigation/navigation_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uesc_hub/app/navigation/navigation_page.dart';

class NavigationModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => NavigationController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => NavigationPage()),
      ];

  static Inject get to => Inject<NavigationModule>.of();
}
