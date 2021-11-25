import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'pages/normal/get_x_page.dart';
import 'pages/normal/normal_page.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => NormalPage()),
                );
              },
              child: Text('일반적인 라우트'),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => GetXPage());
              },
              child: Text('Getx 라우트'),
            ),
          ],
        ),
      ),
    );
  }
}
