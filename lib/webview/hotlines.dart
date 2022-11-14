import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Hotlines extends StatefulWidget {
  const Hotlines({Key? key}) : super(key: key);

  @override
  _FireState createState() => _FireState();
}

class _FireState extends State<Hotlines> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'https://www.dar.gov.ph/directory/offices/region-x',
      ),
    );
  }
}
