import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_japan/src/controller/food_controller.dart';
import 'package:restaurant_japan/src/views/screen/cart_screen.dart';
import 'package:restaurant_japan/src/views/screen/home_screen.dart';

//*Controller
final FoodController controller = Get.put(FoodController());

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: controller.theme.value,
        home: HomeScreen(),
      );
    });
  }
}
