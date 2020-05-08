import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uesc_hub/app/shared/functions/generation_color.dart';

import '../../home_controller.dart';

class ClassWidget extends StatelessWidget {
  final String id;
  final String subject;
  final String classRoom;
  final String classType;
  final String start;
  final String end;

  final HomeController controller = Modular.get();

  ClassWidget({
    Key key,
    this.id,
    this.subject,
    this.classRoom,
    this.classType,
    this.start,
    this.end,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      child: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     Container(child: Text(start)),
          //     // SizedBox(width: 15,),
          //     Container(child: Text(end)),
          //   ],
          // ),
          Expanded(
            child: Card(
              child: Row(
                children: [
                  SizedBox(
                    width: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: GenerationColor(seed: id).colorSubject(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(child: Text(start)),
                            Icon(Icons.access_time),
                            Container(child: Text(end)),
                          ],
                        ),
                        ListTile(
                          // title: Text(controller.list[index]),
                          title: Text(
                            subject,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          subtitle: Text(
                            classRoom,
                            style: TextStyle(fontSize: 12),
                          ),
                          // trailing: Text(id),
                          // leading: Text(id),
                          // trailing: IconButton(
                          //   icon: Icon(Icons.cancel, color: Colors.red),
                          //   onPressed: () {
                          //     controller.remove(index);
                          //   },
                          // ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
