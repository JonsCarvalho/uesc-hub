import 'package:flutter/material.dart';
import 'package:expandable_bottom_bar/expandable_bottom_bar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uesc_hub/app/modules/profile/components/sagres_login_widget.dart';
import 'package:uesc_hub/app/modules/schedule/components/expandable_bottom_bar_widget.dart';
import 'package:uesc_hub/app/modules/schedule/components/subjects_list_widget.dart';
import 'package:uesc_hub/app/modules/schedule/components/timesheet_widget.dart';
import 'package:uesc_hub/app/modules/schedule/models/subjects_model.dart';
import 'package:uesc_hub/app/modules/schedule/models/timetable_model.dart';
import 'package:uesc_hub/app/shared/auth/sagres/auth_sagres_controller.dart';
import 'package:uesc_hub/app/shared/functions/generation_color.dart';
import 'schedule_controller.dart';

class SchedulePage extends StatefulWidget {
  final String title;
  const SchedulePage({Key key, this.title = "Schedule"}) : super(key: key);

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends ModularState<SchedulePage, ScheduleController>
    with SingleTickerProviderStateMixin {
  final scheduleController = Modular.get<ScheduleController>();
  final sagresController = Modular.get<AuthSagresController>();
  BottomBarController bottomBarController;

  @override
  void initState() {
    super.initState();
    bottomBarController = BottomBarController(
        vsync: this,
        dragLength: 330,
        snap: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onVerticalDragUpdate: bottomBarController.onDrag,
        onVerticalDragEnd: bottomBarController.onDragEnd,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).primaryColor.withAlpha(100),
                blurRadius: 6.0,
                spreadRadius: 0.0,
                offset: Offset(
                  0.0,
                  4.0,
                ),
              ),
            ],
          ),
          child: FloatingActionButton.extended(
            label: Text("Tabela de Horários"),
            elevation: 0.0,
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () => bottomBarController.swap(),
          ),
        ),
      ),
      bottomNavigationBar:
          ExpandableBottomBar(bottomBarController: bottomBarController),
      body: Observer(
        builder: (_) {
          // if (sagresController.credentials.isEmpty &&
          //     scheduleController.timetable.value == null) {
          //   return Container(
          //     padding: EdgeInsets.all(8),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.stretch,
          //       children: [
          //         Text(
          //           'Entre com o seu login do Sagres para ter acesso ao quadro de horários.',
          //           textAlign: TextAlign.justify,
          //         ),
          //         SizedBox(height: 8),
          //         FlatButton(
          //           color: Colors.teal,
          //           onPressed: () {
          //             showDialog(
          //               context: _,
          //               builder: (_) {
          //                 return SagresLoginWidget();
          //               },
          //             );
          //           },
          //           child: Text(
          //             'Login Sagres',
          //             style: TextStyle(color: Colors.white),
          //           ),
          //         ),
          //       ],
          //     ),
          //   );
          // }

          if (scheduleController.status == DataStatus.loading) {
            scheduleController.getTimetableAndSubjects();
            return LinearProgressIndicator();
          }
          if (scheduleController.status == DataStatus.none &&
              scheduleController.timetable.value == null) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Icon(FontAwesomeIcons.exclamationCircle),
                        SizedBox(height: 15),
                        Text(
                          "Quadro de horários não encontrado!",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    FlatButton(
                      color: Theme.of(_).primaryColor,
                      onPressed: () {
                        // scheduleController.fetchTimetableAndSubjects(
                        //   {
                        //     "username": sagresController.credentials[0],
                        //     "password": sagresController.credentials[1]
                        //   },
                        // );
                        scheduleController.getTimetableAndSubjects();
                      },
                      child: Text(
                        "Buscar novamente!",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          List<TimetableModel> listTimetable;
          List<SubjectsModel> listSubjects;
          listTimetable = scheduleController.timetable.value.toList();
          listSubjects = scheduleController.subjects.value.toList();
          return ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: TimeSheetWidget(list: listTimetable),
              ),
              SubjectsListWidget(list: listSubjects),
              SubjectsListWidget(list: listSubjects),
            ],
          );
          // Column(
          //   children: [
          // Container(
          //   height: listTimetable.length == 1
          //       ? 90
          //       : (listTimetable.length * 50.0) + 32,
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 8),
          //     child: TimeSheetWidget(list: listTimetable),
          //   ),
          // ),
          //     Expanded(
          //       child: SubjectsListWidget(list: listSubjects),
          //     ),
          //   ],
          // );
        },
      ),
    );
  }
}
