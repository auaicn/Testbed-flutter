import 'package:firebase_analytics_example/src/controller/count_controller_with_get_x.dart';
import 'package:get/get.dart';

class BindingPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CountControllerWithGetX());
  }
}
