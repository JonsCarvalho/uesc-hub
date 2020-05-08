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
  String toString() {
    final string =
        'nextClass: ${nextClass.toString()},daySelected: ${daySelected.toString()}';
    return '{$string}';
  }
}
