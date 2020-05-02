import 'package:flutter/material.dart';
import 'package:uesc_hub/app/shared/functions/generation_date.dart';

DateTime _date = DateTime.now();

renderDays() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Stack(
      children: <Widget>[
        Container(
          height: 70,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              getData(_date, GenerationDate(dateTime: _date).getDay()),
              getData(_date.add(Duration(days: 1)),
                  GenerationDate(dateTime: _date.add(Duration(days: 1))).getDay()),
              getData(_date.add(Duration(days: 2)),
                  GenerationDate(dateTime: _date.add(Duration(days: 2))).getDay()),
              getData(_date.add(Duration(days: 3)),
                  GenerationDate(dateTime:_date.add(Duration(days: 3))).getDay()),
              getData(_date.add(Duration(days: 4)),
                  GenerationDate(dateTime: _date.add(Duration(days: 4))).getDay()),
              getData(_date.add(Duration(days: 5)),
                  GenerationDate(dateTime: _date.add(Duration(days: 5))).getDay()),
              getData(_date.add(Duration(days: 6)),
                  GenerationDate(dateTime: _date.add(Duration(days: 6))).getDay()),
              SizedBox(
                width: 15,
              ),
            ],
          ),
        )
      ],
    ),
  );
}

getData(DateTime data, String dia) {
  return AnimatedContainer(
    margin: EdgeInsets.only(left: 15),
    duration: Duration(milliseconds: 500),
    curve: Curves.easeIn,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: switchColor(data),
    ),
    width: 50,
    child: InkWell(
      onTap: () {
        // setState(() {
        //   selectedDate(data);
        //   selDay = dia;
        // });
      },
      borderRadius: BorderRadius.circular(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            data.day.toString(),
            style: TextStyle(
              fontSize: 15,
              color: switchContentColor(data),
            ),
          ),
          Divider(
            color: switchContentColor(data),
          ),
          Text(
            dia.substring(0, 3),
            style: TextStyle(
              fontSize: 15,
              color: switchContentColor(data),
            ),
          ),
        ],
      ),
    ),
  );
}

Color switchColor(DateTime data) {
  
  // if (data.day == selDate) {
  if (true) {
    return Colors.amber;
  } else {
    return Colors.grey[200];
  }
}

Color switchContentColor(DateTime data) {
  // if (data.day == selDate) {
  if (true) {
    return Colors.black;
  } else {
    return Colors.grey;
  }
}

selectedDate(DateTime data) {
  // setState(() {
  //   _currentData = data;
  //   selDate = data.day;
  // });
}
