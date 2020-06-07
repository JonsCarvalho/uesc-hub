import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uesc_hub/app/modules/home/components/app_bar/app_bar_controller.dart';
import 'package:uesc_hub/app/modules/home/components/header/profile_widget.dart';
import 'package:uesc_hub/app/modules/home/home_controller.dart';

class AppBarWidget extends StatelessWidget {
  final double barHeight = 66.0;

  final HomeController homeController = Modular.get();
  final AppBarController appBarController = Modular.get();

  @override
  Widget build(context) {
    return Observer(
      builder: (_) {
        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: uescHubIcon(context),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: notificationButton(context)),
                    Expanded(child: ProfileWidget()),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  uescHubIcon(context) {
    return Row(
      children: <Widget>[
        Icon(
          FontAwesomeIcons.uikit,
          color: Theme.of(context).primaryColor,
        ),
        Text(
          'UESC Hub',
          style: TextStyle(
            color: Theme.of(context).primaryTextTheme.bodyText1.color,
            fontSize: 20.0,
          ),
        ),
      ],
    );
  }

  notificationButton(context) {
    return IconButton(
      icon: Icon(Icons.notifications_none),
      color: Theme.of(context).iconTheme.color,
      onPressed: () {},
    );
  }
}
