import 'package:get/get.dart';
import '../controllers/bottom_navigator_controller.dart';

class MainBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavigatorController());
  }
}
