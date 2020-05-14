import 'package:dio/dio.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uesc_hub/app/modules/schedule/models/subjects_model.dart';
import 'package:uesc_hub/app/modules/schedule/models/timetable_model.dart';
import 'package:uesc_hub/app/shared/auth/sagres/auth_sagres_controller.dart';
import 'package:uesc_hub/app/shared/auth/sagres/repositories/auth_sagres_repository.dart';
import 'package:uesc_hub/app/shared/constants.dart';
import 'package:uesc_hub/app/shared/repositories/localstorage/local_storage_interface.dart';

import '../schedule_controller.dart';

class ScheduleRepository {
  final Dio dio;

  ScheduleRepository(this.dio);

  final ILocalStorage storage = Modular.get();
  final sagresController = Modular.get<AuthSagresController>();

  Future<List<SubjectsModel>> getSubjects(credentials) async {
    var response = await dio.post(
      URL_SAGRES_BASE + "/subjects/",
      data: credentials,
    );

    List<SubjectsModel> list = [];

    for (var json in (response.data)) {
      SubjectsModel model = SubjectsModel(
        classPractice: json['class-practice'],
        classPracticeLocation: json['class-practice-location'],
        classTheoretical: json['class-theoretical'],
        classTheoreticalLocation: json['class-theoretical-location'],
        id: json['id'],
        subject: json['subject'],
      );
      list.add(model);
    }

    return list;
  }

  Future<List<TimetableModel>> getTimetable(credentials) async {
    var response = await dio.post(
      URL_SAGRES_BASE + "/timetable/",
      data: credentials,
    );

    List<TimetableModel> list = [];

    for (var json in (response.data)) {
      TimetableModel model = TimetableModel(
        startTime: json['start-time'],
        endTime: json['end-time'],
        seg: json['seg'],
        ter: json['ter'],
        qua: json['qua'],
        qui: json['qui'],
        sex: json['sex'],
        sab: json['sab'],
        dom: json['dom'],
      );
      list.add(model);
    }

    return list;
  }

  Future<List> getAll(credentials) async {
    var response = await dio.post(
      URL_SAGRES_BASE + "/all/",
      data: credentials,
    );

    var data = response.data;

    List<TimetableModel> listTimetable = [];

    for (var json in (data[0]['timetable'])) {
      TimetableModel model = TimetableModel(
        startTime: json['start-time'],
        endTime: json['end-time'],
        seg: json['seg'],
        ter: json['ter'],
        qua: json['qua'],
        qui: json['qui'],
        sex: json['sex'],
        sab: json['sab'],
        dom: json['dom'],
      );
      listTimetable.add(model);
    }

    List<SubjectsModel> listSubjects = [];

    for (var json in (data[0]['subjects'])) {
      SubjectsModel model = SubjectsModel(
        classPractice: json['class-practice'],
        classPracticeLocation: json['class-practice-location'],
        classTheoretical: json['class-theoretical'],
        classTheoreticalLocation: json['class-theoretical-location'],
        id: json['id'],
        subject: json['subject'],
      );
      listSubjects.add(model);
    }

    return [listTimetable, listSubjects];
  }

  setPersistenceTimetableAndSubjects(credentials) async {
    List list = await getAll(credentials);

    List<String> strListTimetable = [];
    for (final instance in list[0]) {
      strListTimetable.add(instance.startTime);
      strListTimetable.add(instance.endTime);
      strListTimetable.add(instance.seg);
      strListTimetable.add(instance.ter);
      strListTimetable.add(instance.qua);
      strListTimetable.add(instance.qui);
      strListTimetable.add(instance.sex);
      strListTimetable.add(instance.sab);
      strListTimetable.add(instance.dom);
    }
    storage.put('timetable', strListTimetable);

    List<String> strListSubjects = [];
    for (final instance in list[1]) {
      strListSubjects.add(instance.classPractice);
      strListSubjects.add(instance.classPracticeLocation);
      strListSubjects.add(instance.classTheoretical);
      strListSubjects.add(instance.classTheoreticalLocation);
      strListSubjects.add(instance.id);
      strListSubjects.add(instance.subject);
    }
    storage.put('subjects', strListSubjects);
  }

  Future<List<TimetableModel>> getPersistenceTimetable() async {
    List<String> stringList = await storage.get('timetable');
    if (stringList == null) {
      return null;
    } else {
      List<TimetableModel> list = List();
      var index = 0;
      while (index < stringList.length) {
        TimetableModel instance = TimetableModel(
          startTime: stringList[index],
          endTime: stringList[index + 1],
          seg: stringList[index + 2],
          ter: stringList[index + 3],
          qua: stringList[index + 4],
          qui: stringList[index + 5],
          sex: stringList[index + 6],
          sab: stringList[index + 7],
          dom: stringList[index + 8],
        );
        index += 9;
        list.add(instance);
      }
      return list;
    }
  }

  setPersistenceTimetable(credentials) async {
    List<TimetableModel> list = await getTimetable(credentials);
    List<String> stringList = [];
    for (final instance in list) {
      stringList.add(instance.startTime);
      stringList.add(instance.endTime);
      stringList.add(instance.seg);
      stringList.add(instance.ter);
      stringList.add(instance.qua);
      stringList.add(instance.qui);
      stringList.add(instance.sex);
      stringList.add(instance.sab);
      stringList.add(instance.dom);
    }
    storage.put('timetable', stringList);
  }

  deletePersistenceTimetable() {
    storage.put('timetable', null);
  }

  Future<List<SubjectsModel>> getPersistenceSubjects() async {
    List<String> stringList = await storage.get('subjects');
    if (stringList == null) {
      return null;
    } else {
      List<SubjectsModel> list = List();
      var index = 0;
      while (index < stringList.length) {
        SubjectsModel instance = SubjectsModel(
          classPractice: stringList[index],
          classPracticeLocation: stringList[index + 1],
          classTheoretical: stringList[index + 2],
          classTheoreticalLocation: stringList[index + 3],
          id: stringList[index + 4],
          subject: stringList[index + 5],
        );
        index += 6;
        list.add(instance);
      }
      return list;
    }
  }

  deletePersistenceSubjects() {
    storage.put('subjects', null);
  }
}
