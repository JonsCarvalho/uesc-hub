import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uesc_hub/app/modules/schedule/components/timesheet_widget.dart';
import 'package:uesc_hub/app/modules/schedule/models/subjects_model.dart';
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
          //   child: TimeSheetWidget(),
          // ),
          Observer(
        builder: (_) {
          if (scheduleController.subjects.error != null) {
            return Center(
              child: RaisedButton(
                child: Text("Tente novamente!"),
                onPressed: () {
                  scheduleController.fetchSubjects();
                },
              ),
            );
          }
          if (scheduleController.subjects.value == null) {
            return LinearProgressIndicator();
          }
          List<SubjectsModel> list;

          list = scheduleController.subjects.value.toList();

          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (_, int index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    title: Text(list[index].subject),
                    leading: Text(list[index].id),
                    subtitle: Text(list[index].classTheoreticalLocation + '\n' +list[index].classPracticeLocation),
                    trailing: Text(list[index].classTheoretical + '\n' +list[index].classPractice),
                  ),
                  Divider(),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
