import 'package:finger_battle/pages/play_ground.dart';
import 'package:finger_battle/pages/results.dart';
import 'package:flutter/material.dart';

import 'pages/start_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      routes: {
        '/play_ground': (context) => PlayGround(),
        '/results': (context) => Results(),
        '/start_page': (context) => StartPage(),
      },
      debugShowCheckedModeBanner: false,
      home: StartPage(),
    );
  }
}
