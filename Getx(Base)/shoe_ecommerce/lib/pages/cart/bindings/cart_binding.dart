import 'package:get/get.dart';
import 'package:shoe_ecommerce/pages/cart/controllers/cart_controller.dart';

class CartBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartController());
  }
}
