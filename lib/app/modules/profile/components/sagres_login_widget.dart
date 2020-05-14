import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uesc_hub/app/modules/profile/profile_controller.dart';
import 'package:uesc_hub/app/shared/auth/sagres/auth_sagres_controller.dart';

class SagresLoginWidget extends StatelessWidget {
  final sagresController = Modular.get<AuthSagresController>();
  final profileController = Modular.get<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return AlertDialog(
          title: Text('Login SAGRES'),
          actions: sagresController.status == AuthStatus.loading ||
                  sagresController.status == AuthStatus.login
              ? []
              : [
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
              if (sagresController.status == AuthStatus.loading) {
                return LinearProgressIndicator();
              }
              if (sagresController.credentials.isNotEmpty) {
                profileController.fetchTimetableAndSubjects(
                  {
                    "username": sagresController.credentials[0],
                    "password": sagresController.credentials[1]
                  },
                );
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MaterialButton(
                      onPressed: null,
                      disabledColor: Colors.greenAccent.withAlpha(200),
                      disabledTextColor: Colors.black54,
                      child: Text(
                          "Logado como ${sagresController.credentials[0]}"),
                    ),
                    MaterialButton(
                      color: Colors.red[400],
                      onPressed: sagresController.remove,
                      child: Text("Deletar Credenciais"),
                    ),
                  ],
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: sagresController.usernameController,
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
                      controller: sagresController.passwordController,
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
                    sagresController.error == true
                        ? Text(
                            sagresController.errorText,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          )
                        : SizedBox(),
                  ],
                );
              }
            },
          ),
        );
      },
    );
  }
}
