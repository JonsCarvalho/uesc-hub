import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:uesc_hub/app/modules/schedule/models/subjects_model.dart';
import 'package:uesc_hub/app/modules/schedule/models/timetable_model.dart';
import 'package:uesc_hub/app/shared/constants.dart';
import 'package:uesc_hub/app/shared/repositories/localstorage/local_storage_interface.dart';

class SagresRepository extends Disposable {
  final Dio dio;

  SagresRepository(this.dio);

  final ILocalStorage storage = Modular.get();
  
  // Future fetchPost(Dio client) async {
  //   final response =
  //       await client.post('https://192.168.0.5:5000/teste', );
  //   return response.data;
  // }

  Future<List> getAll(page) async {
    var response = await dio.post(
      URL_SAGRES_BASE + "/teste/", ////! all
      data: page,
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

  setPersistenceTimetableAndSubjects(page) async {
    List list = await getAll(page);

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

  //dispose will be called automatically
  @override
  void dispose() {}
}
