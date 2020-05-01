// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_sagres_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthSagresController on _AuthSagresControllerBase, Store {
  final _$errorAtom = Atom(name: '_AuthSagresControllerBase.error');

  @override
  bool get error {
    _$errorAtom.context.enforceReadPolicy(_$errorAtom);
    _$errorAtom.reportObserved();
    return super.error;
  }

  @override
  set error(bool value) {
    _$errorAtom.context.conditionallyRunInAction(() {
      super.error = value;
      _$errorAtom.reportChanged();
    }, _$errorAtom, name: '${_$errorAtom.name}_set');
  }

  final _$errorTextAtom = Atom(name: '_AuthSagresControllerBase.errorText');

  @override
  String get errorText {
    _$errorTextAtom.context.enforceReadPolicy(_$errorTextAtom);
    _$errorTextAtom.reportObserved();
    return super.errorText;
  }

  @override
  set errorText(String value) {
    _$errorTextAtom.context.conditionallyRunInAction(() {
      super.errorText = value;
      _$errorTextAtom.reportChanged();
    }, _$errorTextAtom, name: '${_$errorTextAtom.name}_set');
  }

  final _$credentialsAtom = Atom(name: '_AuthSagresControllerBase.credentials');

  @override
  ObservableList<String> get credentials {
    _$credentialsAtom.context.enforceReadPolicy(_$credentialsAtom);
    _$credentialsAtom.reportObserved();
    return super.credentials;
  }

  @override
  set credentials(ObservableList<String> value) {
    _$credentialsAtom.context.conditionallyRunInAction(() {
      super.credentials = value;
      _$credentialsAtom.reportChanged();
    }, _$credentialsAtom, name: '${_$credentialsAtom.name}_set');
  }

  final _$statusAtom = Atom(name: '_AuthSagresControllerBase.status');

  @override
  AuthStatus get status {
    _$statusAtom.context.enforceReadPolicy(_$statusAtom);
    _$statusAtom.reportObserved();
    return super.status;
  }

  @override
  set status(AuthStatus value) {
    _$statusAtom.context.conditionallyRunInAction(() {
      super.status = value;
      _$statusAtom.reportChanged();
    }, _$statusAtom, name: '${_$statusAtom.name}_set');
  }

  final _$initAsyncAction = AsyncAction('init');

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$saveAsyncAction = AsyncAction('save');

  @override
  Future<dynamic> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  final _$removeAsyncAction = AsyncAction('remove');

  @override
  Future<dynamic> remove() {
    return _$removeAsyncAction.run(() => super.remove());
  }

  final _$_AuthSagresControllerBaseActionController =
      ActionController(name: '_AuthSagresControllerBase');

  @override
  dynamic setError(bool value) {
    final _$actionInfo =
        _$_AuthSagresControllerBaseActionController.startAction();
    try {
      return super.setError(value);
    } finally {
      _$_AuthSagresControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setErrorText(String value) {
    final _$actionInfo =
        _$_AuthSagresControllerBaseActionController.startAction();
    try {
      return super.setErrorText(value);
    } finally {
      _$_AuthSagresControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'error: ${error.toString()},errorText: ${errorText.toString()},credentials: ${credentials.toString()},status: ${status.toString()}';
    return '{$string}';
  }
}
