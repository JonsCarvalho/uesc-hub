import 'package:uesc_hub/app/modules/news/news_model.dart';
//Data scraping from http://www.uesc.br 

abstract class IServices{
  
  Future<List<NewsModel>> getNewsUESC(){

  }
}