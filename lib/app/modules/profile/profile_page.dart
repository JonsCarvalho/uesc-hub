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
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(FontAwesomeIcons.signOutAlt),
            onPressed: controller.logoff,
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          return ListView(
            children: [
              Container(
                color: Colors.blueAccent,
                child: ListTile(
                  title: Text(
                    'Credencias do SAGRES',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Icon(
                    FontAwesomeIcons.userLock,
                    color: Colors.white,
                  ),
                  onTap: () {
                    showDialog(
                      context: _,
                      builder: (_) {
                        return SagresLoginWidget();
                      },
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
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
