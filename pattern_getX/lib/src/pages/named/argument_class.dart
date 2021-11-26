import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home.dart';

class ArgumentClassPage extends StatefulWidget {
  const ArgumentClassPage({Key? key}) : super(key: key);

  @override
  _ArgumentClassPageState createState() => _ArgumentClassPageState();
}

class _ArgumentClassPageState extends State<ArgumentClassPage> {
  @override
  void initState() {
    super.initState();
    print('created _ArgumentClassPageState');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ArgumentClass Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${(Get.arguments as User).name} ${(Get.arguments as User).age} 살"),
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
