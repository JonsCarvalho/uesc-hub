import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:uesc_hub/app/shared/auth/auth_controller.dart';
import 'package:uesc_hub/app/shared/auth/repositories/auth_repository.dart';
import 'package:uesc_hub/app/shared/repositories/localstorage/local_storage_interface.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  final ILocalStorage storage = Modular.get();

  final textController = TextEditingController();

  @observable
  PageController pageController;
  
  @action
  setPageController(value){
    pageController.jumpToPage(value);
  }

  @observable
  bool disableAdd = true;

  @observable
  ObservableList<String> list = <String>[].asObservable();

  _HomeBase() {
    init();
    textController.addListener(() {
      disableAdd = textController.text == null ||
          textController.text.isEmpty ||
          textController.text.length < 3;
    });
  }

  @action
  init() async {
    List<String> listLocal = await storage.get('list');
    if (listLocal == null) {
      list = <String>[].asObservable();
    } else {
      list = listLocal.asObservable();
    }
  }

  @action
  void save() {
    list.add(textController.text);
    storage.put('list', list);
    textController.clear();
  }

  @action
  void remove(int index) {
    list.removeAt(index);
    storage.put('list', list);
  }

  @action
  FirebaseUser getCurrentUser(){
    var user = Modular.get<AuthController>().user;
    return user;
  }
}
