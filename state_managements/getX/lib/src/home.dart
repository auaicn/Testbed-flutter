import 'package:firebase_analytics_example/src/pages/dependencies/dependency_manage_page.dart';
import 'package:firebase_analytics_example/src/pages/simple_stage_manage.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'pages/normal/get_x_page.dart';
import 'pages/normal/normal_page.dart';
import 'pages/reactive_stage_manage.dart';

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
            TextButton(
              onPressed: () {
                Get.to(() => SimpleStateManagePage());
              },
              child: Text('단순 상태 관리'),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => ReactiveStateManagePage());
              },
              child: Text('반응형 상태 관리'),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => DependencyManagePage());
              },
              child: Text('의존성 주입'),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed('/binding');
              },
              child: Text('Binding Example'),
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
