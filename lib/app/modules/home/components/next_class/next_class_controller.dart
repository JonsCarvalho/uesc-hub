import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:uesc_hub/app/modules/home/models/next_class_model.dart';
import 'package:uesc_hub/app/modules/schedule/models/subjects_model.dart';
import 'package:uesc_hub/app/modules/schedule/models/timetable_model.dart';
import 'package:uesc_hub/app/shared/functions/generation_date.dart';
import 'package:uesc_hub/app/shared/repositories/localstorage/local_storage_interface.dart';

part 'next_class_controller.g.dart';

class NextClassController = _NextClassBase with _$NextClassController;

abstract class _NextClassBase with Store {
  final ILocalStorage storage = Modular.get();

  @observable
  ObservableList<NextClassModel> nextClass = <NextClassModel>[].asObservable();

  @observable
  String daySelected = 'Hoje';

  @observable
  String cardSelected;

  @observable
  bool buttonClick = false;

  _NextClassBase() {
    init();
  }

  @action
  init() async {
    List<NextClassModel> listLocal = await getNextClass();
    if (listLocal == null) {
      nextClass = <NextClassModel>[].asObservable();
    } else {
      nextClass = listLocal.asObservable();
    }
  }

  @action
  setDaySelected(String value) {
    daySelected = value;
  }

  @action
  setCardSelected(String value) {
    cardSelected = value;
  }

  @action
  setButtonClick(bool value) {
    buttonClick = value;
  }

  @action
  getNextClass() async {
    DateTime dateTime = daySelected == 'Hoje'
        ? DateTime.now()
        : DateTime.now().add(Duration(days: 1));

    List<String> stringListTimetable = await storage.get('timetable');
    List<TimetableModel> listTimetable = List();
    if (stringListTimetable == null) {
      return null;
    } else {
      var index = 0;
      while (index < stringListTimetable.length) {
        TimetableModel instanceTimetable = TimetableModel(
          startTime: stringListTimetable[index],
          endTime: stringListTimetable[index + 1],
          seg: stringListTimetable[index + 2],
          ter: stringListTimetable[index + 3],
          qua: stringListTimetable[index + 4],
          qui: stringListTimetable[index + 5],
          sex: stringListTimetable[index + 6],
          sab: stringListTimetable[index + 7],
          dom: stringListTimetable[index + 8],
        );
        index += 9;
        listTimetable.add(instanceTimetable);
      }
    }
    List<String> stringListSubjects = await storage.get('subjects');
    List<SubjectsModel> listSubjects = List();
    if (stringListSubjects == null) {
      return null;
    } else {
      var index = 0;
      while (index < stringListSubjects.length) {
        SubjectsModel instanceTimetable = SubjectsModel(
          classPractice: stringListSubjects[index],
          classPracticeLocation: stringListSubjects[index + 1],
          classTheoretical: stringListSubjects[index + 2],
          classTheoreticalLocation: stringListSubjects[index + 3],
          id: stringListSubjects[index + 4],
          subject: stringListSubjects[index + 5],
        );
        index += 6;
        listSubjects.add(instanceTimetable);
      }
    }

    String day = GenerationDate(dateTime: dateTime)
        .getDay()
        .toString()
        .toLowerCase()
        .substring(0, 3);

    List<NextClassModel> listNext = List();

    for (var instanceTimetable in listTimetable) {
      var id;
      switch (day) {
        case 'seg':
          id = instanceTimetable.seg;
          break;
        case 'ter':
          id = instanceTimetable.ter;
          break;
        case 'qua':
          id = instanceTimetable.qua;
          break;
        case 'qui':
          id = instanceTimetable.qui;
          break;
        case 'sex':
          id = instanceTimetable.sex;
          break;
        case 'sáb':
          id = instanceTimetable.sab;
          break;
        case 'dom':
          id = instanceTimetable.dom;
          break;
        default:
          id = "-";
          break;
      }
      if (id.toString().isNotEmpty) {
        var instance;
        for (var index = 0; index < listSubjects.length; index++) {
          if (id.toString().split('-')[0] == listSubjects[index].id) {
            instance = index;
          }
        }

        listNext.add(
          NextClassModel(
            classLocation: id.toString().contains('P0')
                ? listSubjects[instance].classPracticeLocation
                : listSubjects[instance].classTheoreticalLocation,
            classType: id.toString().split('-')[1],
            id: listSubjects[instance].id,
            subject: listSubjects[instance].subject,
            startTime: instanceTimetable.startTime,
            endTime: instanceTimetable.endTime,
          ),
        );
      }
    }

    return listNext;
  }
}
