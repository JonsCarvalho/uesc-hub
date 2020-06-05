import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uesc_hub/app/modules/profile/components/sagres_login_widget.dart';
import 'package:uesc_hub/app/shared/auth/sagres/auth_sagres_controller.dart';
import 'profile_controller.dart';

class ProfilePage extends StatefulWidget {
  final String title;
  const ProfilePage({Key key, this.title = "Profile"}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends ModularState<ProfilePage, ProfileController> {
  // final profileController = Modular.get<ProfileController>();
  final sagresController = Modular.get<AuthSagresController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Modular.to.pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        // title: Text(
        //   widget.title,
        //   style: TextStyle(
        //     color: Colors.black,
        //   ),
        // ),
        actions: [
          IconButton(
            icon: Icon(FontAwesomeIcons.powerOff),
            onPressed: controller.logoff,
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 16.0),
                imageProfile(),
                SizedBox(height: 16.0),
                name(),
                SizedBox(height: 25.0),
                Column(
                  children: [
                    MenuListItem(
                      function: () {},
                      icon: FontAwesomeIcons.moon,
                      color: Colors.black,
                      text: 'Dark mode',
                      widget: Switch(
                        value: false,
                        onChanged: (value) {},
                        activeTrackColor: Colors.grey,
                        activeColor: Colors.black,
                      ),
                    ),
                    MenuListItem(
                      text: "Credenciais SAGRES",
                      color: Colors.blue,
                      icon: FontAwesomeIcons.userCircle,
                      function: () {
                        showDialog(
                          context: _,
                          builder: (_) {
                            return SagresLoginWidget();
                          },
                        );
                      },
                      widget: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.greenAccent),
                          color: Colors.greenAccent.withAlpha(20),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: EdgeInsets.all(2),
                        child: Text(
                          'Ativo',
                          style: TextStyle(color: Colors.greenAccent),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8.0),
                      child: Divider(),
                    ),
                    MenuListItem(
                      function: () {},
                      icon: Icons.settings,
                      color: Colors.amber,
                      text: 'Configurações',
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  name() {
    return Text(
      controller.getCurrentUser().displayName.split(' ').first +
          " " +
          controller.getCurrentUser().displayName.split(" ").last.split("")[0] +
          ".",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  imageProfile() {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.grey.shade200,
          style: BorderStyle.solid,
          width: 5,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            offset: -Offset(10 / 2, 10 / 2),
            color: Colors.white,
          ),
          BoxShadow(
              blurRadius: 10,
              offset: Offset(10 / 2, 10 / 2),
              color: Colors.grey.shade400)
        ],
      ),
      child: Container(
          height: 85,
          width: 85,
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            backgroundImage: NetworkImage(controller.getCurrentUser().photoUrl),
          )),
    );
  }

  // isLoggedWidget() {
  //   Observer(
  //     builder: (_) {
  //       return

  //     },
  //   );
  // }
}

class MenuListItem extends StatelessWidget {
  final Function function;
  final IconData icon;
  final Color color;
  final String text;
  final Widget widget;

  const MenuListItem(
      {Key key,
      @required this.function,
      @required this.icon,
      @required this.color,
      @required this.text,
      this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: InkWell(
        onTap: function,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    color: color,
                  ),
                  SizedBox(width: 5),
                  Text(
                    text,
                    style: TextStyle(),
                  ),
                ],
              ),
              if (widget != null) widget,
            ],
          ),
        ),
      ),
    );
  }
}
