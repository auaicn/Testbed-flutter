import 'package:firebase_analytics_example/src/controller/dependency_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LazyPutPage extends StatelessWidget {
  const LazyPutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lazy Get Put'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('로그에 찍히는 bining 시점을 잘 볼것!'),
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
