import 'package:flutter/material.dart';
import 'package:uesc_hub/app/modules/schedule/models/timetable_model.dart';

class TimeSheetWidget extends StatelessWidget {
  final List<TimetableModel> timetable;

  TimeSheetWidget({this.timetable});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: criaTabela(),
    );
  }

  listTableRows() {
    var rows;

    for (int index = 0; index < timetable.length; index++) {
      if (index == 0) {
        rows.add(_criarLinhaTableDias("   , SEG,TER,QUA,QUI,SEX"));
      } else {
        rows.add(_criarLinhaTable(
          "${timetable[index].startTime}'\n'${timetable[index].endTime},${timetable[index].seg},${timetable[index].ter},${timetable[index].qua},${timetable[index].qui},${timetable[index].sex}",
          Colors.teal,
        ));
      }
    }

    return rows;
  }

  teste() {
    Table(
      children: listTableRows(),
    );
  }

  criaTabela() {
    return Table(
      // border: TableBorder(
      //     bottom: BorderSide.none,
      //     horizontalInside: BorderSide(
      //       color: Colors.white,
      //       style: BorderStyle.none,
      //       width: 0.0,

      //     ),
      //     // verticalInside: BorderSide(
      //     //   color: Colors.black,
      //     //   style: BorderStyle.solid,
      //     //   width: 0,
      //     // ),
      //     // top:
      //     ),

      children: tes()
      // [


        
        //     _criarLinhaTableDias("   , SEG,TER,QUA,QUI,SEX"),
        //     _criarLinhaTable(
        //         "07:30\n08:20,CET48, ,CET432, ,CET66 ", Colors.teal),
        
        // _criarLinhaTable("08:20\n09:10,CET48, ,CET435, , ", Colors.amber),
        // _criarLinhaTable("09:10\n10:00, , , , ,CET089", Colors.red),
        // _criarLinhaTable("10:00, , ,CET075, , ", Colors.green),
        // _criarLinhaTable("13:30, ,CET075, , , ", Colors.green),
        // _criarLinhaTable("15:10, , , , , ", Colors.green),
        // _criarLinhaTable("17:40, , , , , ", Colors.green),
      // ],
    );
  }

  tes(){
    List list;
    var index = 0;
    while(index != 3){
      list.insertAll(index,_criarLinhaTableDias("   , SEG,TER,QUA,QUI,SEX"));
      index++;
    }
    return list;
  }

  _criarLinhaTable(String listaNomes, Color color) {
    return TableRow(
      // decoration: BoxDecoration(color: Colors.white),
      children: listaNomes.split(',').map((name) {
        if (name.contains(':')) {
          return Container(
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Text(
                  name.split('\n').first,
                  style: TextStyle(fontSize: 12.0, color: Colors.black),
                ),
                SizedBox(
                  width: 20,
                  child: Divider(
                    color: Colors.black,
                    thickness: .5,
                    height: 1,
                  ),
                ),
                Text(
                  name.split('\n').last,
                  style: TextStyle(fontSize: 12.0, color: Colors.black),
                ),
              ],
            ),
          );
        } else if (name == " ") {
          return SizedBox();
        } else {
          return Padding(
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
                border: Border.all(color: color),
                color: color.withOpacity(.2),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(fontSize: 12.0, color: Colors.black),
                  ),
                  Text(
                    name,
                    style: TextStyle(fontSize: 10.0, color: Colors.black),
                  ),
                ],
              ),
              padding: EdgeInsets.all(5.0),
            ),
          );
        }
      }).toList(),
    );
  }

  _criarLinhaTableDias(String listaNomes) {
    return TableRow(
      // decoration: BoxDecoration(color: Colors.white),
      children: listaNomes.split(',').map((name) {
        return Container(
          padding: EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text(
            name,
            style: TextStyle(fontSize: 12.0, color: Colors.black),
          ),
        );
      }).toList(),
    );
  }
}
