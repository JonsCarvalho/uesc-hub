import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uesc_hub/app/modules/schedule/models/subjects_model.dart';
import 'package:uesc_hub/app/modules/schedule/models/timetable_model.dart';
import 'package:uesc_hub/app/shared/auth/sagres/repositories/auth_sagres_repository.dart';
import 'package:uesc_hub/app/shared/constants.dart';

class ScheduleRepository {
  final AuthSagresRepository repository;

  final Dio dio;

  ScheduleRepository(this.dio, this.repository);

  Future<List<SubjectsModel>> getSubjects() async {
    var response = await dio.post(
      URL_SAGRES_BASE + "/subjects/",
      data: {
        "username": repository.getCredentials()[0],
        "password": repository.getCredentials()[1]
      },
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
      data: {
        "username": repository.getCredentials()[0],
        "password": repository.getCredentials()[1]
      },
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
      data: {
        "username": repository.getCredentials()[0],
        "password": repository.getCredentials()[1]
      },
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
