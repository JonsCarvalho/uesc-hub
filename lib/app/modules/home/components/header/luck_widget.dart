import 'package:flutter/material.dart';

class LuckWidget extends StatelessWidget {
  String luck = "Pode se encontrar a felicidade"
      "mesmo nas horas mais sombrias, "
      "se a pessoa se lembrar de acender a luz.";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              luck.length > 146 ? "Erro, texto muito grande" : luck,
              style: TextStyle(
                color: Colors.white70,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.justify,
            ),
            Text(
              "JK Rowling",
              style: TextStyle(
                color: Colors.white60,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }
}
