import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uesc_hub/app/modules/home/components/header/luck_widget.dart';
import 'package:uesc_hub/app/modules/home/components/header/profile_widget.dart';
import 'package:uesc_hub/app/modules/home/components/header/salutation_widget.dart';
import 'package:uesc_hub/app/modules/home/components/navigation_bar/navigation_bar_widget.dart';
import 'package:uesc_hub/app/modules/home/components/next_class/next_class_widget.dart';
import 'package:uesc_hub/app/shared/auth/repositories/auth_repository.dart';
import 'components/functions.dart';
import 'components/item/item_widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("UESC Hub",
            style: TextStyle(color: Colors.black), textAlign: TextAlign.left),
        actions: <Widget>[ProfileWidget()],
      ),
      bottomNavigationBar: NavigationBarWidget(),
      body: Observer(
        builder: (_) {
          return PageView(
            controller: controller.pageController,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          SalutationWidget(),
                          SizedBox(height: 25),
                          LuckWidget(),
                        ],
                      ),
                    ),
                    SizedBox(height: 25),
                    NextClassWidget(),
                  ],
                ),
              ),
              Container(color: Colors.pink),
              Container(color: Colors.yellow),
              Container(color: Colors.purple),
              Container(color: Colors.cyan),
            ],
          );
        },
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
