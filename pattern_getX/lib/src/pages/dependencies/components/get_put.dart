import 'package:firebase_analytics_example/src/controller/dependency_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetPutPage extends StatelessWidget {
  const GetPutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Put'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('로그에 찍히는 bining 된 Instace 의 hashcode 를 잘 볼것!'),
            TextButton(
              child: Text('+'),
              onPressed: () {
                print(Get.find<DependencyController>().hashCode);
                Get.find<DependencyController>().increase();
              },
            ),
          ],
        ),
      ),
    );
  }
}
