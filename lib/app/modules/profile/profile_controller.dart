import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:uesc_hub/app/shared/auth/auth_controller.dart';
import 'package:uesc_hub/app/shared/repositories/localstorage/local_storage_interface.dart';

part 'profile_controller.g.dart';

class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  final ILocalStorage storage = Modular.get();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool errorText = false;

  @observable
  ObservableList<String> credentials = <String>[].asObservable();

  _ProfileControllerBase() {
    init();
  }

  @action
  init() async {
    List<String> listLocal = await storage.get('credentials');
    if (listLocal == null) {
      credentials = <String>[].asObservable();
    } else {
      credentials = listLocal.asObservable();
    }
  }

  @action
  void save() {
    credentials.insert(0, usernameController.text);
    credentials.insert(1, passwordController.text);
    storage.put('credentials', credentials);
    usernameController.clear();
    passwordController.clear();
  }

  @action
  void remove() {
    credentials.clear();
    storage.put('credentials', credentials);
  }

  logoff() async {
    await Modular.get<AuthController>().logout();
    Modular.to.pushReplacementNamed('/login');
  }
}
