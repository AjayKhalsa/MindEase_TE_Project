

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyAppState extends StatefulWidget {
  @override
  _MyAppStateState createState() => _MyAppStateState();
}

class _MyAppStateState extends State<MyAppState> {
   var initUrl = "http://18.210.15.239:8080/chat";

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

