import 'package:mobx/mobx.dart';
import 'package:uesc_hub/app/modules/schedule/models/subjects_model.dart';
import 'package:uesc_hub/app/modules/schedule/models/timetable_model.dart';
import 'package:uesc_hub/app/modules/schedule/repositories/schedule_repository.dart';

part 'schedule_controller.g.dart';

class ScheduleController = _ScheduleControllerBase with _$ScheduleController;

abstract class _ScheduleControllerBase with Store {
  final ScheduleRepository repository;
  
  @observable
  ObservableFuture<List<SubjectsModel>> subjects;
  
  @observable
  ObservableFuture<List<TimetableModel>> timetable;

  _ScheduleControllerBase(this.repository) {
    fetchSubjects();
    fetchTimetable();  
  }

  @action
  fetchSubjects() {
    subjects = repository.getSubjects().asObservable();
  }
  @action
  fetchTimetable() {
    timetable = repository.getTimetable().asObservable();
  }
}
