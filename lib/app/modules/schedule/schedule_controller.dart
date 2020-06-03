import 'package:flutter/material.dart';
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
  int bottomBarMenuSelected = 0;

  @observable
  PageController pageController;

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
    pageController = PageController(initialPage: 0, viewportFraction: 0.8)
      ..addListener(onScroll);
    getTimetableAndSubjects();
  }

  @action
  onScroll() {
    if (pageController.page.toInt() != prevPage) {
      prevPage = pageController.page.toInt();
    }
  }

  @action
  setSchedulePageIndex(String id) {
    int index = 0;
    for (var subjectsInstance in subjects.value) {
      if (subjectsInstance.id == id) {
        pageController.animateToPage(index,
            duration: Duration(milliseconds: 300), curve: Curves.bounceIn);
      }
      index++;
    }

    if (pageController.page.toInt() != prevPage) {
      prevPage = pageController.page.toInt();
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
}

enum DataStatus { loading, none }
