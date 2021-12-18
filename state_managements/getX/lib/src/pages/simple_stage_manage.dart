import 'package:firebase_analytics_example/src/controller/count_controller_with_provider.dart';
import 'package:firebase_analytics_example/src/pages/state/with_provider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'state/with_getX.dart';

class SimpleStateManagePage extends StatelessWidget {
  const SimpleStateManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('단순 상태 관리'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: WithGetX(),
            ),
            Expanded(
              child: ChangeNotifierProvider<CountControllerWithProvider>(
                create: (_) => CountControllerWithProvider(),
                child: WithProvider(),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('뒤로 이동'),
            ),
          ],
        ),
      ),
    );
  }
}
