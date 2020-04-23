import 'package:mobx/mobx.dart';
import 'package:uesc_hub/app/modules/news/models/news_model.dart';
import 'package:uesc_hub/app/modules/news/repositories/news_repository.dart';

part 'news_controller.g.dart';

class NewsController = _NewsControllerBase with _$NewsController;

abstract class _NewsControllerBase with Store {
  final NewsRepository repository;
  
  @observable
  ObservableFuture<List<NewsModel>> news;

  _NewsControllerBase(this.repository) {
    fetchNews();
  }

  @action
  fetchNews() {
    news = repository.getAllNews().asObservable();
  }
}
