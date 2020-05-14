import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uesc_hub/app/modules/home/components/next_class/next_class_controller.dart';
import 'package:uesc_hub/app/shared/functions/generation_color.dart';

import '../../home_controller.dart';

class ClassWidget extends StatelessWidget {
  final String id;
  final String subject;
  final String classRoom;
  final String classType;
  final String start;
  final String end;

  final NextClassController controller = Modular.get();

  ClassWidget({
    Key key,
    this.id,
    this.subject,
    this.classRoom,
    this.classType,
    this.start,
    this.end,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return GestureDetector(
          onTap: () {
            if (controller.cardSelected == id) {
              controller.setCardSelected(null);
              controller.init();
            } else {
              controller.setCardSelected(id);
              controller.init();
            }
          },
          child: Container(
            padding: const EdgeInsets.only(top: 4, bottom: 9, right: 15),
            width: 210,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                border: Border.all(
                  color: GenerationColor(seed: id).colorSubject(),
                  style: controller.cardSelected == id
                      ? BorderStyle.solid
                      : BorderStyle.none,
                  width: controller.cardSelected == id ? 2 : 0,
                ),
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: controller.cardSelected == id
                    ? [
                        BoxShadow(
                          color: GenerationColor(seed: id)
                              .colorSubject()
                              .withAlpha(100),
                          blurRadius: 6.0,
                          spreadRadius: 0.0,
                          offset: Offset(
                            0.0,
                            3.0,
                          ),
                        )
                      ]
                    : [
                        BoxShadow(
                          color: Colors.grey.withAlpha(100),
                          blurRadius: 6.0,
                          spreadRadius: 0.0,
                          offset: Offset(
                            0.0,
                            3.0,
                          ),
                        )
                      ],
              ),
              child: Row(
                children: [
                  controller.cardSelected == id
                      ? SizedBox()
                      : SizedBox(
                          width: 5,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: GenerationColor(seed: id).colorSubject(),
                            ),
                          ),
                        ),
                  Expanded(
                    child: controller.cardSelected == id
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  subject,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  id + ' - ' + classType,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: GenerationColor(seed: id)
                                        .colorSubject(),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  classRoom,
                                  style: TextStyle(fontSize: 12),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.greenAccent),
                                        color: Colors.greenAccent.withAlpha(20),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      padding: EdgeInsets.all(2),
                                      child: Text(
                                        start,
                                        style: TextStyle(
                                            color: Colors.greenAccent),
                                      ),
                                    ),
                                    Icon(Icons.access_time),
                                    Container(
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.redAccent),
                                        color: Colors.redAccent.withAlpha(20),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      padding: EdgeInsets.all(2),
                                      child: Text(
                                        end,
                                        style:
                                            TextStyle(color: Colors.redAccent),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      subject,
                                      // textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      id,
                                      // textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
