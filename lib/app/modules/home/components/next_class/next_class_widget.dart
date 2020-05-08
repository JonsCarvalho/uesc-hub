import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'class_widget.dart';
import 'next_class_controller.dart';

class NextClassWidget extends StatelessWidget {
  final NextClassController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    // return Observer(builder: (_) {
    return Container(
      decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(10),
          // color: Colors.amber.withOpacity(.1),
          ),
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                OutlineButton(
                  borderSide: BorderSide(
                    color: Colors.red,
                    // style: BorderStyle.none,
                    width: 2,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: Colors.grey,
                  child: Text("Hoje"),
                  onPressed: () {
                    controller.init(
                      DateTime.now().add(
                        Duration(days: -1),
                      ),
                    );
                  },
                ),
                SizedBox(width: 15),
                FlatButton(
                  color: Colors.grey,
                  child: Text("Amanhã"),
                  onPressed: () {
                    controller.init(
                      DateTime.now().add(
                        Duration(days: 1),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Observer(
              builder: (_) {
                if (controller.nextClass.length == 0)
                  return Center(child: Text("Nenhuma aula"));

                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  // itemCount: controller.list.length,
                  itemCount: controller.nextClass.length,
                  itemBuilder: (_, index) {
                    return index == 0
                        ? Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: ClassWidget(
                              id: controller.nextClass[index].id,
                              classRoom:
                                  controller.nextClass[index].classLocation,
                              classType: controller.nextClass[index].classType,
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
    );
    // });
  }
}
