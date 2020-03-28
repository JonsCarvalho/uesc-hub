import 'package:uesc_hub/app/modules/schedule/schedule_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uesc_hub/app/modules/schedule/schedule_page.dart';

class ScheduleModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ScheduleController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SchedulePage()),
      ];

  static Inject get to => Inject<ScheduleModule>.of();
}
