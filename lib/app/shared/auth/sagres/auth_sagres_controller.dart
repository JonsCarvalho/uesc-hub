import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:uesc_hub/app/shared/auth/sagres/repositories/auth_sagres_repository.dart';
import 'package:uesc_hub/app/shared/repositories/localstorage/local_storage_interface.dart';
part 'auth_sagres_controller.g.dart';

class AuthSagresController = _AuthSagresControllerBase with _$AuthSagresController;

abstract class _AuthSagresControllerBase with Store {
  final AuthSagresRepository _authRepository = Modular.get();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool errorText = false;

  @observable
  ObservableList<String> credentials = <String>[].asObservable();

  _AuthControllerBase() {
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
    _authRepository.
    storage.put('credentials', credentials);
    usernameController.clear();
    passwordController.clear();
  }

  @action
  void remove() {
    _authRepository.deleteCredentials();
  }

  @observable
  AuthStatus status = AuthStatus.loading;
}

enum AuthStatus { loading, login, logoff }
