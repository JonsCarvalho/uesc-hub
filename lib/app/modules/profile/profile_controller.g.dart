// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileController on _ProfileControllerBase, Store {
  final _$credentialsAtom = Atom(name: '_ProfileControllerBase.credentials');

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

  final _$initAsyncAction = AsyncAction('init');

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$_ProfileControllerBaseActionController =
      ActionController(name: '_ProfileControllerBase');

  @override
  void save() {
    final _$actionInfo = _$_ProfileControllerBaseActionController.startAction();
    try {
      return super.save();
    } finally {
      _$_ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove() {
    final _$actionInfo = _$_ProfileControllerBaseActionController.startAction();
    try {
      return super.remove();
    } finally {
      _$_ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'credentials: ${credentials.toString()}';
    return '{$string}';
  }
}
