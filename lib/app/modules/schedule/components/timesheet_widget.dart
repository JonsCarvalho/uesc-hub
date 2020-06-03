import 'package:flutter/material.dart';
import 'package:uesc_hub/app/modules/schedule/models/timetable_model.dart';
import 'package:uesc_hub/app/shared/functions/generation_color.dart';

class TimeSheetWidget extends StatelessWidget {
  final List list;

  TimeSheetWidget({Key key, @required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(list.length, (index) {
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
      }).toList(),
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
                padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
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
                  padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: GenerationColor(seed: subject).colorSubject()),
                    color: GenerationColor(seed: subject)
                        .colorSubject()
                        .withOpacity(.2),
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
                ),
              );
  }

  _criarLinhaTable(TimetableModel timetable) {
    return TableRow(
      children: [
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
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
      ],
    );
  }
}
