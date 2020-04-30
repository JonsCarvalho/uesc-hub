import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'profile_controller.dart';

class ProfilePage extends StatefulWidget {
  final String title;
  const ProfilePage({Key key, this.title = "Profile"}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends ModularState<ProfilePage, ProfileController> {
  final profileController = Modular.get<ProfileController>();

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
      body: ListView(
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
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title: Text('Login SAGRES'),
                      actions: [
                        MaterialButton(
                          color: Theme.of(context).primaryColor,
                          onPressed: () => profileController
                                      .usernameController.text.isEmpty ||
                                  profileController
                                      .passwordController.text.isEmpty
                              ? profileController.errorText = true
                              : profileController.save(),
                          child: Text(
                            'Ok',
                            // style: TextStyle(color: Colors.white),
                          ),
                        ),
                        MaterialButton(
                          onPressed: Modular.to.pop,
                          child: Text(
                            'Cancelar',
                            // style: TextStyle(color: Colors.teal),
                          ),
                        )
                      ],
                      content: Container(
                        height: 200,
                        child: Column(
                          children: [
                            Divider(),
                            TextField(
                              controller: profileController.usernameController,
                              autofocus: true,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  hintText: 'usuário',
                                  contentPadding: EdgeInsets.all(0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  prefixIcon: Icon(Icons.person_outline)),
                              style: TextStyle(color: Colors.teal),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextField(
                              controller: profileController.passwordController,
                              obscureText: true,
                              autofocus: true,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                  hintText: 'senha',
                                  contentPadding: EdgeInsets.all(0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  prefixIcon: Icon(Icons.lock_outline)),
                              style: TextStyle(color: Colors.teal),
                            ),
                            SizedBox(height: 15),
                            profileController.errorText == true
                                ? Text(
                                    'Os campos de usuário e senha devem estar preenchidos!',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  )
                                : SizedBox(),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
