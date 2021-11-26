import 'package:firebase_analytics_example/src/controller/reactive_count_controller_with_get_x%20copy.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ReactiveStateManagePage extends StatelessWidget {
  const ReactiveStateManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CountControllerWithReactive());

    return Scaffold(
      appBar: AppBar(
        title: Text('반응형 상태 관리'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Get X Reactive'),
            Obx(() {
              print('updated!');
              return Text('obx ${Get.find<CountControllerWithReactive>().count.value}');
            }),
            TextButton(
              onPressed: () {
                Get.find<CountControllerWithReactive>().increase();
              },
              child: Text('+'),
            ),
            TextButton(
              onPressed: () {
                Get.find<CountControllerWithReactive>().putNumber(5);
              },
              child: Text('5로 변경 이미 5인 경우, 변경되지 않는 것을 주목!'),
            ),
          ],
        ),
      ),
    );
  }
}
