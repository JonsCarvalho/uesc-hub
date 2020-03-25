import 'package:uesc_hub/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:uesc_hub/app/app_widget.dart';
import 'package:uesc_hub/app/modules/home/home_module.dart';
import 'package:uesc_hub/app/shared/auth/auth_controller.dart';
import 'package:uesc_hub/app/shared/auth/repositories/auth_repository.dart';
import 'package:uesc_hub/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:uesc_hub/app/shared/repositories/local_storage/local_storage_hive.dart';
import 'package:uesc_hub/app/shared/repositories/local_storage/local_storage_interface.dart';
import 'package:uesc_hub/app/shared/repositories/local_storage/local_storage_shared.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        // Bind<ILocalStorage>((i) => LocalStorageHive()),
        Bind<ILocalStorage>((i) => LocalStorageShared()),
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind((i) => AuthController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
