import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uesc_hub/app/shared/functions/generation_date.dart';

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
      height: 200,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Próximas aulas".toUpperCase(),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                FlatButton(
                  color: Colors.grey,
                  child: Text("Amanhã"),
                  onPressed: () {
                    controller
                        .getNextClass(DateTime.now().add(Duration(days: 1)));
                  },
                ),
              ],
            ),
            Expanded(
              flex: 3,
              child: Observer(
                builder: (_) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    // itemCount: controller.list.length,
                    itemCount: controller.nextClass.length,
                    itemBuilder: (_, index) {
                      return index == 0
                          ? Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: ClassWidget(
                                id: controller.nextClass[index].id,
                                classRoom:
                                    controller.nextClass[index].classLocation,
                                classType:
                                    controller.nextClass[index].classType,
                                subject: controller.nextClass[index].subject,
                                end: controller.nextClass[index].endTime,
                                start: controller.nextClass[index].startTime,
                              ),
                            )
                          : ClassWidget(
                              id: controller.nextClass[index].id,
                              classRoom:
                                  controller.nextClass[index].classLocation,
                              classType: controller.nextClass[index].classType,
                              subject: controller.nextClass[index].subject,
                              end: controller.nextClass[index].endTime,
                              start: controller.nextClass[index].startTime,
                            );
                    },
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
