import 'package:expandable_bottom_bar/expandable_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uesc_hub/app/modules/schedule/components/timesheet_widget.dart';
import 'package:uesc_hub/app/modules/schedule/models/subjects_model.dart';
import 'package:uesc_hub/app/modules/schedule/models/timetable_model.dart';
import 'package:uesc_hub/app/shared/functions/generation_color.dart';

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
        List<SubjectsModel> listSubjects;
        listSubjects = scheduleController.subjects.value.toList();

        return BottomExpandableAppBar(
          controller: bottomBarController,
          expandedHeight: bottomBarController.dragLength,
          attachSide: Side.Bottom,
          shape: AutomaticNotchedShape(
            RoundedRectangleBorder(),
            StadiumBorder(
              side: BorderSide(
                style: BorderStyle.solid,
                color: Colors.black,
                width: 2,
              ),
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
            color: Theme.of(_).bottomAppBarColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withAlpha(100),
                blurRadius: 6.0,
                spreadRadius: 0.0,
                offset: Offset(
                  0.0,
                  -3.0,
                ),
              ),
            ],
          ),
          expandedBody: Padding(
            padding: const EdgeInsets.only(
              top: 25.0,
            ),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:16.0),
                  child: TimeSheetWidget(list: listTimetable),
                ),
                Positioned(
                  bottom: 50.0,
                  child: Container(
                    height: 130.0,
                    width: MediaQuery.of(context).size.width,
                    child: PageView.builder(
                      controller: scheduleController.subjectsPageController,
                      itemCount: listSubjects.length,
                      itemBuilder: (_, int index) {
                        return _subjectsCard(index, listSubjects);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomAppBarBody: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Theme.of(_).primaryColor.withAlpha(50),
                  style: BorderStyle.solid,
                  width: 1,
                ),
              ),
              gradient: LinearGradient(
                colors: [
                  // Colors.grey.withAlpha(100),
                  Colors.blue.withAlpha(50),
                  Theme.of(_).primaryColor.withAlpha(50),
                  Colors.green.withAlpha(50),
                ],
              ),
            ),
            child: Row(
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
                          height: 7,
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
                          height: 7,
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
          ),
        );
      },
    );
  }

  _subjectsCard(index, List<SubjectsModel> listSubjects) {
    return AnimatedBuilder(
      animation: scheduleController.subjectsPageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (scheduleController.subjectsPageController.position.haveDimensions) {
          value = scheduleController.subjectsPageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 125.0,
            width: Curves.easeInOut.transform(value) * 350.0,
            child: widget,
          ),
        );
      },
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 20.0,
                ),
                height: 125.0,
                width: 275.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withAlpha(100),
                      blurRadius: 6.0,
                      spreadRadius: 0.0,
                      offset: Offset(
                        3.0,
                        -1.0,
                      ),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      height: 90.0,
                      width: 10.0,
                      decoration: BoxDecoration(
                        color: GenerationColor(seed: listSubjects[index].id)
                            .colorSubject(),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0)),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 5.0,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              listSubjects[index].subject,
                              style: TextStyle(
                                  fontSize: 12.5, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              listSubjects[index].id,
                              style: TextStyle(
                                  color: GenerationColor(
                                          seed: listSubjects[index].id)
                                      .colorSubject(),
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.w300),
                            ),
                            if (listSubjects[index].classTheoretical.isNotEmpty)
                              Row(
                                children: [
                                  Text(
                                    listSubjects[index].classTheoretical +
                                        " - ",
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Expanded(
                                    child: Text(
                                      listSubjects[index]
                                          .classTheoreticalLocation,
                                      style: TextStyle(
                                          fontSize: 8.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                            if (listSubjects[index].classPractice.isNotEmpty)
                              Row(
                                children: [
                                  Text(
                                    listSubjects[index].classPractice + " - ",
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Expanded(
                                    child: Text(
                                      listSubjects[index].classPracticeLocation,
                                      style: TextStyle(
                                          fontSize: 8.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
