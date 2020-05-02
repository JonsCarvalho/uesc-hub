import 'package:flutter/material.dart';
import 'dart:math';

class GenerationColor {
  String seed;

  GenerationColor({
    Key key,
    @required this.seed,
  });

  List<Color> colors = [
    Colors.amberAccent,
    Colors.blue,
    Colors.blueGrey,
    Colors.brown,
    Colors.cyanAccent,
    Colors.deepOrangeAccent,
    Colors.cyan,
    Colors.deepOrange,
    Colors.deepPurpleAccent,
    Colors.green,
    Colors.amber,
    Colors.indigo,
    Colors.greenAccent,
    Colors.grey,
    Colors.lime,
    Colors.lightBlueAccent,
    Colors.lightGreenAccent,
    Colors.purple,
    Colors.yellowAccent,
    Colors.lightBlue,
    Colors.orangeAccent,
    Colors.deepPurple,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.limeAccent,
    Colors.purpleAccent,
    Colors.red,
    Colors.indigoAccent,
    Colors.pink,
    Colors.lightGreen,
    Colors.orange,
    Colors.redAccent,
    Colors.tealAccent,
    Colors.yellow,
    Colors.teal,
  ];

  Color colorTime() {
    var newSeed = seed.split(':')[0] + seed.split(':')[1];

    return colors[
        new Random(int.parse(newSeed) % DateTime.now().millisecondsSinceEpoch)
            .nextInt(colors.length)];
  }

  Color colorSubject() {
    var newSeed =
        seed.split('-')[0].split(RegExp(r"(?:[A-Z]+|^)[a-z]*"))[1].toString();
    return colors[Random(Random(int.parse(newSeed)).nextInt(int.parse(newSeed)))
        .nextInt(colors.length)];
  }
}
