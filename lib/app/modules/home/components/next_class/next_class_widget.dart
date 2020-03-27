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
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(10),
        color: Colors.amber.withOpacity(.1),
      ),
      height: 150,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Próximas aulas".toUpperCase(),
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                // itemCount: controller.list.length,
                itemCount: 3,
                itemBuilder: (_, index) {
                  return index == 0
                      ? Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: ClassWidget(
                            index: index,
                            id: "CET32",
                            classRoom: "17B",
                            subject: "Linguagem de Programação I",
                            end: "gg",
                            start: "gg",
                          ),
                        )
                      : ClassWidget(
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
      ),
    );
    // });
  }
}
