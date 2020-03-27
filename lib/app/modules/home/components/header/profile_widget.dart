import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../home_controller.dart';

class ProfileWidget extends StatelessWidget {
  final HomeController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: CircleAvatar(
        radius: 35,
        backgroundColor: Colors.transparent,
        child: InkWell(
          focusColor: Colors.purple,
          highlightColor: Colors.cyan,
          hoverColor: Colors.green,
          splashColor: Colors.red,
          onTap: () {},
          borderRadius: BorderRadius.circular(100),
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(1),
                child: ClipOval(
                  child: Image.network(controller.getCurrentUser().photoUrl),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
