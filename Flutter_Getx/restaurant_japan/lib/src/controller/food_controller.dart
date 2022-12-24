import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_japan/core/app_data.dart';
import 'package:restaurant_japan/core/app_extension.dart';
import 'package:restaurant_japan/core/app_theme.dart';
import 'package:restaurant_japan/src/model/food.dart';
import 'package:restaurant_japan/src/model/food_category.dart';

class FoodController extends GetxController {
  //*Variable: Bien_Khoi_Tao
  RxInt currentBottomNavItemIndex = 0.obs; //chuyen_trang
  RxList<Food> cartFood = <Food>[].obs; //gio_hang
  RxList<Food> favoriteFood = <Food>[].obs; //hang_yeu_thich
  RxList<FoodCategory> categories = AppData.categories.obs; //danh_muc
  RxList<Food> filteredFoods = AppData.foodItems.obs; //thuc_pham_loc
  RxDouble totalPrice = 0.0.obs; //Tong_gia_hang
  RxDouble subtotalPrice = 0.0.obs; //Tong_Phu_Gia
  Rx<ThemeData> theme = AppTheme.lightTheme.obs; //theme_light
  bool isLightTheme = true; //Ligt_Theme = SANG

  //*List_Function_Getx:

  //1: Thay_doi_Nav
  void switchBetweenBottomNavigationItems(int currentIndex) {
    currentBottomNavItemIndex.value = currentIndex;
  }

  //2: Tang_Item_Thanh_Tien
  void increaseItem(Food food) {
    food.quantity++;
    update();
    calculateTotalPrice();
  }

  //3:Giam_Item_Thanh_Tien
  void decreaseItem(Food food) {
    food.quantity = food.quantity-- < 1 ? 0 : food.quantity--;
    calculateTotalPrice();
    update();
    if (food.quantity < 1) {
      cartFood.removeWhere((element) => element == food);
    }
  }

  //4:Tính giá mỗi mặt hàng
  String calculatePricePerEachItem(Food food) {
    double price = 0;
    price = food.quantity * food.price;
    return price.toString();
  }

  //5:Tính Tổng giá
  calculateTotalPrice() {
    totalPrice.value = 5;
    for (var element in cartFood) {
      totalPrice.value += element.quantity * element.price;
    }
    subtotalPrice.value = 0;
    if (totalPrice.value > 0) {
      subtotalPrice.value = totalPrice.value - 5;
    }
  }

  //6:Thêm vào giỏ hàng
  addToCart(Food food) {
    if (food.quantity > 0) {
      cartFood.add(food);
      cartFood.assignAll(cartFood.distinctBy((item) => item));
      calculateTotalPrice();
    }
  }

  //7:Lọc mục theo danh mục
  filterItemByCategory(FoodCategory category) {
    for (var element in AppData.categories) {
      element.isSelected = false;
    }
    category.isSelected = true;

    //tat_ca
    if (category.type == FoodType.all) {
      filteredFoods.assignAll(AppData.foodItems.obs);
    } else {
      filteredFoods.assignAll(AppData.foodItems.where((item) {
        return item.type == category.type;
      }).toList());
    }
    update();

    filteredFoods.refresh();
  }

  //8:Là món ăn yêu thích
  isFavoriteFood(Food food) {
    food.isFavorite = !food.isFavorite;
    update();

    if (food.isFavorite) {
      favoriteFood.add(food);
    }
    if (!food.isFavorite) {
      favoriteFood.removeWhere((element) => element == food);
    }
  }

  //9: Xóa mục giỏ hàng tại chỉ mục cụ thể
  removeCartItemAtSpecificIndex(int index) {
    cartFood.removeAt(index);
    calculateTotalPrice();
    update();
  }

  //10: Thay đổi chủ đề
  void changeTheme() {
    if (theme.value == AppTheme.darkTheme) {
      theme.value = AppTheme.lightTheme;
      isLightTheme = true;
    } else {
      theme.value = AppTheme.darkTheme;
      isLightTheme = false;
    }
  }
}
