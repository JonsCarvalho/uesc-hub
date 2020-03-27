import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../home_controller.dart';
import 'class_widget.dart';

class NextClassWidget extends StatelessWidget {
  final HomeController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    // return Observer(builder: (_) {
    return Container(
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Próximas aulas",
            style: TextStyle(),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              // itemCount: controller.list.length,
              itemCount: 3,
              itemBuilder: (_, index) {
                return ClassWidget(
                  index: index,
                  id: "CET32",
                  classRoom: "17B",
                  subject: "Linguagem de Programação I",
                  end: "gg",
                  start: "gg",
                );
              },
            ),
          ),
        ],
      ),
    );
    // });
  }
}
