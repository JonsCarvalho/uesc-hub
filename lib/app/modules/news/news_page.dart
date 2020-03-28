import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'news_controller.dart';

class NewsPage extends StatefulWidget {
  final String title;
  const NewsPage({Key key, this.title = "News"}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends ModularState<NewsPage, NewsController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
