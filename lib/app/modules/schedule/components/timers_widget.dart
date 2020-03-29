import 'package:flutter/material.dart';
import 'package:weekly_timetable/weekly_timetable.dart';

class TimersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
      ),
      // height: 100,
      child: tableWidget(),
    );
  }

  timersWidget() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('07:30'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('08:20'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('09:10'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('10:00'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('10:50'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('11:40'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('12:30'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('13:30'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('14:20'),
        ),
        Text('15:10'),
        Text('16:00'),
        Text('16:50'),
        Text('17:40'),
        Text('18:30'),
      ],
    );
  }

  tableWidget() {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Container(
            child: Row(
              // padding: EdgeInsets.only(top: 8, left: 10, right: 10),

              children: <Widget>[
                headerWidget(0),
                headerWidget(1),
                headerWidget(2),
                headerWidget(3),
                headerWidget(4),
                headerWidget(5),
                headerWidget(6),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 17,
          child: Container(
            child: ListView.builder(
              // padding: EdgeInsets.only(
              //   left: 10,right: 10
              // ),
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (BuildContext context, int i) {
                int j = 0;

                return Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(0),
                      color: Colors.transparent,
                      height: 46,
                      width: 50,
                      child: Card(
                        margin: EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                        //elevation: 2,
                        color: Colors.black,
                        child: Center(
                          child: Text(
                            _getLetras(i),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    _getLinha(i, j + 0),
                    _getLinha(i, j + 1),
                    _getLinha(i, j + 2),
                    _getLinha(i, j + 3),
                    _getLinha(i, j + 4),
                    _getLinha(i, j + 5),
                    // _getLinha(i, j + 6),
                    // _getLinha(i, j + 7),
                    // _getLinha(i, j + 8),
                    // _getLinha(i, j + 9),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  // _color(i, j, tabuleiro) {
  //   // ((tiro.toString() == "[$i, $j]") || (tabuleiroTirosAliado[i][j] == "x")) {
  //   String codigo = tabuleiro[i][j].toString();
  //   bool aux = false;

  //   if (!aux) {
  //     return Colors.cyan;
  //   }
  // }

  _getLinha(i, j) {
    return Container(
      margin: EdgeInsets.all(0),
      color: Colors.transparent,
      height: 46,
      width: 50,
      child: Card(
        margin: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        //elevation: 2,
        color: Colors.purple, //_color(i, j, tabuleiro),
        child: InkWell(
          onTap: () {},
          child: Center(
              // child: tiles(i, j, tabuleiroTiros, tabuleiro),
              ),
        ),
      ),
    );
  }

  _getLetras(i) {
    String letra;
    switch (i) {
      case 0:
        letra = "07:30\n08:20";
        break;
      case 1:
        letra = "B";
        break;
      case 2:
        letra = "C";
        break;
      case 3:
        letra = "D";
        break;
      case 4:
        letra = "E";
        break;
      case 5:
        letra = "F";
        break;
      case 6:
        letra = "G";
        break;
      case 7:
        letra = "H";
        break;
      case 8:
        letra = "I";
        break;
      case 9:
        letra = "J";
        break;
    }

    return letra;
  }

  _getDay(i) {
    switch (i) {
      case 0:
        return "   ";
        break;
      case 1:
        return "SEG";
        break;
      case 2:
        return "TER";
        break;
      case 3:
        return "QUA";
        break;
      case 4:
        return "QUI";
        break;
      case 5:
        return "SEX";
        break;
      case 6:
        return "SÁB";
        break;
    }
  }

  headerWidget(i) {
    return Container(
      margin: EdgeInsets.all(0),
      color: Colors.transparent,
      height: 23,
      width: 50,
      child: Card(
        margin: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        //elevation: 2,
        color: Colors.black,
        child: Center(
          child: Text(
            _getDay(i),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  courseBoardWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
      ),
      // height: 200,
      child: Column(
        children: <Widget>[
          // headerWidget(),
          tableWidget(),
        ],
      ),
    );
  }
}
