import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uesc_hub/app/shared/functions/generation_date.dart';

import '../../home_controller.dart';

class SalutationWidget extends StatelessWidget {
  final HomeController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 15.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            // getDisplayNameEmail() != null
            // ? "${getSalutation()} ${getDisplayNameEmail().split(" ").first}!"
            // : "${getSalutation()} ${getCurrentUser().displayName.split(" ").first}!",
            "${GenerationDate(dateTime: DateTime.now()).getSalutation()}, ${controller.getCurrentUser().displayName.split(" ").first}!",
            style: TextStyle(
              // color: Color(0xff827daa).withGreen(200),
              color: Colors.black,
              fontSize: 20,
              // fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                GenerationDate(dateTime: DateTime.now()).getDay(),
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 15,
                ),
              ),
              Text(
                ", ${DateTime.now().day.toString()} de ${GenerationDate(dateTime: DateTime.now()).getMonth()}",
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
