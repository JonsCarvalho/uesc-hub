// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_sagres_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthSagresController on _AuthSagresControllerBase, Store {
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

  final _$_AuthSagresControllerBaseActionController =
      ActionController(name: '_AuthSagresControllerBase');

  @override
  void save() {
    final _$actionInfo =
        _$_AuthSagresControllerBaseActionController.startAction();
    try {
      return super.save();
    } finally {
      _$_AuthSagresControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove() {
    final _$actionInfo =
        _$_AuthSagresControllerBaseActionController.startAction();
    try {
      return super.remove();
    } finally {
      _$_AuthSagresControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'credentials: ${credentials.toString()},status: ${status.toString()}';
    return '{$string}';
  }
}
