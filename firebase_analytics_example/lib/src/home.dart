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
              child: Text('기존 라우트'),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => GetXPage());
              },
              child: Text('Getx 라우트'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/first');
              },
              child: Text('Named 라우트'),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed('/first');
              },
              child: Text('Named Get X라우트'),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed('/argument', arguments: {'name': 'kyungho', 'age': 21});
              },
              child: Text('Argument 전달'),
            ),
            TextButton(
              onPressed: () {
                User user = User(name: 'kanghyun', age: 3);
                Get.toNamed('/argument_class', arguments: user);
              },
              child: Text('Argument 전달 Custom Class'),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed('/user/12343?name=개남&age=25');
              },
              child: Text('parameter 전달 (uid)'),
            ),
          ],
        ),
      ),
    );
  }
}

class User {
  String name;
  int age;

  User({
    required this.name,
    required this.age,
  });
}
