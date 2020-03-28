import 'package:uesc_hub/app/modules/news/news_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uesc_hub/app/modules/news/news_page.dart';

class NewsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => NewsController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => NewsPage()),
      ];

  static Inject get to => Inject<NewsModule>.of();
}
