import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../home_controller.dart';

class NavigationBarWidget extends StatelessWidget {
  final HomeController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ConvexAppBar.badge(
        {
          0: Icons.assistant_photo,
          1: Colors.redAccent,
          // 2: '99+',
          3: Colors.redAccent,
        },
        onTap: controller.setPageController,
        // onTap: (index) {
        //   switch (index) {
        //     case 0:
        //       Modular.to.pushReplacementNamed('/home');
        //       break;
        //     case 1:
        //       Modular.to.pushReplacementNamed('/restaurant');
        //       break;
        //     case 2:
        //       Modular.to.pushReplacementNamed('/news');
        //       break;
        //     case 3:
        //       Modular.to.pushReplacementNamed('/schedule');
        //       break;
        //     case 4:
        //       Modular.to.pushReplacementNamed('/profile');
        //       break;
        //     default:
        //   }
        // },
        style: TabStyle.react,
        curveSize: 110,
        
        // height: 10,

        // curve: Curves.easeInOutCirc,
        activeColor: Colors.teal,
        color: Colors.black,
        backgroundColor: Colors.white,
        items: [
          TabItem(
            icon: Icon(Icons.home),
            isIconBlend: true,
            title: 'Início',
          ),
          TabItem(
            icon: Icon(FontAwesomeIcons.utensils),
            isIconBlend: true,
            title: 'RU',
          ),
          TabItem(
            icon: Icon(FontAwesomeIcons.newspaper),
            isIconBlend: true,
            title: 'Notícias',
          ),
          TabItem(
            icon: Icon(FontAwesomeIcons.book),
            isIconBlend: true,
            title: 'Agenda',
          ),
          TabItem(
            icon: Icon(FontAwesomeIcons.mapSigns),
            isIconBlend: true,
            title: 'Mapa',
          ),
        ],
      );
    });
  }
}
