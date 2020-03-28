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
import 'package:uesc_hub/app/modules/news/news_module.dart';
import 'package:uesc_hub/app/modules/profile/profile_module.dart';
import 'package:uesc_hub/app/modules/restaurant/restaurant_module.dart';
import 'package:uesc_hub/app/modules/schedule/schedule_module.dart';
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
      bottomNavigationBar: NavigationBarWidget(),
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
              RouterOutlet(module: ProfileModule()),
            ],
          );
        },
      ),
    );
  }

  body() {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: AppBarWidget(),
            pinned: true,
            expandedHeight: 210.0,
            flexibleSpace: FlexibleSpaceBar(
              background: FlexibleAppBarWidget(),
            ),
            backgroundColor: Colors.teal,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Container(
                      height: 60,
                      child: Center(
                        child: Text('Card Teste'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Container(
                      height: 60,
                      child: Center(
                        child: Text('Card Teste'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Container(
                      height: 60,
                      child: Center(
                        child: Text('Card Teste'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Container(
                      height: 60,
                      child: Center(
                        child: Text('Card Teste'),
                      ),
                    ),
                  ),
                ),
                NextClassWidget(),
                Container(
                  height: 50,
                  color: Colors.pink,
                ),
                Container(
                  height: 50,
                  color: Colors.blue,
                ),
                Container(
                  height: 50,
                  color: Colors.yellow,
                ),
                Container(
                  height: 50,
                  color: Colors.brown,
                ),
                Container(
                  height: 50,
                  color: Colors.green,
                ),
                Container(
                  height: 50,
                  color: Colors.pink,
                ),
                Container(
                  height: 50,
                  color: Colors.blue,
                ),
                Container(
                  height: 50,
                  color: Colors.yellow,
                ),
                Container(
                  height: 50,
                  color: Colors.brown,
                ),
                Container(
                  height: 50,
                  color: Colors.green,
                ),
                Container(
                  height: 50,
                  color: Colors.pink,
                ),
                Container(
                  height: 50,
                  color: Colors.blue,
                ),
                Container(
                  height: 50,
                  color: Colors.yellow,
                ),
                Container(
                  height: 50,
                  color: Colors.brown,
                ),
                Container(
                  height: 50,
                  color: Colors.green,
                ),
                Container(
                  height: 50,
                  color: Colors.pink,
                ),
                Container(
                  height: 50,
                  color: Colors.blue,
                ),
                Container(
                  height: 50,
                  color: Colors.yellow,
                ),
                Container(
                  height: 50,
                  color: Colors.brown,
                ),
                Container(
                  height: 50,
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ],
      ),
    );

    // CustomScrollView(
    //   slivers: <Widget>[
    // SliverAppBar(
    //   backgroundColor: Colors.white,
    //   title: Text("UESC Hub",
    //       style: TextStyle(color: Colors.black),
    //       textAlign: TextAlign.left),
    //   actions: <Widget>[ProfileWidget()],
    // ),
    // Column(
    //   crossAxisAlignment: CrossAxisAlignment.stretch,
    //   children: <Widget>[
    //     Padding(
    //       padding: const EdgeInsets.all(20),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.end,
    //         children: <Widget>[
    //           SalutationWidget(),
    //           SizedBox(height: 25),
    //           LuckWidget(),
    //         ],
    //       ),
    //     ),
    //     SizedBox(height: 25),
    //     NextClassWidget(),
    //     Container(
    //       height: 300,
    //       color: Colors.red,
    //     ),
    //     Container(
    //       height: 300,
    //       color: Colors.blue,
    //     ),
    //     Container(
    //       height: 300,
    //       color: Colors.green,
    //     ),
    //   ],
    // ),
    //   ],
    // );
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
