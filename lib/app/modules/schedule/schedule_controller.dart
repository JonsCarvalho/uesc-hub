import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uesc_hub/app/modules/schedule/models/subjects_model.dart';
import 'package:uesc_hub/app/modules/schedule/models/timetable_model.dart';
import 'package:uesc_hub/app/modules/schedule/repositories/schedule_repository.dart';
import 'package:uesc_hub/app/shared/auth/sagres/auth_sagres_controller.dart';
import 'package:uesc_hub/app/shared/auth/sagres/repositories/auth_sagres_repository.dart';

part 'schedule_controller.g.dart';

class ScheduleController = _ScheduleControllerBase with _$ScheduleController;

abstract class _ScheduleControllerBase with Store {
  final ScheduleRepository repository;

  @observable
  String realTime;

  @observable
  DateTime daySelected;

  @observable
  ObservableMap<DateTime, List> holidays = {
    DateTime(2020, 6, 1): ['New Year\'s Day'],
    DateTime(2020, 6, 6): ['Epiphany'],
    DateTime(2020, 6, 14): ['Valentine\'s Day'],
    DateTime(2020, 6, 21): ['Easter Sunday'],
    DateTime(2020, 6, 22): ['Easter Monday'],
  }.asObservable();

  @observable
  ObservableMap<DateTime, List> events;

  @observable
  ObservableList selectedEvents;

  @observable
  CalendarController calendarController;

  @observable
  int bottomBarMenuSelected = 0;

  @observable
  PageController subjectsPageController;

  @observable
  PageController pageController = PageController(initialPage: 0);

  @observable
  int prevPage;

  @observable
  ObservableFuture<List<SubjectsModel>> subjects;

  @observable
  ObservableFuture<List<TimetableModel>> timetable;

  @observable
  DataStatus status = DataStatus.loading;

  _ScheduleControllerBase(this.repository) {
    // fetchSubjects();
    // fetchTimetable();
    subjectsPageController =
        PageController(initialPage: 0, viewportFraction: 0.8)
          ..addListener(onScroll);

    // Calendar start
    final _selectedDay = DateTime.now();
    daySelected =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

    events = {
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
    }.asObservable();

    selectedEvents = events[_selectedDay].asObservable() ?? [].asObservable();
    calendarController = CalendarController();

    // Calendar end

    getTimetableAndSubjects();

    realTime = _formatDateTime(DateTime.now());
  }

  @action
  changePage(int index) {
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.bounceIn);
    bottomBarMenuSelected = index;
  }

  @action
  void onDaySelected(DateTime day, List events) {
    selectedEvents = events.asObservable();
    daySelected = DateTime(day.year, day.month, day.day);
  }

  @action
  onScroll() {
    if (subjectsPageController.page.toInt() != prevPage) {
      prevPage = subjectsPageController.page.toInt();
    }
  }

  @action
  setSchedulePageIndex(String id) {
    int index = 0;
    for (var subjectsInstance in subjects.value) {
      if (subjectsInstance.id == id) {
        subjectsPageController.animateToPage(index,
            duration: Duration(milliseconds: 300), curve: Curves.bounceIn);
      }
      index++;
    }

    if (subjectsPageController.page.toInt() != prevPage) {
      prevPage = subjectsPageController.page.toInt();
    }
  }

  @action
  changeBottomBarMenuSelected(int value) {
    bottomBarMenuSelected = value;
  }

  @action
  fetchSubjects(credentials) {
    subjects = repository.getSubjects(credentials).asObservable();
  }

  @action
  fetchTimetable(credentials) {
    repository.setPersistenceTimetable(credentials);
  }

  @action
  fetchTimetableAndSubjects(credentials) {
    status = DataStatus.loading;
    repository.setPersistenceTimetableAndSubjects(credentials);
    status = DataStatus.none;
  }

  @action
  getTimetableAndSubjects() {
    status = DataStatus.loading;
    timetable = repository.getPersistenceTimetable().asObservable();
    subjects = repository.getPersistenceSubjects().asObservable();

    status = DataStatus.none;
  }

  @action
  getTimetable(credentials) {
    timetable = repository.getPersistenceTimetable().asObservable();
    if (timetable.value == null) {
      fetchTimetable(credentials);
    }
  }

  @action
  getSubjects(credentials) {
    subjects = repository.getPersistenceSubjects().asObservable();
    if (subjects.value == null) {
      fetchSubjects(credentials);
    }
  }

  @action
  deleteAll() {
    status = DataStatus.loading;

    // subjects.value.clear();
    // timetable.value.clear();
    repository.deletePersistenceSubjects();
    repository.deletePersistenceTimetable();

    status = DataStatus.none;
  }

  @action
  getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);

    realTime = formattedDateTime;
  }

  // @action
  String _formatDateTime(DateTime dateTime) {
    return DateFormat('HH:mm:ss').format(dateTime);
  }
}

enum DataStatus { loading, none }
