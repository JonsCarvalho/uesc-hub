import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
          2: '99+',
          3: Colors.redAccent,
        },
        onTap: controller.setPageController,
        style: TabStyle.flip,
        // curve: Curves.easeInSine,

        activeColor: Colors.white,
        color: Colors.blue,
        backgroundColor: Colors.cyan[900],
        items: [
          TabItem(
            icon: Icon(Icons.home),
            activeIcon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            title: 'Início',
          ),
          TabItem(
            icon: Icon(Icons.fastfood),
            activeIcon: Icon(
              Icons.fastfood,
              color: Colors.white,
            ),
            title: 'RU',
          ),
          TabItem(
            icon: Icon(Icons.fiber_new),
            activeIcon: Icon(
              Icons.fiber_new,
              color: Colors.white,
            ),
            title: 'News',
          ),
          TabItem(
            icon: Icon(Icons.book),
            activeIcon: Icon(
              Icons.book,
              color: Colors.white,
            ),
            title: 'Horários',
          ),
          TabItem(
            icon: CircleAvatar(
              radius: 13,
              backgroundColor: controller.pageController.page == 4.0
                  ? Colors.white
                  : Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(1),
                child: ClipOval(
                  child: Image.network(
                    controller.getCurrentUser().photoUrl,
                  ),
                ),
              ),
            ),
            title: 'Perfil',
          ),
        ],
      );
    });
  }
}
