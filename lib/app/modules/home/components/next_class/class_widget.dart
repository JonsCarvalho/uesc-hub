import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../home_controller.dart';

class ClassWidget extends StatelessWidget {
  final int index;
  final String id;
  final String subject;
  final String classRoom;
  final String start;
  final String end;

  final HomeController controller = Modular.get();

  ClassWidget({
    Key key,
    this.index,
    this.id,
    this.subject,
    this.classRoom,
    this.start,
    this.end,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 150,
        // height: 50,
        child: ListTile(
          // title: Text(controller.list[index]),
          title: Text(subject),
          subtitle: Text(classRoom),
          // leading: Text(id),
          // trailing: IconButton(
          //   icon: Icon(Icons.cancel, color: Colors.red),
          //   onPressed: () {
          //     controller.remove(index);
          //   },
          // ),
        ),
      ),
    );
  }
}
