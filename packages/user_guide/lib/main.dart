import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_guide/screens/flutter_intro_screen.dart';
import 'package:user_guide/screens/tutorial_coach_mark_screen.dart';

import 'enums/mode.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {
                Get.to(() => FlutterIntroScreen(title: 'flutter_intro'));
              },
              child: Text('flutter_intro: ^2.3.1'),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => TutorialCoachMarkScreen('tutorial_coach_mark'));
              },
              child: Text('tutorial_coach_mark: ^1.2.1'),
            ),
          ],
        ),
      ),
    );
  }
}
