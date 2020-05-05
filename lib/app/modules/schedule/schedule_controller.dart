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
    getTimetableAndSubjects();
  }

  @action
  fetchSubjects() {
    subjects = repository.getSubjects().asObservable();
  }

  @action
  fetchTimetable() {
    repository.setPersistenceTimetable();
  }

  @action
  fetchTimetableAndSubjects() {
    repository.setPersistenceTimetableAndSubjects();
  }

  @action
  getTimetableAndSubjects() {
    timetable = repository.getPersistenceTimetable().asObservable();
    subjects = repository.getPersistenceSubjects().asObservable();
    if (timetable.value == null || subjects.value == null) {
      fetchTimetableAndSubjects();
    }
  }

  @action
  getTimetable() {
    timetable = repository.getPersistenceTimetable().asObservable();
    if (timetable.value == null) {
      fetchTimetable();
    }
  }

  @action
  getSubjects() {
    subjects = repository.getPersistenceSubjects().asObservable();
    if (subjects.value == null) {
      fetchSubjects();
    }
  }
}
