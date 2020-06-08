import 'package:uesc_hub/app/modules/sagres/sagres_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uesc_hub/app/modules/sagres/sagres_page.dart';

class SagresModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SagresController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SagresPage()),
      ];

  static Inject get to => Inject<SagresModule>.of();
}
