import 'package:firebase_analytics_example/src/binding/binding_page_binding.dart';
import 'package:firebase_analytics_example/src/home.dart';
import 'package:firebase_analytics_example/src/pages/named/argument.dart';
import 'package:firebase_analytics_example/src/pages/named/argument_class.dart';
import 'package:firebase_analytics_example/src/pages/named/first.dart';
import 'package:firebase_analytics_example/src/pages/named/second.dart';
import 'package:firebase_analytics_example/src/pages/named/user_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/binding/binding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => Home(), transition: Transition.zoom),
          GetPage(name: '/first', page: () => FirstNamedPage(), transition: Transition.zoom),
          GetPage(name: '/second', page: () => SecondNamedPage(), transition: Transition.zoom),
          GetPage(name: '/argument', page: () => ArgumentPage(), transition: Transition.zoom),
          GetPage(name: '/argument_class', page: () => ArgumentClassPage(), transition: Transition.zoom),
          GetPage(name: '/user/:uid', page: () => UserPage(), transition: Transition.fade),
          GetPage(
            /// 페이지 이동시에, 즉 Get.to 시에 전달할 수도 있지만
            /// 여기에서 한번 말해주면, 다른데서 편하게 부를 수 있다.
            name: '/binding',
            page: () => BindingPage(),
            binding: BindingPageBinding(),
          ),
        ]);
  }
}
