import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uesc_hub/app/modules/home/components/app_bar/app_bar_widget.dart';
import 'package:uesc_hub/app/modules/home/components/app_bar/flexible_app_bar_widget.dart';
import 'package:uesc_hub/app/modules/home/components/header/luck_widget.dart';
import 'package:uesc_hub/app/modules/home/components/header/profile_widget.dart';
import 'package:uesc_hub/app/modules/home/components/header/salutation_widget.dart';
import 'package:uesc_hub/app/modules/home/components/navigation_bar/navigation_bar_widget.dart';
import 'package:uesc_hub/app/modules/home/components/next_class/next_class_widget.dart';
import 'package:uesc_hub/app/modules/navigation/navigation_module.dart';
import 'package:uesc_hub/app/modules/news/news_module.dart';
import 'package:uesc_hub/app/modules/profile/profile_module.dart';
import 'package:uesc_hub/app/modules/restaurant/restaurant_module.dart';
import 'package:uesc_hub/app/modules/schedule/schedule_module.dart';
import 'package:uesc_hub/app/shared/auth/sagres/auth_sagres_controller.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final sagresController = Modular.get<AuthSagresController>();

  @override
  void initState() {
    controller.pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    controller.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBarWidget(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 16.0),
            child: AppBarWidget(),
          ),
        ),
      ),
      body: Observer(
        builder: (_) {
          return PageView(
            controller: controller.pageController,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              body(),
              RouterOutlet(module: RestaurantModule()),
              RouterOutlet(module: NewsModule()),
              RouterOutlet(module: ScheduleModule()),
              RouterOutlet(module: NavigationModule()),
            ],
          );
        },
      ),
    );
  }

  body() {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: 8.0),
          SalutationWidget(),
          SizedBox(height: 15.0),
          NextClassWidget(),
        ],
      ),
    );
  }
}

// Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             icon: Icon(Icons.highlight_off), onPressed: controller.logoff),
//         title: TextField(
//           controller: controller.textController,
//         ),
//         actions: <Widget>[
//           Observer(builder: (_) {
//             return IconButton(
//               icon: Icon(Icons.add),
//               onPressed: controller.disableAdd ? null : controller.save,
//             );
//           }),
//         ],
//       ),
//       body: Observer(builder: (_) {
//         return ListView.builder(
//           itemCount: controller.list.length,
//           itemBuilder: (_, index) {
//             return ItemWidget(
//               index: index,
//             );
//           },
//         );
//       }),
//     );
