import 'package:firebase_analytics_example/src/controller/count_controller_with_get_x.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReactiveWithGetX extends StatelessWidget {
  final CountControllerWithGetX countControllerWithGetX = Get.put(CountControllerWithGetX());

  @override
  Widget build(BuildContext context) {
    Get.put(CountControllerWithGetX());

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('get X 의 상태를 보여준다'),
          GetBuilder<CountControllerWithGetX>(
            id: 'first',
            builder: (controller) {
              return Text('${controller.count}');
            },
          ),
          GetBuilder<CountControllerWithGetX>(
            id: 'second',
            builder: (controller) {
              return Text('${controller.count}');
            },
          ),
          TextButton(
            onPressed: () {
              // Get.find<CountControllerWithGetX>().increase();
              countControllerWithGetX.increase('first');
            },
            child: Text('+'),
          ),
          TextButton(
            onPressed: () {
              // Get.find<CountControllerWithGetX>().increase();
              countControllerWithGetX.increase('second');
            },
            child: Text('+'),
          ),
        ],
      ),
    );
  }
}
