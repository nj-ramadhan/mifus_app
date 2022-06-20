// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import './local_page.dart';
// import 'package:fl_chart/fl_chart.dart';
import 'dart:io';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  void _handleURLButtonPress(BuildContext context, String url, String title) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => WebViewPage(url, title)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MaterialButton(
              minWidth: 300,
              height: 150,
              color: const Color.fromARGB(255, 28, 43, 54),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const <Widget>[
                  Text(
                    'Connect to Local Device',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.wifi_off_rounded,
                    color: Colors.white,
                    size: 40,
                  ),
                ],
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LocalPage()),
                );
              }),
          MaterialButton(
            minWidth: 300,
            height: 150,
            color: const Color.fromARGB(255, 28, 43, 54),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                Text(
                  'Connect to IOT Device',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.wifi_rounded,
                  color: Colors.white,
                  size: 40,
                ),
              ],
            ),
            onPressed: () {
              _handleURLButtonPress(
                  context, "https://mifus.io", "Mifus Mobile Dashboard");
            },
          ),
        ],
      ),
    );
  }
}

class WebViewPage extends StatefulWidget {
  final String url;
  final String title;

  const WebViewPage(this.url, this.title, {Key key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  WebViewPageState createState() => WebViewPageState(this.url, this.title);
}

class WebViewPageState extends State<WebViewPage> {
  final String url;
  final String title;

  WebViewPageState(this.url, this.title);

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      Expanded(
          child: WebView(
              initialUrl: url, javascriptMode: JavascriptMode.unrestricted))
    ])));
  }
}
