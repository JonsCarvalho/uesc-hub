import 'package:dio/dio.dart';
import 'package:uesc_hub/app/modules/sagres/repositories/sagres_repository.dart';
import 'package:uesc_hub/app/modules/sagres/sagres_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uesc_hub/app/modules/sagres/sagres_page.dart';

class SagresModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SagresController(i.get<SagresRepository>())),
        Bind((i) => SagresRepository(i.get<Dio>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SagresPage()),
      ];

  static Inject get to => Inject<SagresModule>.of();
}
