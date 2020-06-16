import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'dart:async';

import '../schedule_controller.dart';

class RealTime extends StatelessWidget {
  final scheduleController = Modular.get<ScheduleController>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      Timer.periodic(
          Duration(seconds: 1), (Timer t) => scheduleController.getTime());
      return Text(
        'Agora - ${scheduleController.realTime}',
        style: TextStyle(
          fontSize: 18,
          color: Theme.of(context).accentColor,
        ),
      );
    });
  }
}
