import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'news_controller.dart';

class NewsPage extends StatefulWidget {
  final String title;
  const NewsPage({Key key, this.title = "Notícias"}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends ModularState<NewsPage, NewsController> {
  final newsController = Modular.get<NewsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (_) {
          if (newsController.news.error != null) {
            return Center(
              child: RaisedButton(
                child: Text("Tente novamente!"),
                onPressed: () {
                  newsController.fetchNews();
                },
              ),
            );
          }
          if (newsController.news.value == null) {
            return LinearProgressIndicator();
          }
          var list;

          list = newsController.news.value.toList();

          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (_, int index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      list[index].title,
                    ),
                    subtitle: Text(list[index].description),
                    trailing: Text(
                      list[index].date,
                    ),
                  ),
                  Divider(),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
