import 'package:get/get.dart';

enum NUMNUM {
  FIRST,
  SECOND,
}

class Temp {
  String userName;
  int age;

  Temp({required this.userName, required this.age});
}

class CountControllerWithReactive extends GetxController {
  RxInt count = 0.obs;
  Rx<double> _countDouble = 0.0.obs;
  RxString value = 'auaicn'.obs;
  Rx<NUMNUM> nums = NUMNUM.FIRST.obs;
  Rx<Temp> temp = Temp(userName: 'auaicn', age: 25).obs;
  RxList<String> list = [""].obs;

  void increase() {
    count++;
    _countDouble++;
    _countDouble(424);
    nums(NUMNUM.SECOND);
    temp(Temp(userName: 'why', age: 80));
    list.addIf(temp.value.userName == 'auaicn', 'wow');
  }

  void putNumber(int value) {
    // count = value;
    // 이미 5일때도 변경, 트리거가 되어버릴 수 있다. 여기서는 오류까지 나는 것으로 보인다.
    // 해당 오류는 RxDouble 랑 Rx<double> 간에도 나타나는 듯한데, ++ 오퍼레이터도 안됨. 동작의 차이가 실제로 있는지는 확실하지는 않다.
    // 값이 변경되지 않았는데, update 가 일어나는 것은 리소스 낭비라고 할 수 있음.
    count(value);
  }

  @override
  void onInit() {
    super.onInit();
    ever(count, (_) => print('매번 호출'));
    once(count, (_) => print('한번만 호출'));

    /// debounce 는 검색할때 등 많이 사용한다고 한다
    debounce(count, (_) => print('마지막 변경 한번만 호출'), time: Duration(seconds: 1));

    interval(count, (_) => print('변경되고 있는 동안 1초마다 호출'), time: Duration(seconds: 1));
  }
}
