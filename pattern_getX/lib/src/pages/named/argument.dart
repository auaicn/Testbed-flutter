import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArgumentPage extends StatefulWidget {
  const ArgumentPage({Key? key}) : super(key: key);

  @override
  _ArgumentPageState createState() => _ArgumentPageState();
}

class _ArgumentPageState extends State<ArgumentPage> {
  @override
  void initState() {
    super.initState();
    print('created _ArgumentPageState');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Argument Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${Get.arguments}"),
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
