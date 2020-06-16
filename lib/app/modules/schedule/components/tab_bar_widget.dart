import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../schedule_controller.dart';

class TabBarWidget extends StatelessWidget {
  final scheduleController = Modular.get<ScheduleController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Container(
                height: 50,
                child: InkWell(
                  onTap: () {
                    scheduleController.changePage(0);
                  },
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  splashColor: Theme.of(_).accentColor,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeInCubic,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: scheduleController.bottomBarMenuSelected == 0
                                ? Theme.of(_).primaryColor
                                : Colors.transparent,
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withAlpha(100),
                                blurRadius: 6.0,
                                spreadRadius: 0.0,
                                offset: Offset(
                                  0.0,
                                  3.0,
                                ),
                              )
                            ],
                          ),
                          height: 5,
                          width: scheduleController.bottomBarMenuSelected == 0
                              ? MediaQuery.of(context).size.width / 2
                              : .1,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.clock,
                                size: 15,
                                color: Theme.of(_).textTheme.bodyText1.color,
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Horários",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 50,
                child: InkWell(
                  onTap: () {
                    scheduleController.changePage(1);
                  },
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  splashColor: Theme.of(_).accentColor,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeInCubic,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: scheduleController.bottomBarMenuSelected == 1
                                ? Theme.of(_).primaryColor
                                : Colors.transparent,
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withAlpha(100),
                                blurRadius: 6.0,
                                spreadRadius: 0.0,
                                offset: Offset(
                                  0.0,
                                  3.0,
                                ),
                              )
                            ],
                          ),
                          height: 5,
                          width: scheduleController.bottomBarMenuSelected == 1
                              ? MediaQuery.of(context).size.width / 2
                              : .1,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Calendário",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                FontAwesomeIcons.calendar,
                                size: 15,
                                color: Theme.of(_).textTheme.bodyText1.color,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
