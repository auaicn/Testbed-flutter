import 'package:firebase_analytics_example/src/controller/count_controller_with_get_x.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class BindingPage extends StatelessWidget {
class BindingPage extends GetView<CountControllerWithGetX> {
  const BindingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Binding'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Get X Binding'),

            // Obx 를 사용한다면, 더 줄일 수 있지만, GetxController 를 reactive 방식으로 변경해야한다. 현재는 오류가 날 것이다.
            // Obx(() => Text(controller.count.toString())),
            GetBuilder<CountControllerWithGetX>(builder: (_) {
              return Text(_.count.toString());
            }),
            TextButton(
              child: Text('+'),
              onPressed: () {
                // Get.find<CountControllerWithGetX>().increaseJust();
                // CountControllerWithGetX.to.increaseJust();
                controller.increaseJust();
              },
            ),
          ],
        ),
      ),
    );
  }
}
