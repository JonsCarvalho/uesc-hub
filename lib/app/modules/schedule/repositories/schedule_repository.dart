import 'package:dio/dio.dart';
import 'package:uesc_hub/app/modules/schedule/models/subjects_model.dart';
import 'package:uesc_hub/app/shared/constants.dart';

class ScheduleRepository {
  final Dio dio;

  var credentials = {"username":"****","password":"****"};

  ScheduleRepository(this.dio);

  Future<List<SubjectsModel>> getAllSubjects() async {
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
}
