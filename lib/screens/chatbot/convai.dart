import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Convai extends StatefulWidget {
  @override
  _ConvaiState createState() => _ConvaiState();
}

class _ConvaiState extends State<Convai> {
  var initUrl = "http://3.235.191.187/";

  WebViewController _webController;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox.expand(
          child: WebView(
            initialUrl: initUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController _tmpWebController) {
              _webController = _tmpWebController;
            },
          ),
        ),
      ),
    );
  }

  void handleButtonPressed() {
    print('test');
    _webController.currentUrl().then((s) => print(s));
  }
}
