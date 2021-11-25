import 'package:firebase_analytics_example/src/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetXPage extends StatelessWidget {
  const GetXPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get X Routed Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => Home()),
                );
              },
              child: Text('일반적인 라우트 to Home'),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => Home());
              },
              child: Text('Getx Go Home'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('일반적인 Pop'),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Get x Pop'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => Home()), (route) => false);
              },
              child: Text('일반적인 Navigator pop until'),
            ),
            TextButton(
              onPressed: () {
                Get.offAll(() => Home());
              },
              child: Text('일반적인 Navigator pop until'),
            ),
          ],
        ),
      ),
    );
  }
}
