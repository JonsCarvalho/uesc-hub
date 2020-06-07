import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:table_calendar/table_calendar.dart';

import '../schedule_controller.dart';

class Calendar extends StatelessWidget {
  final AnimationController animationController;

  Calendar({Key key, @required this.animationController}) : super(key: key);
  final scheduleController = Modular.get<ScheduleController>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Column(
        children: [
          _buildTableCalendarWithBuilders(context),
          // _buildCustomCalendar(),
          if (scheduleController.daySelected !=
              DateTime(DateTime.now().year, DateTime.now().month,
                  DateTime.now().day))
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: _buildButtons(context),
            ),
          const SizedBox(height: 8.0),
          _buildEventList(),
        ],
      );
    });
  }

  Widget _buildTableCalendarWithBuilders(context) {
    return Observer(builder: (_) {
      return TableCalendar(
        locale: 'pt_BR',
        calendarController: scheduleController.calendarController,
        events: scheduleController.events,
        holidays: scheduleController.holidays,
        initialCalendarFormat: CalendarFormat.week,
        formatAnimation: FormatAnimation.slide,
        startingDayOfWeek: StartingDayOfWeek.sunday,
        availableGestures: AvailableGestures.all,
        availableCalendarFormats: const {
          CalendarFormat.month: 'Mês',
          CalendarFormat.week: 'Semana',
        },
        calendarStyle: CalendarStyle(
          // outsideDaysVisible: false,
          weekendStyle:
              TextStyle().copyWith(color: Theme.of(context).primaryColorDark),
          holidayStyle:
              TextStyle().copyWith(color: Theme.of(context).accentColor),
          outsideWeekendStyle:
              TextStyle().copyWith(color: Theme.of(context).primaryColorLight),
          outsideHolidayStyle: TextStyle()
              .copyWith(color: Theme.of(context).accentColor.withAlpha(100)),
        ),
        daysOfWeekStyle: DaysOfWeekStyle(
          weekendStyle:
              TextStyle().copyWith(color: Theme.of(context).primaryColorDark),
        ),
        headerStyle: HeaderStyle(
          centerHeaderTitle: true,
          formatButtonDecoration: BoxDecoration(
            border: const Border(
                top: BorderSide(),
                bottom: BorderSide(),
                left: BorderSide(),
                right: BorderSide()),
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
        ),
        builders: CalendarBuilders(
          selectedDayBuilder: (context, date, _) {
            return FadeTransition(
              opacity: Tween(begin: 0.0, end: 1.0).animate(animationController),
              child: Container(
                margin: const EdgeInsets.all(4.0),
                padding: const EdgeInsets.only(top: 5.0, left: 6.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 100,
                height: 100,
                child: Text(
                  '${date.day}',
                  style: TextStyle().copyWith(
                      color: Theme.of(context).primaryTextTheme.button.color,
                      fontSize: 16.0),
                ),
              ),
            );
          },
          todayDayBuilder: (context, date, _) {
            return Container(
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.only(top: 5.0, left: 6.0),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 100,
              height: 100,
              child: Text(
                '${date.day}',
                style: TextStyle().copyWith(
                    color: Theme.of(context).primaryTextTheme.bodyText1.color,
                    fontSize: 16.0),
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
                  child: _buildEventsMarker(date, events, context),
                ),
              );
            }

            if (holidays.isNotEmpty) {
              children.add(
                Positioned(
                  right: -2,
                  top: -2,
                  child: _buildHolidaysMarker(context),
                ),
              );
            }

            return children;
          },
        ),
        onDaySelected: (date, events) {
          scheduleController.onDaySelected(date, events);
          animationController.forward(from: 0.0);
        },
      );
    });
  }

  Widget _buildEventsMarker(DateTime date, List events, context) {
    return Observer(builder: (_) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: scheduleController.calendarController.isSelected(date)
              ? Theme.of(context).accentColor
              : scheduleController.calendarController.isToday(date)
                  ? Theme.of(context).accentColor.withAlpha(150)
                  : Theme.of(context).accentColor.withAlpha(150),
        ),
        width: 16.0,
        height: 16.0,
        child: Center(
          child: Text(
            '${events.length}',
            style: TextStyle().copyWith(
              color: Theme.of(context).primaryTextTheme.bodyText1.color,
              fontSize: 12.0,
            ),
          ),
        ),
      );
    });
  }

  Widget _buildHolidaysMarker(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(
        Icons.stars,
        size: 15.0,
        color: Theme.of(context).primaryColorLight,
      ),
    );
  }

  Widget _buildButtons(context) {
    return Observer(builder: (_) {
      return FlatButton(
        color: Theme.of(context).accentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text('Voltar para o dia atual', style: TextStyle().copyWith(color: Theme.of(context).primaryTextTheme.button.color),),
        onPressed: () {
          scheduleController.calendarController.setSelectedDay(
            DateTime.now(),
            runCallback: true,
          );
        },
      );
    });
  }

  Widget _buildEventList() {
    return Observer(builder: (_) {
      return Column(
        children: [
          if (scheduleController.holidays[DateTime(
                  scheduleController.daySelected.year,
                  scheduleController.daySelected.month,
                  scheduleController.daySelected.day)] !=
              null)
            Column(
              children: scheduleController.holidays[DateTime(
                      scheduleController.daySelected.year,
                      scheduleController.daySelected.month,
                      scheduleController.daySelected.day)]
                  .map(
                    (holiday) => Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.8),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      child: ListTile(
                        title: Text(holiday.toString()),
                        onTap: () => print('$holiday tapped!'),
                      ),
                    ),
                  )
                  .toList(),
            ),
          if (scheduleController.selectedEvents != null)
            Column(
              children: scheduleController.selectedEvents
                  .map((event) => Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.8),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        child: ListTile(
                          title: Text(event.toString()),
                          onTap: () => print('$event tapped!'),
                        ),
                      ))
                  .toList(),
            ),
        ],
      );
    });
  }
}
