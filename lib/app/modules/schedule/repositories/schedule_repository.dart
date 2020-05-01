import 'package:dio/dio.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uesc_hub/app/modules/schedule/models/subjects_model.dart';
import 'package:uesc_hub/app/modules/schedule/models/timetable_model.dart';
import 'package:uesc_hub/app/shared/auth/sagres/auth_sagres_controller.dart';
import 'package:uesc_hub/app/shared/auth/sagres/repositories/auth_sagres_repository.dart';
import 'package:uesc_hub/app/shared/constants.dart';

import '../schedule_controller.dart';

class ScheduleRepository {
  final Dio dio;
  final credentials;

  ScheduleRepository(this.dio, this.credentials);

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
}
