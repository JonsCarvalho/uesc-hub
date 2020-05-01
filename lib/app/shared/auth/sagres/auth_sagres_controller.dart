import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:uesc_hub/app/shared/auth/sagres/repositories/auth_sagres_repository.dart';
import 'package:uesc_hub/app/shared/repositories/localstorage/local_storage_interface.dart';

part 'auth_sagres_controller.g.dart';

class AuthSagresController = _AuthSagresControllerBase
    with _$AuthSagresController;

abstract class _AuthSagresControllerBase with Store {
  final AuthSagresRepository _authRepository = Modular.get();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @observable
  bool error = false;

  @observable
  String errorText = '';

  @action
  setError(bool value) {
    error = value;
  }

  @action
  setErrorText(String value) {
    errorText = value;
  }

  @observable
  ObservableList<String> credentials = <String>[].asObservable();

  @observable
  AuthStatus status = AuthStatus.none;

  _AuthSagresControllerBase() {
    init();
  }

  @action
  init() async {
    status = AuthStatus.loading;
    List<String> listLocal = await _authRepository.getCredentials();
    if (listLocal == null) {
      credentials = <String>[].asObservable();
      status = AuthStatus.logoff;
    } else {
      status = AuthStatus.login;
      credentials = listLocal.asObservable();
    }
  }

  @action
  Future save() async {
    credentials.clear();
    status = AuthStatus.loading;
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      setErrorText('Os campos de usuário e senha devem estar preenchidos!');
      error = true;
      status = AuthStatus.logoff;
    } else {
      error = false;
      credentials.insert(0, usernameController.text);
      credentials.insert(1, passwordController.text);
      var validation = await _authRepository.loginValidation(credentials);
      if (validation.toString() == "sucess") {
        await _authRepository.saveCredentials(credentials);
        usernameController.clear();
        passwordController.clear();
        status = AuthStatus.login;
      } else {
        status = AuthStatus.logoff;
        setErrorText('O usuário ou senha estão incorretos!');
        error = true;
        credentials.clear();
      }
    }
  }

  @action
  Future remove() async {
    status = AuthStatus.loading;
    credentials.clear();
    await _authRepository.deleteCredentials();
    status = AuthStatus.logoff;
  }
}

enum AuthStatus { none, loading, login, logoff }
