import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:uesc_hub/app/shared/auth/auth_controller.dart';
import 'package:uesc_hub/app/shared/auth/repositories/auth_repository.dart';
import 'package:uesc_hub/app/shared/repositories/localstorage/local_storage_interface.dart';
import 'package:uesc_hub/app/shared/repositories/localstorage/local_storage_share.dart';
import 'app_controller.dart';
import 'app_widget.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';
import 'modules/news/news_module.dart';
import 'modules/profile/profile_module.dart';
import 'modules/restaurant/restaurant_module.dart';
import 'modules/schedule/schedule_module.dart';
import 'shared/auth/repositories/auth_repository_interface.dart';
import 'splash/splash_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        //  Bind((i) => LocalStorageHive()),
        Bind<ILocalStorage>((i) => LocalStorageShared()),
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind((i) => AuthController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SplashPage()),
        Router('/login',
            module: LoginModule(), transition: TransitionType.noTransition),
        Router('/home', module: HomeModule()),
        Router('/restaurant', module: RestaurantModule()),
        Router('/news', module: NewsModule()),
        Router('/schedule', module: ScheduleModule()),
        Router('/profile', module: ProfileModule()),        
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject.of();
}
