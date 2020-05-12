import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:uesc_hub/app/modules/home/components/navigation_bar/navigation_bar_controller.dart';
import 'package:uesc_hub/app/modules/home/home_controller.dart';

class NavigationComponentWidget extends StatelessWidget {
  final String title;
  final int index;
  final IconData icon;
  final HomeController homeController;
  final NavigationBarController navigationBarController;

  const NavigationComponentWidget(
      {Key key,
      @required this.title,
      @required this.index,
      @required this.icon,
      @required this.homeController,
      @required this.navigationBarController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return InkWell(
          onTap: () async {
            navigationBarController.navagationComponentClick(index);
            homeController.setPageController(index);
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeIn,
            decoration: BoxDecoration(
                // color: navigationBarController.indexComponentSelected == index
                //     ? Colors.amber
                //     : Colors.transparent,
                ),
            padding: EdgeInsets.all(5),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeIn,
                        margin:
                            navigationBarController.indexComponentSelected ==
                                    index
                                ? EdgeInsets.only(top: 1)
                                : EdgeInsets.only(top: 4),
                        alignment: Alignment.center,
                        child: Icon(
                          icon,
                          size:
                              navigationBarController.indexComponentSelected ==
                                      index
                                  ? 20
                                  : 16,
                          color:
                              navigationBarController.indexComponentSelected ==
                                      index
                                  ? Colors.black
                                  : Colors.black.withAlpha(170),
                        ),
                      ),
                    ),
                    // SizedBox(height: 8),
                    Expanded(
                      flex: 2,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeIn,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                fontSize: 14,
                                color: navigationBarController
                                            .indexComponentSelected ==
                                        index
                                    ? Colors.black
                                    : Colors.black.withAlpha(170),
                              ),
                            ),
                            AnimatedContainer(
                              duration: Duration(milliseconds: 400),
                              curve: Curves.easeInCubic,
                              decoration: BoxDecoration(
                                color: navigationBarController
                                            .indexComponentSelected ==
                                        index
                                    ? Theme.of(_).primaryColor
                                    : Colors.transparent,
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withAlpha(100),
                                    blurRadius: 6.0,
                                    spreadRadius: 0.5,
                                    offset: Offset(
                                      0.0,
                                      3.0,
                                    ),
                                  )
                                ],
                              ),
                              height: 2,
                              width: navigationBarController
                                          .indexComponentSelected ==
                                      index
                                  ? title.length * 5.0
                                  : .1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 3,
                  right: 12,
                  child: navigationBarController.notifications[index] is Color
                      ? AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeIn,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: navigationBarController.notifications[index],
                            boxShadow: [
                              BoxShadow(
                                color: navigationBarController
                                    .notifications[index]
                                    .withAlpha(100),
                                blurRadius: 6.0,
                                spreadRadius: 0.0,
                                offset: Offset(
                                  0.0,
                                  3.0,
                                ),
                              )
                            ],
                          ),
                          height: 8,
                          width: 8,
                        )
                      : navigationBarController.notifications[index] is String
                          ? AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeIn,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.red,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.red.withAlpha(100),
                                    blurRadius: 6.0,
                                    spreadRadius: 0.0,
                                    offset: Offset(
                                      0.0,
                                      3.0,
                                    ),
                                  )
                                ],
                              ),
                              padding: EdgeInsets.all(2),
                              child: Text(
                                navigationBarController.notifications[index],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 9,
                                ),
                              ),
                            )
                          : AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeIn,
                              child: Icon(
                                navigationBarController.notifications[index],
                                size: 12,
                                color: Colors.red,
                              ),
                            ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
