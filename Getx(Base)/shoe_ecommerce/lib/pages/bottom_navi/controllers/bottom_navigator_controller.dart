import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shoe_ecommerce/pages/home/viewss/home_view.dart';

class BottomNavigatorController extends GetxController {
  RxInt index = 0.obs;
  var views = [
    HomePage(),
    Container(),
    Container(),
    Container(),
  ];
  void changeIndex(int i) => index.value = i;
}
