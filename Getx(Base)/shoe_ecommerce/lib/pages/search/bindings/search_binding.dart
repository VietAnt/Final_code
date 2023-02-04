import 'package:get/get.dart';
import 'package:shoe_ecommerce/pages/search/controllers/search_controller.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchController());
  }
}
