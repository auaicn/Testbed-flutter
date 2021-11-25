import 'package:firebase_analytics_example/src/controller/dependency_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PutAsync extends StatelessWidget {
  const PutAsync({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Put async'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('로그에 찍히는 bining 시점을 잘 볼것!'),
            Text('+ 를 누르지 않아도 기다리면 생성된다 (시간차로 찍힌다)'),
            TextButton(
              child: Text('+'),
              onPressed: () {
                Get.find<DependencyController>().increase();
              },
            ),
          ],
        ),
      ),
    );
  }
}
