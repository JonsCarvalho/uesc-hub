import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uesc_hub/app/modules/home/components/header/luck_widget.dart';
import 'package:uesc_hub/app/modules/home/components/header/salutation_widget.dart';

class FlexibleAppBarWidget extends StatelessWidget {
  final double appBarHeight = 66.0;

  const FlexibleAppBarWidget();

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return new Container(
      padding: new EdgeInsets.only(
        top: statusBarHeight,
        left: 15,
        right: 15,
        bottom: 15,
      ),
      decoration: new BoxDecoration(
        color: Colors.teal,
      ),
      height: statusBarHeight + appBarHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SalutationWidget(),
          SizedBox(height: 15),
          LuckWidget(),
        ],
      ),
    );
  }
}
