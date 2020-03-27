import 'package:flutter/material.dart';

class LuckWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          "Pode se encontrar a felicidade mesmo nas horas mais sombrias, se a pessoa se lembrar de acender a luz.",
          style: TextStyle(
            color: Colors.black,
            fontStyle: FontStyle.italic,
          ),
          textAlign: TextAlign.justify,
        ),
        Text(
          "JK Rowling",
          style: TextStyle(
            color: Colors.black54,
            fontStyle: FontStyle.italic,
          ),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
