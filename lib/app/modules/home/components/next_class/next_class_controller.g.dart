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

  final _$initAsyncAction = AsyncAction('init');

  @override
  Future init([DateTime dateTime]) {
    return _$initAsyncAction.run(() => super.init(dateTime));
  }

  final _$getNextClassAsyncAction = AsyncAction('getNextClass');

  @override
  Future getNextClass([DateTime dateTime]) {
    return _$getNextClassAsyncAction.run(() => super.getNextClass(dateTime));
  }

  @override
  String toString() {
    final string = 'nextClass: ${nextClass.toString()}';
    return '{$string}';
  }
}
