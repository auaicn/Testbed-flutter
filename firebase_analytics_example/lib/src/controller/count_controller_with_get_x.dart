import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CountControllerWithGetX extends GetxController {
  static CountControllerWithGetX get to => Get.find();

  /// 물론 count 는 공유되고 있기 때문에 원하는 것과 다른 동작일 수 있겠지만
  /// 그래도 notify 가 부분적으로 적용될 수 있다는 것에 의미를 두자!
  int count = 0;
  void increase(String id) {
    count++;
    update([id]);
  }

  void increaseJust() {
    count++;
    update();
  }
}
