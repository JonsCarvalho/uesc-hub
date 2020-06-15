import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../schedule_controller.dart';

class EventsWidget extends StatelessWidget {
  final scheduleController = Modular.get<ScheduleController>();
  
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Column(
        children: [
          if (scheduleController.holidays[DateTime(
                  scheduleController.daySelected.year,
                  scheduleController.daySelected.month,
                  scheduleController.daySelected.day)] !=
              null)
            Column(
              children: scheduleController.holidays[DateTime(
                      scheduleController.daySelected.year,
                      scheduleController.daySelected.month,
                      scheduleController.daySelected.day)]
                  .map(
                    (holiday) => Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.8),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      child: ListTile(
                        title: Text(holiday.toString()),
                        onTap: () => print('$holiday tapped!'),
                      ),
                    ),
                  )
                  .toList(),
            ),
          if (scheduleController.selectedEvents != null)
            Column(
              children: scheduleController.selectedEvents
                  .map((event) => Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.8),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        child: ListTile(
                          title: Text(event.toString()),
                          onTap: () => print('$event tapped!'),
                        ),
                      ))
                  .toList(),
            ),
        ],
      );
    });
  }
}
