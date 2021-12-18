import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onDoubleTap: () => Get.back(),
        child: Image.asset('assets/icons/icon.png', height: 40, width: 40),
      ),
    );
  }
}
