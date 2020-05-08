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

  final _$nextClassAtom = Atom(name: '_HomeBase.nextClass');

  @override
  ObservableList<NextClassModel> get nextClass {
    _$nextClassAtom.context.enforceReadPolicy(_$nextClassAtom);
    _$nextClassAtom.reportObserved();
    return super.nextClass;
  }

  @override
  set nextClass(ObservableList<NextClassModel> value) {
    _$nextClassAtom.context.conditionallyRunInAction(() {
      super.nextClass = value;
      _$nextClassAtom.reportChanged();
    }, _$nextClassAtom, name: '${_$nextClassAtom.name}_set');
  }

  final _$initAsyncAction = AsyncAction('init');

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$getNextClassAsyncAction = AsyncAction('getNextClass');

  @override
  Future getNextClass([DateTime dateTime]) {
    return _$getNextClassAsyncAction.run(() => super.getNextClass(dateTime));
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
        'pageController: ${pageController.toString()},nextClass: ${nextClass.toString()}';
    return '{$string}';
  }
}
