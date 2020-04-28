import 'package:dio/dio.dart';
import 'package:uesc_hub/app/modules/news/models/news_model.dart';
import 'package:uesc_hub/app/shared/constants.dart';

class NewsRepository {
  final Dio dio;

  NewsRepository(this.dio);

  Future<List<NewsModel>> getAllNews() async {
    var response = await dio.get(URL_UESC_BASE + '/news/');
    List<NewsModel> list = [];

    for (var json in (response.data)) {
      NewsModel model = NewsModel(
        date: json['date'],
        title: json['title'],
        description: json['description'],
        link: json['link'],
      );
      list.add(model);
    }
    return list;
  }
}
