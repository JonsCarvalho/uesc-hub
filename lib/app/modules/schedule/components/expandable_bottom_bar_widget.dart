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
          // bottomAppBarColor: ThemeData.dark().backgroundColor,
          horizontalMargin: 8.0,
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
          bottomAppBarBody: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Tets",
                    textAlign: TextAlign.center,
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
                Expanded(
                  child: Text(
                    "Stet",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
