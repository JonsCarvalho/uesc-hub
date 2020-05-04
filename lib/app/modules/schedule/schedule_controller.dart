import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
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
  ObservableFuture<List<SubjectsModel>> subjects;

  @observable
  ObservableFuture<List<TimetableModel>> timetable;

  _ScheduleControllerBase(this.repository) {
    // fetchSubjects();
    // fetchTimetable();
    getTimetable();
  }

  @action
  fetchSubjects() {
    subjects = repository.getSubjects().asObservable();
  }

  // @action
  // fetchTimetable() {
  //   timetable = repository.getTimetable().asObservable();
  // }
  @action
  fetchTimetable() {
    repository.setPersistenceTimetable();
  }

  @action
  getTimetable() {
    timetable = repository.getPersistenceTimetable().asObservable();
    if (timetable.value == []) {
      fetchTimetable();
    }
  }
}
