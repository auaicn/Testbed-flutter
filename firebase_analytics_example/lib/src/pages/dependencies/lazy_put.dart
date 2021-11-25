import 'package:firebase_analytics_example/src/controller/dependency_controller.dart';
import 'package:firebase_analytics_example/src/pages/dependencies/dependency_manage_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LazyPutPage extends StatelessWidget {
  const LazyPutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TextButton(
        child: Text('+'),
        onPressed: () {
          Get.find<DependencyController>().increase();
        },
      ),
    );
  }
}
