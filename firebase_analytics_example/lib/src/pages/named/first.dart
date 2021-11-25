import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstNamedPage extends StatefulWidget {
  const FirstNamedPage({Key? key}) : super(key: key);

  @override
  _FirstNamedPageState createState() => _FirstNamedPageState();
}

class _FirstNamedPageState extends State<FirstNamedPage> {
  @override
  void initState() {
    super.initState();
    print('created _FirstNamedPageState');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Named Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Get.toNamed('/second');
              },
              child: Text('다음 페이지로 이동'),
            ),
            TextButton(
              onPressed: () {
                Get.offNamed('/second');
              },
              child: Text('다음 페이지로 이동 (off)'),
            ),
          ],
        ),
      ),
    );
  }
}
