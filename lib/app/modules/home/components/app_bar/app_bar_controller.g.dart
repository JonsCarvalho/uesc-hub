// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_bar_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppBarController on _AppBarBase, Store {
  final _$sizeProfileWidgetAtom = Atom(name: '_AppBarBase.sizeProfileWidget');

  @override
  double get sizeProfileWidget {
    _$sizeProfileWidgetAtom.context.enforceReadPolicy(_$sizeProfileWidgetAtom);
    _$sizeProfileWidgetAtom.reportObserved();
    return super.sizeProfileWidget;
  }

  @override
  set sizeProfileWidget(double value) {
    _$sizeProfileWidgetAtom.context.conditionallyRunInAction(() {
      super.sizeProfileWidget = value;
      _$sizeProfileWidgetAtom.reportChanged();
    }, _$sizeProfileWidgetAtom, name: '${_$sizeProfileWidgetAtom.name}_set');
  }

  final _$initAsyncAction = AsyncAction('init');

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$_AppBarBaseActionController = ActionController(name: '_AppBarBase');

  @override
  dynamic updateSizeProfileWidget() {
    final _$actionInfo = _$_AppBarBaseActionController.startAction();
    try {
      return super.updateSizeProfileWidget();
    } finally {
      _$_AppBarBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'sizeProfileWidget: ${sizeProfileWidget.toString()}';
    return '{$string}';
  }
}
