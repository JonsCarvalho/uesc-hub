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
          height: 180,
          child: Column(
            children: <Widget>[
              buttonWidget(),
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
                                  padding: const EdgeInsets.only(
                                    left: 15,
                                    top: 4,
                                    bottom: 9,
                                    right: 15,
                                  ),
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
                              : Padding(
                                  padding: const EdgeInsets.only(
                                      top: 4, bottom: 9, right: 15),
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

  buttonWidget() {
    return Observer(
      builder: (_) {
        return GestureDetector(
          onTap: () {
            controller.setButtonClick(!controller.buttonClick);
            controller.setCardSelected(null);
            controller.setDaySelected(
                controller.daySelected == "Hoje" ? "Amanhã" : "Hoje");
            controller.init();
          },
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.5),
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    height: 38,
                    width: MediaQuery.of(_).size.width / 2,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.transparent,
                    ),
                    alignment: controller.daySelected == "Hoje"
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: AnimatedContainer(
                      padding: controller.daySelected == 'Hoje'
                          ? EdgeInsets.symmetric(vertical: 9.5, horizontal: 30)
                          : EdgeInsets.symmetric(vertical: 9.5, horizontal: 25),
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Theme.of(_).primaryColor,
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(_).primaryColor.withAlpha(100),
                            blurRadius: 6.0,
                            spreadRadius: 0.0,
                            offset: Offset(
                              0.0,
                              3.0,
                            ),
                          )
                        ],
                      ),
                      child: Stack(
                        children: [
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                            opacity: controller.daySelected == 'Hoje' ? 1 : 0,
                            child: Text(
                              controller.daySelected == 'Hoje'
                                  ? 'Hoje'
                                  : 'Amanhã',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                            opacity: controller.daySelected == 'Hoje' ? 0 : 1,
                            child: Text(
                              controller.daySelected == 'Hoje'
                                  ? 'Hoje'
                                  : 'Amanhã',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 38,
                    width: MediaQuery.of(_).size.width / 2,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AnimatedOpacity(
                          duration: Duration(milliseconds: 200),
                          curve: Curves.ease,
                          opacity: controller.daySelected == 'Hoje' ? 0 : 1,
                          child: Text(
                            'Hoje',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        AnimatedOpacity(
                          duration: Duration(milliseconds: 200),
                          curve: Curves.ease,
                          opacity: controller.daySelected == 'Hoje' ? 1 : 0,
                          child: Text(
                            'Amanhã',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
