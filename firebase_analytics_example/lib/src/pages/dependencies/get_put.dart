import 'package:firebase_analytics_example/src/controller/dependency_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetPutPage extends StatelessWidget {
  const GetPutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TextButton(
        child: Text('+'),
        onPressed: () {
          print(Get.find<DependencyController>().hashCode);
          Get.find<DependencyController>().increase();
        },
      ),
    );
  }
}
