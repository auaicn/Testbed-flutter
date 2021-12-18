import 'package:firebase_analytics_example/src/controller/dependency_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/get_create.dart';
import 'components/get_put.dart';
import 'components/lazy_put.dart';
import 'components/put_async.dart';

class DependencyManagePage extends StatelessWidget {
  const DependencyManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('의존성 주입'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: Text('첫번째 방법 Get.put'),
              onPressed: () {
                Get.to(
                  () => GetPutPage(),
                  // 페이지로 이동하면서, 사용할 controller 를 정해주는것
                  binding: BindingsBuilder(() {
                    // 페이지를 넘어가서 Get.put 할 필요가 없다. 인스턴스가 여기서 생성된다.
                    // 들어갔다가 나오게 되면, 메모리가 해제되는 것을 로그로 확인할 수있다.
                    Get.put(DependencyController());
                  }),
                );
              },
            ),
            TextButton(
              child: Text('Get.lazyPut'),
              onPressed: () {
                Get.to(() => LazyPutPage(), binding: BindingsBuilder(() {
                  // 당장에 instance 화 되지가 않는다!
                  // 해당 컨트롤러에 접근하려고 할때서야 사용이 된다.
                  Get.lazyPut(() => DependencyController());
                }));
              },
            ),
            TextButton(
              child: Text('Get.putAsync'),
              onPressed: () {
                Get.to(() => PutAsync(), binding: BindingsBuilder(() {
                  Get.putAsync<DependencyController>(() async {
                    /// controller instance 화 전에, 무언가 필요할 때
                    /// 물론, 들어가서 async 를 부르는 것도 가능하다.
                    await Future.delayed(Duration(seconds: 2));
                    return DependencyController();
                  });
                }));
              },
            ),
            TextButton(
              /// 잘 사용하는 곳이 없다고 한다.
              /// 위 다른 방식들은, Singleton 이었다.
              /// 즉 인스턴스를 생성하며 해당 인스턴스르 보내는 방식
              child: Text('Get.create'),
              onPressed: () {
                Get.to(
                  () => GetCreatePage(),
                  binding: BindingsBuilder(() {
                    /// lazy 와 비슷하게 사용시에 instance 화 된다.
                    /// 다른 점은, 사용될때마다 새로운 instance 가 생긴다!
                    /// 인스턴스의 hascode 를 출력해보면 달라짐을 알 수 있다.
                    Get.create<DependencyController>(() => DependencyController());
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
