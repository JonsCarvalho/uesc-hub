import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
              FlatButton(
                onPressed: () async {
                  // await sagresController.deleteCredentials();

                  print(sagresController.credentials.isEmpty);
                },
                child: Text('Teste Credenciais'),
              ),
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
                          return AlertDialog(
                            title: Text('Login SAGRES'),
                            actions: [
                              MaterialButton(
                                color: Theme.of(context).primaryColor,
                                onPressed: () async {
                                  if (sagresController.credentials.isEmpty) {
                                    sagresController.save();
                                  } else {
                                    Modular.to.pop();
                                  }
                                },
                                child: Text(
                                  'Ok',
                                  // style: TextStyle(color: Colors.white),
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  sagresController.setError(false);
                                  Modular.to.pop();
                                },
                                child: Text(
                                  'Cancelar',
                                  // style: TextStyle(color: Colors.teal),
                                ),
                              )
                            ],
                            scrollable: true,
                            content: Observer(
                              builder: (_) {
                                return sagresController.status ==
                                        AuthStatus.loading
                                    ? LinearProgressIndicator()
                                    : sagresController.credentials.isNotEmpty
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              MaterialButton(
                                                onPressed: null,
                                                disabledColor: Colors
                                                    .greenAccent
                                                    .withAlpha(200),
                                                disabledTextColor:
                                                    Colors.black54,
                                                child: Text(
                                                    "Logado como ${sagresController.credentials[0]}"),
                                              ),
                                              MaterialButton(
                                                color: Colors.red[400],
                                                onPressed:
                                                    sagresController.remove,
                                                child:
                                                    Text("Deletar Credenciais"),
                                              ),
                                            ],
                                          )
                                        : Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              TextField(
                                                controller: sagresController
                                                    .usernameController,
                                                autofocus: true,
                                                keyboardType:
                                                    TextInputType.text,
                                                textInputAction:
                                                    TextInputAction.next,
                                                decoration: InputDecoration(
                                                    hintText: 'usuário',
                                                    contentPadding:
                                                        EdgeInsets.all(0),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                    ),
                                                    prefixIcon: Icon(
                                                        Icons.person_outline)),
                                                style: TextStyle(
                                                    color: Colors.teal),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              TextField(
                                                controller: sagresController
                                                    .passwordController,
                                                obscureText: true,
                                                autofocus: true,
                                                keyboardType:
                                                    TextInputType.text,
                                                textInputAction:
                                                    TextInputAction.done,
                                                decoration: InputDecoration(
                                                    hintText: 'senha',
                                                    contentPadding:
                                                        EdgeInsets.all(0),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                    ),
                                                    prefixIcon: Icon(
                                                        Icons.lock_outline)),
                                                style: TextStyle(
                                                    color: Colors.teal),
                                              ),
                                              SizedBox(height: 15),
                                              sagresController.error == true
                                                  ? Text(
                                                      sagresController
                                                          .errorText,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    )
                                                  : SizedBox(),
                                            ],
                                          );
                              },
                            ),
                          );
                        });
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
