import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      title: 'UESC Hub',
      theme: ThemeData(
          primarySwatch: Colors.cyan,
          primaryColor: Colors.cyan,
          primaryColorDark: Color.fromRGBO(0, 149, 164, 1),
          primaryColorLight: Color.fromRGBO(178, 235, 242, 1),
          accentColor: Color.fromRGBO(255, 87, 34, 1),
          iconTheme: IconThemeData(color: Colors.black),
          primaryTextTheme: TextTheme(
            button: TextStyle().copyWith(color: Colors.white),
            bodyText1:
                TextStyle().copyWith(color: Color.fromRGBO(33, 33, 33, 1)),
            bodyText2:
                TextStyle().copyWith(color: Color.fromRGBO(117, 117, 117, 1)),
            headline1:
                TextStyle().copyWith(color: Color.fromRGBO(33, 33, 33, 1)),
            headline2:
                TextStyle().copyWith(color: Color.fromRGBO(117, 117, 117, 1)),
            subtitle1:
                TextStyle().copyWith(color: Color.fromRGBO(117, 117, 117, 1)),
          ),
          dividerColor: Color.fromRGBO(189, 189, 189, 1),
          fontFamily: "ProductSans"),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
