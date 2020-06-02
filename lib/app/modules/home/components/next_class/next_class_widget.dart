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

  // buttonWidget(String value) {
  //   return Observer(
  //     builder: (_) {
  //       return GestureDetector(
  //         onTap: () {
  //           controller.setButtonClick(!controller.buttonClick);
  //           controller.setCardSelected(null);
  //           controller.setDaySelected(value);
  //           controller.init();
  //         },
  //         child: AnimatedContainer(
  //           duration: Duration(milliseconds: 200),
  //           curve: Curves.easeInOut,
  //           padding: controller.daySelected == value
  //               ? EdgeInsets.symmetric(vertical: 8, horizontal: 35)
  //               : EdgeInsets.symmetric(vertical: 7, horizontal: 35),
  //           decoration: BoxDecoration(
  //             border: controller.daySelected == value
  //                 ? null
  //                 : Border.all(color: Colors.grey),
  //             borderRadius: controller.daySelected == value
  //                 ? BorderRadius.circular(30)
  //                 : controller.daySelected == 'Hoje'
  //                     ? BorderRadius.only(
  //                         topRight: Radius.circular(30),
  //                         bottomRight: Radius.circular(30),
  //                       )
  //                     : BorderRadius.only(
  //                         topLeft: Radius.circular(30),
  //                         bottomLeft: Radius.circular(30),
  //                       ),
  //             color: controller.daySelected == value
  //                 ? Theme.of(_).primaryColor
  //                 : Color.fromRGBO(236, 240, 243, 0),
  //             boxShadow: controller.daySelected == value
  //                 ? [
  //                     BoxShadow(
  //                       color: Theme.of(_).primaryColor.withAlpha(100),
  //                       blurRadius: 6.0,
  //                       spreadRadius: 0.0,
  //                       offset: Offset(
  //                         0.0,
  //                         3.0,
  //                       ),
  //                     )
  //                   ]
  //                 : [],
  //           ),
  //           child: Text(
  //             value,
  //             style: TextStyle(
  //               color: controller.daySelected == value
  //                   ? Colors.white
  //                   : Colors.black,
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
  buttonWidget() {
    // Container(
    //   height: 50,
    //   padding:
    //       const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.5),
    //   child: Stack(
    //     // mainAxisAlignment: MainAxisAlignment.start,
    //     fit: StackFit.expand,
    //     children: [
    //       Align(
    //         alignment: Alignment.centerLeft,
    //         child: AnimatedPadding(
    //           padding: controller.daySelected == 'Amanhã'
    //               ? EdgeInsets.only(
    //                   left: 0,
    //                 )
    //               : EdgeInsets.only(
    //                   left: 80,
    //                 ),
    //           curve: Curves.easeInOut,
    //           duration: Duration(milliseconds: 200),
    //           child: buttonWidget(
    //             controller.daySelected == 'Amanhã'
    //                 ? 'Hoje'
    //                 : 'Amanhã',
    //           ),
    //         ),
    //       ),
    //       Align(
    //         alignment: Alignment.centerLeft,
    //         child: AnimatedPadding(
    //           padding: controller.daySelected == 'Hoje'
    //               ? EdgeInsets.only(
    //                   left: 0,
    //                 )
    //               : EdgeInsets.only(
    //                   left: 80,
    //                 ),
    //           curve: Curves.easeInOut,
    //           duration: Duration(milliseconds: 200),
    //           child: buttonWidget(controller.daySelected == 'Hoje'
    //               ? 'Hoje'
    //               : 'Amanhã'),
    //         ),
    //       ),
    //     ],
    //   ),
    // ),

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
                          ? EdgeInsets.symmetric(vertical: 9.5, horizontal: 35)
                          : EdgeInsets.symmetric(vertical: 10, horizontal: 35),
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
                            duration: Duration(milliseconds: 200),
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
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                            opacity: controller.daySelected == 'Hoje' ? 0 : 1,
                            child: Text(
                              controller.daySelected == 'Hoje'
                                  ? 'Hoje'
                                  : 'Amanhã',
                              style: TextStyle(
                                color: Colors.black,
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
                          curve: Curves.easeInOut,
                          opacity: controller.daySelected == 'Hoje' ? 1 : 0,
                          child: Text(
                            'Hoje',
                            style: TextStyle(
                              color: Colors.transparent,
                              // color: Colors.black,
                            ),
                          ),
                        ),
                        AnimatedOpacity(
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          opacity: controller.daySelected == 'Hoje' ? 0 : 1,
                          child: Text(
                            'Amanhã',
                            style: TextStyle(
                              // color: Colors.black,
                              color: Colors.transparent,
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
