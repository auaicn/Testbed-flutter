import 'package:firebase_analytics_example/src/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondNamedPage extends StatefulWidget {
  const SecondNamedPage({Key? key}) : super(key: key);

  @override
  _SecondNamedPageState createState() => _SecondNamedPageState();
}

class _SecondNamedPageState extends State<SecondNamedPage> {
  @override
  void initState() {
    super.initState();
    print('created _SecondNamedPageState');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('뒤로 이동'),
            ),
            TextButton(
              onPressed: () {
                Get.offAll(() => Home());
              },
              child: Text('홈으로 이동'),
            ),
          ],
        ),
      ),
    );
  }
}
