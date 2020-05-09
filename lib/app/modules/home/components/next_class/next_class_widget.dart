import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'class_widget.dart';
import 'next_class_controller.dart';

class NextClassWidget extends StatelessWidget {
  final NextClassController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Container(
          decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(10),
              // color: Colors.amber.withOpacity(.1),
              ),
          height: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 50,
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    buttonWidget('Hoje'),
                    SizedBox(width: 15),
                    buttonWidget('Amanhã'),
                  ],
                ),
              ),
              controller.nextClass.length == 0
                  ? Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Icon(FontAwesomeIcons.exclamationCircle),
                              SizedBox(height: 15),
                              Text(
                                "Nenhuma aula encontrada!",
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Expanded(
                      // flex: 10,
                      child: ListView.builder(
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
                                    classRoom: controller
                                        .nextClass[index].classLocation,
                                    classType:
                                        controller.nextClass[index].classType,
                                    subject:
                                        controller.nextClass[index].subject,
                                    end: controller.nextClass[index].endTime,
                                    start:
                                        controller.nextClass[index].startTime,
                                  ),
                                )
                              : ClassWidget(
                                  id: controller.nextClass[index].id,
                                  classRoom:
                                      controller.nextClass[index].classLocation,
                                  classType:
                                      controller.nextClass[index].classType,
                                  subject: controller.nextClass[index].subject,
                                  end: controller.nextClass[index].endTime,
                                  start: controller.nextClass[index].startTime,
                                );
                        },
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }

  buttonWidget(String value) {
    return Observer(
      builder: (_) {
        return GestureDetector(
          onTap: () {
            controller.setButtonClick(!controller.buttonClick);
            controller.setCardSelected(null);
            controller.setDaySelected(value);
            controller.init();
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            padding: controller.daySelected == value
                ? EdgeInsets.symmetric(vertical: 8, horizontal: 35)
                : EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            decoration: BoxDecoration(
              border: controller.daySelected == value
                  ? null
                  : Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
              color: controller.daySelected == value
                  ? Theme.of(_).primaryColor
                  : Color.fromRGBO(236, 240, 243, 0),
              boxShadow: controller.daySelected == value
                  ? [
                      BoxShadow(
                        color: Theme.of(_).primaryColor.withAlpha(100),
                        blurRadius: 6.0,
                        spreadRadius: 0.0,
                        offset: Offset(
                          0.0,
                          3.0,
                        ),
                      )
                    ]
                  : [],
            ),
            child: Text(
              value,
              style: TextStyle(
                color: controller.daySelected == value
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}
