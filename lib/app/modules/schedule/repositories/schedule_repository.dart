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
  final credentials;

  ScheduleRepository(this.dio, this.credentials);

  final ILocalStorage storage = Modular.get();
  final sagresController = Modular.get<AuthSagresController>();

  Future<List<SubjectsModel>> getSubjects() async {
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

  Future<List<TimetableModel>> getTimetable() async {
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

  Future<List<SubjectsModel>> getAll() async {
    var response = await dio.post(
      URL_SAGRES_BASE + "/all/",
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

  // getPersistenceSubjects() async {
  //   List<SubjectsModel> persistenceSubjects = await storage.get('subjects');
  //   return persistenceSubjects;
  // }

  // setPersistenceSubjects(List<SubjectsModel> persistenceSubjects) {
  //   storage.put('subjects', persistenceSubjects);
  // }

  // deletePersistenceSubjects() {
  //   storage.put('subjects', null);
  // }

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

  setPersistenceTimetable() async {
    List<TimetableModel> list = await getTimetable();
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
}
