import 'package:flutter/material.dart';
import 'package:restaurant_japan/core/app_data.dart';
import 'package:restaurant_japan/src/views/screen/cart_screen.dart';
import 'package:restaurant_japan/src/views/screen/favorite_screen.dart';
import 'package:restaurant_japan/src/views/screen/food_list_screen.dart';
import 'package:restaurant_japan/src/views/screen/profile_screen.dart';
import 'package:restaurant_japan/src/views/widget/page_transition.dart';
import 'package:get/get.dart';
import 'package:restaurant_japan/src/controller/food_controller.dart';

final FoodController controller = Get.put(FoodController());

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  //*Screen
  final List<Widget> screen = [
    const FoodListScreen(),
    const CartScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => PageTransition(
          child: screen[controller.currentBottomNavItemIndex.value],
        ),
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: controller.currentBottomNavItemIndex.value,
          onTap: controller.switchBetweenBottomNavigationItems,
          selectedFontSize: 0,
          items: AppData.bottomNavigationItems.map(
            (element) {
              return BottomNavigationBarItem(
                icon: element.disableIcon,
                label: element.label,
                activeIcon: element.enableIcon,
              );
            },
          ).toList(),
        );
      }),
    );
  }
}
