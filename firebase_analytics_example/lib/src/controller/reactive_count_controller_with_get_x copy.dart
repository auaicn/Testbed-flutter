import 'package:get/get.dart';

class CountControllerWithReactive {
  RxInt count = 0.obs;

  void increase() {
    count++;
  }

  void putNumber(int value) {
    // count = value;
    // 이미 5일때도 변경, 트리거가 되어버릴 수 있다. 여기서는 오류까지 나는 것으로 보인다.
    // 값이 변경되지 않았는데, update 가 일어나는 것은 리소스 낭비라고 할 수 있음.

    count(value);
  }
}
