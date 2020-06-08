import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'sagres_controller.dart';

class SagresPage extends StatefulWidget {
  final String title;
  const SagresPage({Key key, this.title = "Sagres"}) : super(key: key);

  @override
  _SagresPageState createState() => _SagresPageState();
}

class _SagresPageState extends ModularState<SagresPage, SagresController> {
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
