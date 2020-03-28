import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../home_controller.dart';
import '../functions.dart';

class SalutationWidget extends StatelessWidget {
  final HomeController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          // getDisplayNameEmail() != null
          // ? "${getSalutation()} ${getDisplayNameEmail().split(" ").first}!"
          // : "${getSalutation()} ${getCurrentUser().displayName.split(" ").first}!",
          "${getSalutation()}, ${controller.getCurrentUser().displayName.split(" ").first}!",
          style: TextStyle(
            // color: Color(0xff827daa).withGreen(200),
            color: Colors.white,
            fontSize: 25,
            // fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              getDay(DateTime.now()),
              style: TextStyle(
                color: Colors.white60,
                fontSize: 15,
              ),
            ),
            Text(
              ", ${DateTime.now().day.toString()} de ${getMonth(DateTime.now())}",
              style: TextStyle(
                color: Colors.white60,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
