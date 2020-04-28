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

  final _$_ScheduleControllerBaseActionController =
      ActionController(name: '_ScheduleControllerBase');

  @override
  dynamic fetchSubjects() {
    final _$actionInfo =
        _$_ScheduleControllerBaseActionController.startAction();
    try {
      return super.fetchSubjects();
    } finally {
      _$_ScheduleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'subjects: ${subjects.toString()}';
    return '{$string}';
  }
}
