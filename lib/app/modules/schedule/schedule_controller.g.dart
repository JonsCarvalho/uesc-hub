// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ScheduleController on _ScheduleControllerBase, Store {
  final _$daySelectedAtom = Atom(name: '_ScheduleControllerBase.daySelected');

  @override
  DateTime get daySelected {
    _$daySelectedAtom.context.enforceReadPolicy(_$daySelectedAtom);
    _$daySelectedAtom.reportObserved();
    return super.daySelected;
  }

  @override
  set daySelected(DateTime value) {
    _$daySelectedAtom.context.conditionallyRunInAction(() {
      super.daySelected = value;
      _$daySelectedAtom.reportChanged();
    }, _$daySelectedAtom, name: '${_$daySelectedAtom.name}_set');
  }

  final _$holidaysAtom = Atom(name: '_ScheduleControllerBase.holidays');

  @override
  ObservableMap<DateTime, List<dynamic>> get holidays {
    _$holidaysAtom.context.enforceReadPolicy(_$holidaysAtom);
    _$holidaysAtom.reportObserved();
    return super.holidays;
  }

  @override
  set holidays(ObservableMap<DateTime, List<dynamic>> value) {
    _$holidaysAtom.context.conditionallyRunInAction(() {
      super.holidays = value;
      _$holidaysAtom.reportChanged();
    }, _$holidaysAtom, name: '${_$holidaysAtom.name}_set');
  }

  final _$eventsAtom = Atom(name: '_ScheduleControllerBase.events');

  @override
  ObservableMap<DateTime, List<dynamic>> get events {
    _$eventsAtom.context.enforceReadPolicy(_$eventsAtom);
    _$eventsAtom.reportObserved();
    return super.events;
  }

  @override
  set events(ObservableMap<DateTime, List<dynamic>> value) {
    _$eventsAtom.context.conditionallyRunInAction(() {
      super.events = value;
      _$eventsAtom.reportChanged();
    }, _$eventsAtom, name: '${_$eventsAtom.name}_set');
  }

  final _$selectedEventsAtom =
      Atom(name: '_ScheduleControllerBase.selectedEvents');

  @override
  ObservableList<dynamic> get selectedEvents {
    _$selectedEventsAtom.context.enforceReadPolicy(_$selectedEventsAtom);
    _$selectedEventsAtom.reportObserved();
    return super.selectedEvents;
  }

  @override
  set selectedEvents(ObservableList<dynamic> value) {
    _$selectedEventsAtom.context.conditionallyRunInAction(() {
      super.selectedEvents = value;
      _$selectedEventsAtom.reportChanged();
    }, _$selectedEventsAtom, name: '${_$selectedEventsAtom.name}_set');
  }

  final _$calendarControllerAtom =
      Atom(name: '_ScheduleControllerBase.calendarController');

  @override
  CalendarController get calendarController {
    _$calendarControllerAtom.context
        .enforceReadPolicy(_$calendarControllerAtom);
    _$calendarControllerAtom.reportObserved();
    return super.calendarController;
  }

  @override
  set calendarController(CalendarController value) {
    _$calendarControllerAtom.context.conditionallyRunInAction(() {
      super.calendarController = value;
      _$calendarControllerAtom.reportChanged();
    }, _$calendarControllerAtom, name: '${_$calendarControllerAtom.name}_set');
  }

  final _$bottomBarMenuSelectedAtom =
      Atom(name: '_ScheduleControllerBase.bottomBarMenuSelected');

  @override
  int get bottomBarMenuSelected {
    _$bottomBarMenuSelectedAtom.context
        .enforceReadPolicy(_$bottomBarMenuSelectedAtom);
    _$bottomBarMenuSelectedAtom.reportObserved();
    return super.bottomBarMenuSelected;
  }

  @override
  set bottomBarMenuSelected(int value) {
    _$bottomBarMenuSelectedAtom.context.conditionallyRunInAction(() {
      super.bottomBarMenuSelected = value;
      _$bottomBarMenuSelectedAtom.reportChanged();
    }, _$bottomBarMenuSelectedAtom,
        name: '${_$bottomBarMenuSelectedAtom.name}_set');
  }

  final _$subjectsPageControllerAtom =
      Atom(name: '_ScheduleControllerBase.subjectsPageController');

  @override
  PageController get subjectsPageController {
    _$subjectsPageControllerAtom.context
        .enforceReadPolicy(_$subjectsPageControllerAtom);
    _$subjectsPageControllerAtom.reportObserved();
    return super.subjectsPageController;
  }

  @override
  set subjectsPageController(PageController value) {
    _$subjectsPageControllerAtom.context.conditionallyRunInAction(() {
      super.subjectsPageController = value;
      _$subjectsPageControllerAtom.reportChanged();
    }, _$subjectsPageControllerAtom,
        name: '${_$subjectsPageControllerAtom.name}_set');
  }

  final _$pageControllerAtom =
      Atom(name: '_ScheduleControllerBase.pageController');

  @override
  PageController get pageController {
    _$pageControllerAtom.context.enforceReadPolicy(_$pageControllerAtom);
    _$pageControllerAtom.reportObserved();
    return super.pageController;
  }

  @override
  set pageController(PageController value) {
    _$pageControllerAtom.context.conditionallyRunInAction(() {
      super.pageController = value;
      _$pageControllerAtom.reportChanged();
    }, _$pageControllerAtom, name: '${_$pageControllerAtom.name}_set');
  }

  final _$prevPageAtom = Atom(name: '_ScheduleControllerBase.prevPage');

  @override
  int get prevPage {
    _$prevPageAtom.context.enforceReadPolicy(_$prevPageAtom);
    _$prevPageAtom.reportObserved();
    return super.prevPage;
  }

  @override
  set prevPage(int value) {
    _$prevPageAtom.context.conditionallyRunInAction(() {
      super.prevPage = value;
      _$prevPageAtom.reportChanged();
    }, _$prevPageAtom, name: '${_$prevPageAtom.name}_set');
  }

  final _$subjectsAtom = Atom(name: '_ScheduleControllerBase.subjects');

  @override
  ObservableFuture<List<SubjectsModel>> get subjects {
    _$subjectsAtom.context.enforceReadPolicy(_$subjectsAtom);
    _$subjectsAtom.reportObserved();
    return super.subjects;
  }

  @override
  set subjects(ObservableFuture<List<SubjectsModel>> value) {
    _$subjectsAtom.context.conditionallyRunInAction(() {
      super.subjects = value;
      _$subjectsAtom.reportChanged();
    }, _$subjectsAtom, name: '${_$subjectsAtom.name}_set');
  }

  final _$timetableAtom = Atom(name: '_ScheduleControllerBase.timetable');

  @override
  ObservableFuture<List<TimetableModel>> get timetable {
    _$timetableAtom.context.enforceReadPolicy(_$timetableAtom);
    _$timetableAtom.reportObserved();
    return super.timetable;
  }

  @override
  set timetable(ObservableFuture<List<TimetableModel>> value) {
    _$timetableAtom.context.conditionallyRunInAction(() {
      super.timetable = value;
      _$timetableAtom.reportChanged();
    }, _$timetableAtom, name: '${_$timetableAtom.name}_set');
  }

  final _$statusAtom = Atom(name: '_ScheduleControllerBase.status');

  @override
  DataStatus get status {
    _$statusAtom.context.enforceReadPolicy(_$statusAtom);
    _$statusAtom.reportObserved();
    return super.status;
  }

  @override
  set status(DataStatus value) {
    _$statusAtom.context.conditionallyRunInAction(() {
      super.status = value;
      _$statusAtom.reportChanged();
    }, _$statusAtom, name: '${_$statusAtom.name}_set');
  }

  final _$_ScheduleControllerBaseActionController =
      ActionController(name: '_ScheduleControllerBase');

  @override
  dynamic changePage(int index) {
    final _$actionInfo =
        _$_ScheduleControllerBaseActionController.startAction();
    try {
      return super.changePage(index);
    } finally {
      _$_ScheduleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onDaySelected(DateTime day, List<dynamic> events) {
    final _$actionInfo =
        _$_ScheduleControllerBaseActionController.startAction();
    try {
      return super.onDaySelected(day, events);
    } finally {
      _$_ScheduleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onScroll() {
    final _$actionInfo =
        _$_ScheduleControllerBaseActionController.startAction();
    try {
      return super.onScroll();
    } finally {
      _$_ScheduleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSchedulePageIndex(String id) {
    final _$actionInfo =
        _$_ScheduleControllerBaseActionController.startAction();
    try {
      return super.setSchedulePageIndex(id);
    } finally {
      _$_ScheduleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeBottomBarMenuSelected(int value) {
    final _$actionInfo =
        _$_ScheduleControllerBaseActionController.startAction();
    try {
      return super.changeBottomBarMenuSelected(value);
    } finally {
      _$_ScheduleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchSubjects(dynamic credentials) {
    final _$actionInfo =
        _$_ScheduleControllerBaseActionController.startAction();
    try {
      return super.fetchSubjects(credentials);
    } finally {
      _$_ScheduleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchTimetable(dynamic credentials) {
    final _$actionInfo =
        _$_ScheduleControllerBaseActionController.startAction();
    try {
      return super.fetchTimetable(credentials);
    } finally {
      _$_ScheduleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchTimetableAndSubjects(dynamic credentials) {
    final _$actionInfo =
        _$_ScheduleControllerBaseActionController.startAction();
    try {
      return super.fetchTimetableAndSubjects(credentials);
    } finally {
      _$_ScheduleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getTimetableAndSubjects() {
    final _$actionInfo =
        _$_ScheduleControllerBaseActionController.startAction();
    try {
      return super.getTimetableAndSubjects();
    } finally {
      _$_ScheduleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getTimetable(dynamic credentials) {
    final _$actionInfo =
        _$_ScheduleControllerBaseActionController.startAction();
    try {
      return super.getTimetable(credentials);
    } finally {
      _$_ScheduleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getSubjects(dynamic credentials) {
    final _$actionInfo =
        _$_ScheduleControllerBaseActionController.startAction();
    try {
      return super.getSubjects(credentials);
    } finally {
      _$_ScheduleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteAll() {
    final _$actionInfo =
        _$_ScheduleControllerBaseActionController.startAction();
    try {
      return super.deleteAll();
    } finally {
      _$_ScheduleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'daySelected: ${daySelected.toString()},holidays: ${holidays.toString()},events: ${events.toString()},selectedEvents: ${selectedEvents.toString()},calendarController: ${calendarController.toString()},bottomBarMenuSelected: ${bottomBarMenuSelected.toString()},subjectsPageController: ${subjectsPageController.toString()},pageController: ${pageController.toString()},prevPage: ${prevPage.toString()},subjects: ${subjects.toString()},timetable: ${timetable.toString()},status: ${status.toString()}';
    return '{$string}';
  }
}
