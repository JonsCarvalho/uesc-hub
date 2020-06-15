import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:html/parser.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'sagres_controller.dart';

class SagresPage extends StatefulWidget {
  final String title;
  const SagresPage({Key key, this.title = "Sagres"}) : super(key: key);

  @override
  _SagresPageState createState() => _SagresPageState();
}

class _SagresPageState extends ModularState<SagresPage, SagresController> {
  WebViewController _webViewController;

  final String initialUrl =
      'https://www.prograd.uesc.br/PortalSagres/Acesso.aspx';
  final String finalUrl =
      'https://www.prograd.uesc.br/PortalSagres/Modules/Portal/Default.aspx';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: _teste(),
      body: WebView(
        initialUrl: initialUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController controllerInstance) {
          _webViewController = controllerInstance;
        },
        javascriptChannels: <JavascriptChannel>[
          _extractDataJSChannel(context),
        ].toSet(),
        onPageFinished: (String url) {
          print('Page finished loading: $url');
          if (url == initialUrl) {
            _webViewController.evaluateJavascript(
                "document.getElementsByClassName('externo-menu')[0].style.display='none';");
            _webViewController.evaluateJavascript(
                "document.getElementsByClassName('acesso-externo-bg anim-fadeIn')[0].style.display='none';");
            _webViewController.evaluateJavascript(
                "document.getElementsByClassName('externo-rodape')[0].style.display='none';");
            _webViewController.evaluateJavascript(
                "document.getElementsByClassName('qrcode-wrapper')[0].style.display='none';");

            _webViewController.evaluateJavascript(
                "document.getElementsByClassName('externo-form-linha')[2].style.padding = '0';");
            _webViewController.evaluateJavascript(
                "document.getElementsById('ctl00_PageContent_LoginPanel_CaptchaValidator_pnView')[0].style.margin = '0';");
            _webViewController.evaluateJavascript(
                "document.getElementsByClassName('g-recaptcha')[0].style.padding = '0';");
            _webViewController.evaluateJavascript(
                "document.getElementsByClassName('g-recaptcha')[0].style.margin = '0';");
            _webViewController.evaluateJavascript(
                "document.getElementsByClassName('g-recaptcha')[0].style.width = '150px';");

            // var doc = _webViewController.evaluateJavascript(
            //     "document.documentElement.outerHTML;");
            // var page = parse(doc);
            // page.getElementById('ctl00_PageContent_LoginPanel');
            // _webViewController.
            // _webViewController.evaluateJavascript(
            //     "(function(){Flutter.postMessage(window.document.body.outerHTML)})();");
          } else if (url == finalUrl) {
            //webparts-coluna coluna-meio
            var docHtml = parse(_webViewController.evaluateJavascript(
                "document.getElementsByClassName('conteudo-principal clear';"));
            print(';;;;;;;;;;;;;;;;;;;;;;;;;;;;');
            print(docHtml.toString());
            print(';;;;;;;;;;;;;;;;;;;;;;;;;;;;');
          }
        },
      ),
    );
  }

  _teste() {
    return FloatingActionButton(
      onPressed: () async {
        // var docHtml = parse(_webViewController.evaluateJavascript(
        //         "document.getElementsByClassName('conteudo-principal clear';"));
        //     print(';;;;;;;;;;;;;;;;;;;;;;;;;;;;');
        //     print(docHtml.toString());
        //     print(';;;;;;;;;;;;;;;;;;;;;;;;;;;;');
        var document = await _webViewController
            .evaluateJavascript("document.documentElement.outerHTML;");
        print("_________________________________");
        // var document = parse(message.message);
        await controller.fetchTimetableAndSubjects({'page': document.toString()});
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => Material(
        //       child: Container(
        //         child: ListView(
        //           children: [
        //             Text(
        //               document.toString(),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        // );
        print(document.toString());
        // await _webViewController.evaluateJavascript("\$('body').html();"));
        // print(document.documentElement.toString());
        print("_________________________________");
        // print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
        // print(await _webViewController.currentUrl());
        // print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');

        // var document = await _webViewController
        //     .evaluateJavascript('document.documentElement.innerHTML');
        // print(docu);
        // var dom = parse(document);
        // print(dom.getElementsByTagName('title')[0].innerHtml);
        // print(await _webViewController.evaluateJavascript("document.getElementsByClassName(\"meus-horarios\");"));
        // String js = """javascript:
        //   document.documentElement.innerHTML';
        //   """;
        // Dio dio;
        // var html = await _webViewController
        //     .evaluateJavascript("window.document.body.innerHTML;");
        // "document.documentElement.innerHTML.toString();");

        // print(parse(html).toString());
        // var response = await dio.post(
        //   '192.168.0.105:5000' + "/teste/",
        //   data: {"html": html.toString()},
        // );
        // print(response.data);
      },
      backgroundColor: Colors.pink,
      child: Text('teste'),
    );
  }

  JavascriptChannel _extractDataJSChannel(BuildContext context) {
    return JavascriptChannel(
      name: 'Flutter',
      onMessageReceived: (JavascriptMessage message) {
        print("_________________________________");
        var document = parse(message.message);
        print(document.querySelectorAll('meus-horarios').toString());
        print("_________________________________");
      },
    );
  }
}
