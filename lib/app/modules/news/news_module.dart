import 'package:dio/dio.dart';
import 'package:uesc_hub/app/modules/news/news_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uesc_hub/app/modules/news/news_page.dart';
import 'package:uesc_hub/app/modules/news/repositories/news_repository.dart';
import 'package:uesc_hub/app/shared/constants.dart';

class NewsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => NewsController(i.get<NewsRepository>())),
        Bind((i) => NewsRepository(i.get<Dio>())),
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => NewsPage()),
      ];

  static Inject get to => Inject<NewsModule>.of();
}
