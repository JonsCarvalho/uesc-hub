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
        color: Colors.black,
        backgroundColor: Colors.cyan[900],
        items: [
          TabItem(
            icon: Icon(Icons.home),
            isIconBlend: true,
            title: 'Início',
          ),
          TabItem(
            icon: Icon(Icons.fastfood),
            isIconBlend: true,
            title: 'RU',
          ),
          TabItem(
            icon: Icon(Icons.fiber_new),
            isIconBlend: true,
            title: 'News',
          ),
          TabItem(
            icon: Icon(Icons.book),
            isIconBlend: true,
            title: 'Agenda',
          ),
          TabItem(
            activeIcon: CircleAvatar(
              radius: 13,
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(1),
                child: ClipOval(
                  child: Image.network(
                    controller.getCurrentUser().photoUrl,
                  ),
                ),
              ),
            ),
            icon: CircleAvatar(
              radius: 13,
              backgroundColor: Colors.black,
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
