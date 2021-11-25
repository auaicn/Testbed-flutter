import 'package:get/get_state_manager/get_state_manager.dart';

class CountControllerWithGetX extends GetxController {
  int count = 0;
  void increase(String id) {
    count++;
    update([id]);
  }
}
