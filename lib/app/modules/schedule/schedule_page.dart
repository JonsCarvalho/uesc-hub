import 'package:flutter/material.dart';
import 'package:expandable_bottom_bar/expandable_bottom_bar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
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
    with TickerProviderStateMixin {
  final scheduleController = Modular.get<ScheduleController>();
  final sagresController = Modular.get<AuthSagresController>();
  BottomBarController bottomBarController;

  // Calendar start
  final Map<DateTime, List> _holidays = {
    DateTime(2019, 1, 1): ['New Year\'s Day'],
    DateTime(2019, 1, 6): ['Epiphany'],
    DateTime(2019, 2, 14): ['Valentine\'s Day'],
    DateTime(2019, 4, 21): ['Easter Sunday'],
    DateTime(2019, 4, 22): ['Easter Monday'],
  };

  Map<DateTime, List> _events;
  List _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;

  // Calendar end

  @override
  void initState() {
    super.initState();
    bottomBarController =
        BottomBarController(vsync: this, dragLength: 330, snap: true);

    // Calendar start
    final _selectedDay = DateTime.now();

    _events = {
      _selectedDay.subtract(Duration(days: 30)): [
        'Event A0',
        'Event B0',
        'Event C0'
      ],
      _selectedDay.subtract(Duration(days: 27)): ['Event A1'],
      _selectedDay.subtract(Duration(days: 20)): [
        'Event A2',
        'Event B2',
        'Event C2',
        'Event D2'
      ],
      _selectedDay.subtract(Duration(days: 16)): ['Event A3', 'Event B3'],
      _selectedDay.subtract(Duration(days: 10)): [
        'Event A4',
        'Event B4',
        'Event C4'
      ],
      _selectedDay.subtract(Duration(days: 4)): [
        'Event A5',
        'Event B5',
        'Event C5'
      ],
      _selectedDay.subtract(Duration(days: 2)): ['Event A6', 'Event B6'],
      _selectedDay: ['Event A7', 'Event B7', 'Event C7', 'Event D7'],
      _selectedDay.add(Duration(days: 1)): [
        'Event A8',
        'Event B8',
        'Event C8',
        'Event D8'
      ],
      _selectedDay.add(Duration(days: 3)):
          Set.from(['Event A9', 'Event A9', 'Event B9']).toList(),
      _selectedDay.add(Duration(days: 7)): [
        'Event A10',
        'Event B10',
        'Event C10'
      ],
      _selectedDay.add(Duration(days: 11)): ['Event A11', 'Event B11'],
      _selectedDay.add(Duration(days: 17)): [
        'Event A12',
        'Event B12',
        'Event C12',
        'Event D12'
      ],
      _selectedDay.add(Duration(days: 22)): ['Event A13', 'Event B13'],
      _selectedDay.add(Duration(days: 26)): [
        'Event A14',
        'Event B14',
        'Event C14'
      ],
    };

    _selectedEvents = _events[_selectedDay] ?? [];
    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
    // Calendar end
  }

  void dispose() {
    // Calendar start
    _animationController.dispose();
    _calendarController.dispose();
    // Calendar end
    super.dispose();
  }

  // Calendar start

  void _onDaySelected(DateTime day, List events) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  void _onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onCalendarCreated');
  }

  // Calendar end

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

          // if (scheduleController.status == DataStatus.loading) {
          //   scheduleController.getTimetableAndSubjects();
          //   return LinearProgressIndicator();
          // }
          // if (scheduleController.status == DataStatus.none &&
          //     scheduleController.timetable.value == null) {
          //   return Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Container(
          //       width: double.infinity,
          //       height: 150,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(5),
          //         border: Border.all(),
          //       ),
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.spaceAround,
          //         children: [
          //           Column(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             crossAxisAlignment: CrossAxisAlignment.stretch,
          //             children: [
          //               Icon(FontAwesomeIcons.exclamationCircle),
          //               SizedBox(height: 15),
          //               Text(
          //                 "Quadro de horários não encontrado!",
          //                 textAlign: TextAlign.center,
          //               ),
          //             ],
          //           ),
          //           FlatButton(
          //             color: Theme.of(_).primaryColor,
          //             onPressed: () {
          //               // scheduleController.fetchTimetableAndSubjects(
          //               //   {
          //               //     "username": sagresController.credentials[0],
          //               //     "password": sagresController.credentials[1]
          //               //   },
          //               // );
          //               scheduleController.getTimetableAndSubjects();
          //             },
          //             child: Text(
          //               "Buscar novamente!",
          //               style: TextStyle(color: Colors.white),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   );
          // }
          // List<TimetableModel> listTimetable;
          // List<SubjectsModel> listSubjects;
          // listTimetable = scheduleController.timetable.value.toList();
          // listSubjects = scheduleController.subjects.value.toList();
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              // Switch out 2 lines below to play with TableCalendar's settings
              //-----------------------
              // _buildTableCalendar(),
              // _buildTableCalendarWithBuilders(),
              _buildCustomCalendar(),
              const SizedBox(height: 8.0),
              _buildButtons(),
              const SizedBox(height: 8.0),
              Expanded(child: _buildEventList()),
            ],
          );
          // return ListView(
          //   physics: BouncingScrollPhysics(),
          //   children: [
          // Padding(
          //   padding:
          //       const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          //   child: TimeSheetWidget(list: listTimetable),
          // ),
          // SubjectsListWidget(list: listSubjects),
          // SubjectsListWidget(list: listSubjects),

          //   ],
          // );
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

  // Calendar start
  Widget _buildCustomCalendar() {
    return TableCalendar(
      calendarController: _calendarController,
      locale: 'pt_BR',
      events: _events,
      holidays: _holidays,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        selectedColor: Colors.deepOrange[400],
        todayColor: Colors.deepOrange[200],
        markersColor: Colors.brown[700],
        outsideDaysVisible: false,
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle:
            TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Colors.deepOrange[400],
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );
  }

  // Simple TableCalendar configuration (using Styles)
  Widget _buildTableCalendar() {
    return TableCalendar(
      calendarController: _calendarController,
      events: _events,
      holidays: _holidays,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        selectedColor: Colors.deepOrange[400],
        todayColor: Colors.deepOrange[200],
        markersColor: Colors.brown[700],
        outsideDaysVisible: false,
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle:
            TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Colors.deepOrange[400],
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );
  }

  // More advanced TableCalendar configuration (using Builders & Styles)
  Widget _buildTableCalendarWithBuilders() {
    return TableCalendar(
      locale: 'pl_PL',
      calendarController: _calendarController,
      events: _events,
      holidays: _holidays,
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      availableGestures: AvailableGestures.all,
      availableCalendarFormats: const {
        CalendarFormat.month: '',
        CalendarFormat.week: '',
      },
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        weekendStyle: TextStyle().copyWith(color: Colors.blue[800]),
        holidayStyle: TextStyle().copyWith(color: Colors.blue[800]),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle().copyWith(color: Colors.blue[600]),
      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonVisible: false,
      ),
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, _) {
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
            child: Container(
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.only(top: 5.0, left: 6.0),
              color: Colors.deepOrange[300],
              width: 100,
              height: 100,
              child: Text(
                '${date.day}',
                style: TextStyle().copyWith(fontSize: 16.0),
              ),
            ),
          );
        },
        todayDayBuilder: (context, date, _) {
          return Container(
            margin: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.only(top: 5.0, left: 6.0),
            color: Colors.amber[400],
            width: 100,
            height: 100,
            child: Text(
              '${date.day}',
              style: TextStyle().copyWith(fontSize: 16.0),
            ),
          );
        },
        markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];

          if (events.isNotEmpty) {
            children.add(
              Positioned(
                right: 1,
                bottom: 1,
                child: _buildEventsMarker(date, events),
              ),
            );
          }

          if (holidays.isNotEmpty) {
            children.add(
              Positioned(
                right: -2,
                top: -2,
                child: _buildHolidaysMarker(),
              ),
            );
          }

          return children;
        },
      ),
      onDaySelected: (date, events) {
        _onDaySelected(date, events);
        _animationController.forward(from: 0.0);
      },
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: _calendarController.isSelected(date)
            ? Colors.brown[500]
            : _calendarController.isToday(date)
                ? Colors.brown[300]
                : Colors.blue[400],
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }

  Widget _buildHolidaysMarker() {
    return Icon(
      Icons.add_box,
      size: 20.0,
      color: Colors.blueGrey[800],
    );
  }

  Widget _buildButtons() {
    final dateTime = _events.keys.elementAt(_events.length - 2);

    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text('Month'),
              onPressed: () {
                setState(() {
                  _calendarController.setCalendarFormat(CalendarFormat.month);
                });
              },
            ),
            RaisedButton(
              child: Text('2 weeks'),
              onPressed: () {
                setState(() {
                  _calendarController
                      .setCalendarFormat(CalendarFormat.twoWeeks);
                });
              },
            ),
            RaisedButton(
              child: Text('Week'),
              onPressed: () {
                setState(() {
                  _calendarController.setCalendarFormat(CalendarFormat.week);
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        RaisedButton(
          child: Text(
              'Set day ${dateTime.day}-${dateTime.month}-${dateTime.year}'),
          onPressed: () {
            _calendarController.setSelectedDay(
              DateTime(dateTime.year, dateTime.month, dateTime.day),
              runCallback: true,
            );
          },
        ),
      ],
    );
  }

  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents
          .map((event) => Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.8),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: ListTile(
                  title: Text(event.toString()),
                  onTap: () => print('$event tapped!'),
                ),
              ))
          .toList(),
    );
  }
  // Calendar end
}
