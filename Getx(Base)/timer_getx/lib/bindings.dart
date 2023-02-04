import 'package:get/get.dart';
import 'package:timer_getx/controllers/theme_controller.dart';
import 'package:timer_getx/controllers/timer_controller.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TimerController());
    Get.lazyPut(() => ThemeController());
  }
}
