import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarWidget extends StatelessWidget {
  final double barHeight = 66.0;

  const AppBarWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            FontAwesomeIcons.uikit,
            // color: Colors.white,
          ),
          Text(
            'UESC Hub',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              // color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
