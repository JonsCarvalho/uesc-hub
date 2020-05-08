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
      padding: const EdgeInsets.only(top: 4, bottom: 8, right: 15),
      width: 210,
      child: Expanded(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withAlpha(100),
                blurRadius: 6.0,
                spreadRadius: 0.0,
                offset: Offset(
                  0.0,
                  3.0,
                ),
              )
            ],
          ),
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
                      
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
