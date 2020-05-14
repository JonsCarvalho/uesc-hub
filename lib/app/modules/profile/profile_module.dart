import 'package:dio/dio.dart';
import 'package:uesc_hub/app/modules/profile/profile_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uesc_hub/app/modules/profile/profile_page.dart';
import 'package:uesc_hub/app/modules/schedule/repositories/schedule_repository.dart';

class ProfileModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ProfileController()),
        Bind(
          (i) => ScheduleRepository(i.get<Dio>()),
        ),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ProfilePage()),
      ];

  static Inject get to => Inject<ProfileModule>.of();
}
