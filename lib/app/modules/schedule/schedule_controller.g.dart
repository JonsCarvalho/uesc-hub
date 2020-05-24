// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ScheduleController on _ScheduleControllerBase, Store {
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
        'subjects: ${subjects.toString()},timetable: ${timetable.toString()},status: ${status.toString()}';
    return '{$string}';
  }
}
