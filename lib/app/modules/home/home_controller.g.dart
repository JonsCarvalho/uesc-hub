// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeBase, Store {
  final _$pageControllerAtom = Atom(name: '_HomeBase.pageController');

  @override
  PageController get pageController {
    _$pageControllerAtom.context.enforceReadPolicy(_$pageControllerAtom);
    _$pageControllerAtom.reportObserved();
    return super.pageController;
  }

  @override
  set pageController(PageController value) {
    _$pageControllerAtom.context.conditionallyRunInAction(() {
      super.pageController = value;
      _$pageControllerAtom.reportChanged();
    }, _$pageControllerAtom, name: '${_$pageControllerAtom.name}_set');
  }

  final _$disableAddAtom = Atom(name: '_HomeBase.disableAdd');

  @override
  bool get disableAdd {
    _$disableAddAtom.context.enforceReadPolicy(_$disableAddAtom);
    _$disableAddAtom.reportObserved();
    return super.disableAdd;
  }

  @override
  set disableAdd(bool value) {
    _$disableAddAtom.context.conditionallyRunInAction(() {
      super.disableAdd = value;
      _$disableAddAtom.reportChanged();
    }, _$disableAddAtom, name: '${_$disableAddAtom.name}_set');
  }

  final _$listAtom = Atom(name: '_HomeBase.list');

  @override
  ObservableList<String> get list {
    _$listAtom.context.enforceReadPolicy(_$listAtom);
    _$listAtom.reportObserved();
    return super.list;
  }

  @override
  set list(ObservableList<String> value) {
    _$listAtom.context.conditionallyRunInAction(() {
      super.list = value;
      _$listAtom.reportChanged();
    }, _$listAtom, name: '${_$listAtom.name}_set');
  }

  final _$initAsyncAction = AsyncAction('init');

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$_HomeBaseActionController = ActionController(name: '_HomeBase');

  @override
  dynamic setPageController(dynamic value) {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.setPageController(value);
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void save() {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.save();
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove(int index) {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.remove(index);
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  FirebaseUser getCurrentUser() {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.getCurrentUser();
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'pageController: ${pageController.toString()},disableAdd: ${disableAdd.toString()},list: ${list.toString()}';
    return '{$string}';
  }
}
