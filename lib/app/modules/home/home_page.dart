import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uesc_hub/app/modules/home/components/next_class/next_class_widget.dart';
import 'package:uesc_hub/app/shared/auth/repositories/auth_repository.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "UESC Hub",
          style: TextStyle(
            color: Colors.black,
          ),
          textAlign: TextAlign.left,
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              radius: 35,
              backgroundColor: Colors.transparent,
              child: InkWell(
                focusColor: Colors.purple,
                highlightColor: Colors.cyan,
                hoverColor: Colors.green,
                splashColor: Colors.red,
                onTap: () {},
                borderRadius: BorderRadius.circular(100),
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(1),
                      child: ClipOval(
                        child:
                            Image.network(controller.getCurrentUser().photoUrl),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              // getDisplayNameEmail() != null
              // ? "${getSalutation()} ${getDisplayNameEmail().split(" ").first}!"
              // : "${getSalutation()} ${getCurrentUser().displayName.split(" ").first}!",
              "${getSalutation()} ${controller.getCurrentUser().displayName.split(" ").first}!",
              style: TextStyle(
                // color: Color(0xff827daa).withGreen(200),
                fontFamily: "ProductSans",
                color: Colors.black,
                fontSize: 17,
                // fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  getDay(DateTime.now()),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
                Text(
                  ", ${DateTime.now().day.toString()} de ${getMonth(DateTime.now())}",
                  style: TextStyle(
                    fontFamily: "ProductSans",
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Text(
              "Sorte do dia kjvjhbk kjhgf kjhjhgasdja ds ddsad kjhgfdj fsdfkkjh dskfsfkhk kjjksf, fsdfsdf",
              style: TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.justify,
            ),
            Text(
              "Autor Desconhecido",
              style: TextStyle(
                color: Colors.black54,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(height: 25),
            NextClassWidget(),
          ],
        ),
      ),
    );
  }

  getSalutation() {
    DateTime date = DateTime.now();
    int hour = date.hour;
    if ((hour >= 0) && (hour < 5)) {
      return "Boa madrugada";
    } else if ((hour >= 5) && (hour < 12)) {
      return "Bom dia";
    } else if ((hour >= 12) && (hour < 18)) {
      return "Boa tarde";
    } else if (hour >= 18) {
      return "Boa noite";
    }
  }

  getDay(DateTime day) {
    switch (day.weekday.toInt()) {
      case 1:
        return "Segunda";
        break;
      case 2:
        return "Terça";
        break;
      case 3:
        return "Quarta";
        break;
      case 4:
        return "Quinta";
        break;
      case 5:
        return "Sexta";
        break;
      case 6:
        return "Sábado";
        break;
      case 7:
        return "Domingo";
        break;
      default:
    }
  }

  getMonth(DateTime day) {
    switch (day.month.toInt()) {
      case 1:
        return "Janeiro";
        break;
      case 2:
        return "Fevereiro";
        break;
      case 3:
        return "Março";
        break;
      case 4:
        return "Abril";
        break;
      case 5:
        return "Maio";
        break;
      case 6:
        return "Junho";
        break;
      case 7:
        return "Julho";
        break;
      case 8:
        return "Agosto";
        break;
      case 9:
        return "Setembro";
        break;
      case 10:
        return "Outubro";
        break;
      case 11:
        return "Novembro";
        break;
      case 12:
        return "Dezembro";
        break;
      default:
    }
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
