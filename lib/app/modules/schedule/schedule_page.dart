import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
          if (scheduleController.timetable.error != null) {
            return Center(
              child: RaisedButton(
                child: Text("Tente novamente!"),
                onPressed: () {
                  scheduleController.fetchTimetable();
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
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: list.length,
              itemBuilder: (_, int index) {
                if (index == 0) {
                  return Column(
                    children: [
                      Table(children: [
                        _criarLinhaTable(
                          TimetableModel(
                            startTime: '',
                            endTime: '',
                            seg: 'SEG',
                            ter: 'TER',
                            qua: 'QUA',
                            qui: 'QUI',
                            sex: 'SEX',
                          ),
                        ),
                      ]),
                      Table(children: [_criarLinhaTable(list[index])]),
                    ],
                  );
                } else {
                  return Table(children: [_criarLinhaTable(list[index])]);
                }
              },
            ),
          );
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

  _subjectWidget(String subject) {
    return subject == ""
        ? SizedBox()
        : subject.length == 3
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
                child: Container(
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(10),
                  //   border: Border.all(color: color),
                  //   color: color.withOpacity(.2),
                  // ),
                  child: Text(
                    subject,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12.0, color: Colors.black),
                  ),
                  padding: EdgeInsets.all(5.0),
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
                child: Container(
                  // onPressed: () {},
                  // borderSide: BorderSide(
                  //   color: color,
                  // ),
                  // shape: RoundedRectangleBorder(
                  // ),
                  //   side: BorderSide(
                  //     color: color,
                  //   ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: GenerationColor(seed: subject).colorSubject() ),
                    color: GenerationColor(seed: subject).colorSubject().withOpacity(.2),
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        subject.split('-')[0],
                        style: TextStyle(fontSize: 12.0, color: Colors.black),
                      ),
                      Text(
                        subject.split('-')[1],
                        style: TextStyle(fontSize: 10.0, color: Colors.black),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(5.0),
                ),
              );
  }

  _criarLinhaTable(TimetableModel timetable) {
    return TableRow(
        // decoration: BoxDecoration(color: Colors.white),
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 7),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: <Widget>[
                      Text(
                        timetable.startTime,
                        style: TextStyle(fontSize: 12.0, color: Colors.black),
                      ),
                      timetable.startTime == ""
                          ? SizedBox()
                          : SizedBox(
                              width: 20,
                              child: Divider(
                                color: Colors.black,
                                thickness: .5,
                                height: 1,
                              ),
                            ),
                      Text(
                        timetable.endTime,
                        style: TextStyle(fontSize: 12.0, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: _subjectWidget(timetable.seg),
              ),
              Expanded(
                flex: 5,
                child: _subjectWidget(timetable.ter),
              ),
              Expanded(
                flex: 5,
                child: _subjectWidget(timetable.qua),
              ),
              Expanded(
                flex: 5,
                child: _subjectWidget(timetable.qui),
              ),
              Expanded(
                flex: 5,
                child: _subjectWidget(timetable.sex),
              ),
            ],
          )
          // } else if (name == " ") {
          //   return SizedBox();
          // } else {
          //   return
          // Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
          //     child: Container(
          //       // onPressed: () {},
          //       // borderSide: BorderSide(
          //       //   color: color,
          //       // ),
          //       // shape: RoundedRectangleBorder(
          //       // ),
          //       //   side: BorderSide(
          //       //     color: color,
          //       //   ),
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10),
          //         border: Border.all(color: color),
          //         color: color.withOpacity(.2),
          //       ),
          //       child: Column(
          //         children: <Widget>[
          //           Text(
          //             name,
          //             style: TextStyle(fontSize: 12.0, color: Colors.black),
          //           ),
          //           Text(
          //             name,
          //             style: TextStyle(fontSize: 10.0, color: Colors.black),
          //           ),
          //         ],
          //       ),
          //       padding: EdgeInsets.all(5.0),
          //     ),
          //   );
          // }
        ]);
  }

  _criarLinhaTableDias(String listaNomes) {
    return TableRow(
      // decoration: BoxDecoration(color: Colors.white),
      children: listaNomes.split(',').map((name) {
        return name == "-"
            ? Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 12.0, color: Colors.black),
                  ),
                ),
              )
            : Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 12.0, color: Colors.black),
                  ),
                ),
              );
      }).toList(),
    );
  }
}
