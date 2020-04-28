import 'package:dio/dio.dart';
import 'package:uesc_hub/app/modules/schedule/repositories/schedule_repository.dart';
import 'package:uesc_hub/app/modules/schedule/schedule_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uesc_hub/app/modules/schedule/schedule_page.dart';
import 'package:uesc_hub/app/shared/constants.dart';

class ScheduleModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ScheduleController(i.get<ScheduleRepository>())),
        Bind((i) => ScheduleRepository(i.get<Dio>())),
        Bind((i) => Dio()),
        // Bind((i) => Dio(BaseOptions(baseUrl: URL_SAGRES_BASE))),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SchedulePage()),
      ];

  static Inject get to => Inject<ScheduleModule>.of();
}
