// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_bar_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NavigationBarController on _NavigationBarBase, Store {
  final _$indexComponentSelectedAtom =
      Atom(name: '_NavigationBarBase.indexComponentSelected');

  @override
  int get indexComponentSelected {
    _$indexComponentSelectedAtom.context
        .enforceReadPolicy(_$indexComponentSelectedAtom);
    _$indexComponentSelectedAtom.reportObserved();
    return super.indexComponentSelected;
  }

  @override
  set indexComponentSelected(int value) {
    _$indexComponentSelectedAtom.context.conditionallyRunInAction(() {
      super.indexComponentSelected = value;
      _$indexComponentSelectedAtom.reportChanged();
    }, _$indexComponentSelectedAtom,
        name: '${_$indexComponentSelectedAtom.name}_set');
  }

  final _$notificationsAtom = Atom(name: '_NavigationBarBase.notifications');

  @override
  ObservableMap<int, dynamic> get notifications {
    _$notificationsAtom.context.enforceReadPolicy(_$notificationsAtom);
    _$notificationsAtom.reportObserved();
    return super.notifications;
  }

  @override
  set notifications(ObservableMap<int, dynamic> value) {
    _$notificationsAtom.context.conditionallyRunInAction(() {
      super.notifications = value;
      _$notificationsAtom.reportChanged();
    }, _$notificationsAtom, name: '${_$notificationsAtom.name}_set');
  }

  final _$_NavigationBarBaseActionController =
      ActionController(name: '_NavigationBarBase');

  @override
  dynamic navagationComponentClick(int index) {
    final _$actionInfo = _$_NavigationBarBaseActionController.startAction();
    try {
      return super.navagationComponentClick(index);
    } finally {
      _$_NavigationBarBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchNotifications() {
    final _$actionInfo = _$_NavigationBarBaseActionController.startAction();
    try {
      return super.fetchNotifications();
    } finally {
      _$_NavigationBarBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'indexComponentSelected: ${indexComponentSelected.toString()},notifications: ${notifications.toString()}';
    return '{$string}';
  }
}
