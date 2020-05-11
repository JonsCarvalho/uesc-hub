// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'next_class_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NextClassController on _NextClassBase, Store {
  final _$nextClassAtom = Atom(name: '_NextClassBase.nextClass');

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

  final _$daySelectedAtom = Atom(name: '_NextClassBase.daySelected');

  @override
  String get daySelected {
    _$daySelectedAtom.context.enforceReadPolicy(_$daySelectedAtom);
    _$daySelectedAtom.reportObserved();
    return super.daySelected;
  }

  @override
  set daySelected(String value) {
    _$daySelectedAtom.context.conditionallyRunInAction(() {
      super.daySelected = value;
      _$daySelectedAtom.reportChanged();
    }, _$daySelectedAtom, name: '${_$daySelectedAtom.name}_set');
  }

  final _$cardSelectedAtom = Atom(name: '_NextClassBase.cardSelected');

  @override
  String get cardSelected {
    _$cardSelectedAtom.context.enforceReadPolicy(_$cardSelectedAtom);
    _$cardSelectedAtom.reportObserved();
    return super.cardSelected;
  }

  @override
  set cardSelected(String value) {
    _$cardSelectedAtom.context.conditionallyRunInAction(() {
      super.cardSelected = value;
      _$cardSelectedAtom.reportChanged();
    }, _$cardSelectedAtom, name: '${_$cardSelectedAtom.name}_set');
  }

  final _$buttonClickAtom = Atom(name: '_NextClassBase.buttonClick');

  @override
  bool get buttonClick {
    _$buttonClickAtom.context.enforceReadPolicy(_$buttonClickAtom);
    _$buttonClickAtom.reportObserved();
    return super.buttonClick;
  }

  @override
  set buttonClick(bool value) {
    _$buttonClickAtom.context.conditionallyRunInAction(() {
      super.buttonClick = value;
      _$buttonClickAtom.reportChanged();
    }, _$buttonClickAtom, name: '${_$buttonClickAtom.name}_set');
  }

  final _$initAsyncAction = AsyncAction('init');

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$getNextClassAsyncAction = AsyncAction('getNextClass');

  @override
  Future getNextClass() {
    return _$getNextClassAsyncAction.run(() => super.getNextClass());
  }

  final _$_NextClassBaseActionController =
      ActionController(name: '_NextClassBase');

  @override
  dynamic setDaySelected(String value) {
    final _$actionInfo = _$_NextClassBaseActionController.startAction();
    try {
      return super.setDaySelected(value);
    } finally {
      _$_NextClassBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCardSelected(String value) {
    final _$actionInfo = _$_NextClassBaseActionController.startAction();
    try {
      return super.setCardSelected(value);
    } finally {
      _$_NextClassBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setButtonClick(bool value) {
    final _$actionInfo = _$_NextClassBaseActionController.startAction();
    try {
      return super.setButtonClick(value);
    } finally {
      _$_NextClassBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'nextClass: ${nextClass.toString()},daySelected: ${daySelected.toString()},cardSelected: ${cardSelected.toString()},buttonClick: ${buttonClick.toString()}';
    return '{$string}';
  }
}
