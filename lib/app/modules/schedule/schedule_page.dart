import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uesc_hub/app/modules/profile/components/sagres_login_widget.dart';
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

class _SchedulePageState
    extends ModularState<SchedulePage, ScheduleController> {
  final scheduleController = Modular.get<ScheduleController>();
  final sagresController = Modular.get<AuthSagresController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
          // Container(
          //   color: Colors.black38,
          //   padding: EdgeInsets.all(8),
          //   child: TimeSheetWidget(timetable: scheduleController.,),
          // ),
          Observer(
        builder: (_) {
          if (sagresController.credentials.isEmpty) {
            return Container(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Entre com o seu login do Sagres para ter acesso ao quadro de horários.',
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 8),
                  FlatButton(
                    color: Colors.teal,
                    onPressed: () {
                      showDialog(
                        context: _,
                        builder: (_) {
                          return SagresLoginWidget();
                        },
                      );
                    },
                    child: Text(
                      'Login Sagres',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          } else {
            if (scheduleController.timetable.error != null) {
              return Center(
                child: RaisedButton(
                  child: Text("Tente novamente!"),
                  onPressed: () {
                    scheduleController.getTimetable();
                  },
                ),
              );
            }
            if (scheduleController.timetable.value == null) {
              return LinearProgressIndicator();
            }
            List<TimetableModel> list;

            list = scheduleController.timetable.value.toList();

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: TimeSheetWidget(list: list),
            );
          }
        },
      ),
      //     Observer(
      //   builder: (_) {
      //     if (scheduleController.subjects.error != null) {
      //       return Center(
      //         child: RaisedButton(
      //           child: Text("Tente novamente!"),
      //           onPressed: () {
      //             scheduleController.fetchSubjects();
      //           },
      //         ),
      //       );
      //     }
      //     if (scheduleController.subjects.value == null) {
      //       return LinearProgressIndicator();
      //     }
      //     List<SubjectsModel> list;

      //     list = scheduleController.subjects.value.toList();

      //     return ListView.builder(
      //       physics: BouncingScrollPhysics(),
      //       itemCount: list.length,
      //       itemBuilder: (_, int index) {
      //         return Column(
      //           children: <Widget>[
      //             ListTile(
      //               title: Text(list[index].subject),
      //               leading: Text(list[index].id),
      //               subtitle: Text(list[index].classTheoreticalLocation + '\n' +list[index].classPracticeLocation),
      //               trailing: Text(list[index].classTheoretical + '\n' +list[index].classPractice),
      //             ),
      //             Divider(),
      //           ],
      //         );
      //       },
      //     );
      //   },
      // ),
    );
  }
}
