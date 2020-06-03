import 'package:expandable_bottom_bar/expandable_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uesc_hub/app/modules/schedule/components/timesheet_widget.dart';
import 'package:uesc_hub/app/modules/schedule/models/timetable_model.dart';

import '../schedule_controller.dart';

class ExpandableBottomBar extends StatelessWidget {
  final BottomBarController bottomBarController;
  final scheduleController = Modular.get<ScheduleController>();

  ExpandableBottomBar({Key key, @required this.bottomBarController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (scheduleController.status == DataStatus.none &&
            scheduleController.timetable.value == null) {
          return SizedBox();
        }

        List<TimetableModel> listTimetable;
        listTimetable = scheduleController.timetable.value.toList();

        return BottomExpandableAppBar(
          controller: bottomBarController,
          expandedHeight: bottomBarController.dragLength,
          attachSide: Side.Bottom,
          shape: AutomaticNotchedShape(
            RoundedRectangleBorder(),
            StadiumBorder(
              side: BorderSide(),
            ),
          ),
          bottomAppBarColor: Theme.of(_).appBarTheme.color,
          bottomOffset: 15,
          horizontalMargin: 8.0,
          appBarDecoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(100),
                blurRadius: 6.0,
                spreadRadius: 0.0,
                offset: Offset(
                  4.0,
                  0.0,
                ),
              ),
            ],
          ),
          expandedDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: ThemeData.dark().backgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(100),
                blurRadius: 6.0,
                spreadRadius: 0.0,
                offset: Offset(
                  4.0,
                  0.0,
                ),
              ),
            ],
          ),
          expandedBody: Padding(
            padding: const EdgeInsets.only(
              right: 16.0,
              left: 16.0,
              top: 25.0,
            ),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                TimeSheetWidget(list: listTimetable),
              ],
            ),
          ),
          bottomAppBarBody: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInCubic,
                        decoration: BoxDecoration(
                          color: scheduleController.bottomBarMenuSelected == 0
                              ? Theme.of(_).primaryColor
                              : Colors.transparent,
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Theme.of(context).primaryColor.withAlpha(100),
                              blurRadius: 6.0,
                              spreadRadius: 0.5,
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
                    FlatButton(
                      onPressed: () {
                        scheduleController.changeBottomBarMenuSelected(0);
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Tarefas",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInCubic,
                        decoration: BoxDecoration(
                          color: scheduleController.bottomBarMenuSelected == 1
                              ? Theme.of(_).primaryColor
                              : Colors.transparent,
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Theme.of(context).primaryColor.withAlpha(100),
                              blurRadius: 6.0,
                              spreadRadius: 0.5,
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
                    FlatButton(
                      onPressed: () {
                        scheduleController.changeBottomBarMenuSelected(1);
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              "Provas",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
