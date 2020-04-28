import 'package:mobx/mobx.dart';
import 'package:uesc_hub/app/modules/schedule/models/subjects_model.dart';
import 'package:uesc_hub/app/modules/schedule/repositories/schedule_repository.dart';

part 'schedule_controller.g.dart';

class ScheduleController = _ScheduleControllerBase with _$ScheduleController;

abstract class _ScheduleControllerBase with Store {
  final ScheduleRepository repository;
  
  @observable
  ObservableFuture<List<SubjectsModel>> subjects;

  _ScheduleControllerBase(this.repository) {
    fetchSubjects();
  }

  @action
  fetchSubjects() {
    subjects = repository.getAllSubjects().asObservable();
  }
}
