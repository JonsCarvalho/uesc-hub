import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uesc_hub/app/modules/home/components/navigation_bar/navigation_bar_controller.dart';
import 'package:uesc_hub/app/modules/home/components/navigation_bar/navigation_component_widget.dart';

import '../../home_controller.dart';

class NavigationBarWidget extends StatelessWidget {
  final HomeController homeController = Modular.get();
  final NavigationBarController navigationBarController = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInCubic,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(100),
              blurRadius: 6.0,
              spreadRadius: 0.5,
              offset: Offset(
                0.0,
                3.0,
              ),
            )
          ],
        ),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: NavigationComponentWidget(
                icon: Icons.home,
                index: 0,
                title: 'Início',
                homeController: homeController,
                navigationBarController: navigationBarController,
              ),
            ),
            Expanded(
              child: NavigationComponentWidget(
                icon: FontAwesomeIcons.utensils,
                index: 1,
                title: 'RU',
                homeController: homeController,
                navigationBarController: navigationBarController,
              ),
            ),
            Expanded(
              child: NavigationComponentWidget(
                icon: FontAwesomeIcons.newspaper,
                index: 2,
                title: 'Notícias',
                homeController: homeController,
                navigationBarController: navigationBarController,
              ),
            ),
            Expanded(
              child: NavigationComponentWidget(
                icon: FontAwesomeIcons.book,
                index: 3,
                title: 'Agenda',
                homeController: homeController,
                navigationBarController: navigationBarController,
              ),
            ),
            Expanded(
              child: NavigationComponentWidget(
                icon: FontAwesomeIcons.mapSigns,
                index: 4,
                title: 'Mapa',
                homeController: homeController,
                navigationBarController: navigationBarController,
              ),
            ),
          ],
        ),
      );
      // return ConvexAppBar.badge(
      //   {
      //     0: Icons.assistant_photo,
      //     1: Colors.redAccent,
      //     // 2: '99+',
      //     3: Colors.redAccent,
      //     // 4: 'Olá'
      //   },
      //   onTap: controller.setPageController,
      //   style: TabStyle.react,
      //   curveSize: 0,
      //   // elevation: 0,

      //   height: 55,

      //   // curve: Curves.easeInOutCirc,
      //   activeColor: Colors.teal,
      //   color: Colors.black,
      //   backgroundColor: Colors.white,
      //   items: [
      //     TabItem(
      //       icon: Icon(Icons.home),
      //       isIconBlend: true,
      //       title: 'Início',
      //     ),
      //     TabItem(
      //       icon: Icon(FontAwesomeIcons.utensils),
      //       isIconBlend: true,
      //       title: 'RU',
      //     ),
      //     TabItem(
      //       icon: Icon(FontAwesomeIcons.newspaper),
      //       isIconBlend: true,
      //       title: 'Notícias',
      //     ),
      //     TabItem(
      //       icon: Icon(FontAwesomeIcons.book),
      //       isIconBlend: true,
      //       title: 'Agenda',
      //     ),
      //     TabItem(
      //       icon: Icon(FontAwesomeIcons.mapSigns),
      //       isIconBlend: true,
      //       title: 'Mapa',
      //     ),
      //   ],
      // );
    });
  }
}
