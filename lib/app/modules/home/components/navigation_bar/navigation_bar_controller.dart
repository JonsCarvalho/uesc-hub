import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'navigation_bar_controller.g.dart';

class NavigationBarController = _NavigationBarBase
    with _$NavigationBarController;

abstract class _NavigationBarBase with Store {
  @observable
  int indexComponentSelected = 0;

  @observable
  ObservableMap<int, dynamic> notifications;

  _NavigationBarBase() {
    fetchNotifications();
  }

  @action
  navagationComponentClick(int index) {
    indexComponentSelected = index;
  }

  @action
  fetchNotifications() {
    notifications = {
      0: Icons.assistant_photo,
      1: Colors.teal,
      2: '99+',
      3: Colors.redAccent,
      // 4: Colors.greenAccent,
      
      4: 'Olá',
    }.asObservable();
  }
}
