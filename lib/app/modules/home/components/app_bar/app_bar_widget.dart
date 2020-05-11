import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uesc_hub/app/modules/home/components/app_bar/app_bar_controller.dart';
import 'package:uesc_hub/app/modules/home/home_controller.dart';

class AppBarWidget extends StatelessWidget {
  final double barHeight = 66.0;

  final HomeController homeController = Modular.get();
  final AppBarController appBarController = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
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
              GestureDetector(
                onTap: () async {
                  appBarController.updateSizeProfileWidget();
                  await Future.delayed(Duration(milliseconds: 500));
                  Modular.to.pushNamed('/profile');
                  appBarController.updateSizeProfileWidget();
                },
                onLongPress: () async {
                  appBarController.updateSizeProfileWidget();
                  await Future.delayed(Duration(milliseconds: 500));
                  appBarController.updateSizeProfileWidget();
                },

                child: homeController.getCurrentUser().photoUrl != null
                    ? Stack(
                        alignment: Alignment.center,
                        children: [
                          AnimatedContainer(

                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                            height: appBarController.sizeProfileWidget + 3,
                            width: appBarController.sizeProfileWidget + 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: appBarController.sizeProfileWidget == 40
                                  ? Colors.white
                                  : Colors.greenAccent,
                            ),
                          ),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.elasticIn,
                            height: appBarController.sizeProfileWidget,
                            width: appBarController.sizeProfileWidget,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                  homeController.getCurrentUser().photoUrl,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Stack(
                        alignment: Alignment.center,
                        children: [
                          AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                            height: appBarController.sizeProfileWidget + 3,
                            width: appBarController.sizeProfileWidget + 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: appBarController.sizeProfileWidget == 40
                                  ? Colors.white
                                  : Colors.teal,
                            ),
                          ),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.elasticIn,
                            height: appBarController.sizeProfileWidget,
                            width: appBarController.sizeProfileWidget,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black,
                            ),
                            child: Center(
                              child: Text(
                                homeController
                                        .getCurrentUser()
                                        .displayName
                                        .toString()
                                        .substring(0, 1) +
                                    homeController
                                        .getCurrentUser()
                                        .displayName
                                        .toString()
                                        .split(" ")
                                        .last
                                        .substring(0, 1),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
