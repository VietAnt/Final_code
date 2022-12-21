import 'package:flutter/material.dart';
import 'package:restaurant_japan/core/app_color.dart';
import 'package:restaurant_japan/core/app_extension.dart';
import 'package:restaurant_japan/core/app_style.dart';
import 'package:restaurant_japan/src/controller/food_controller.dart';
import 'package:get/get.dart';
import 'package:restaurant_japan/src/model/food.dart';
import 'package:restaurant_japan/src/views/screen/food_detail_screen.dart';
import 'package:restaurant_japan/src/views/widget/custom_page_route.dart';

//* FoodListView:Chế độ xem danh sách thực phẩm
final FoodController controller = Get.put(FoodController());

class FoodListView extends StatelessWidget {
  final List<Food> foods;
  final bool isReversedList;

  FoodListView({super.key, required this.foods, this.isReversedList = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: isReversedList ? 3 : foods.length,
        itemBuilder: (_, index) {
          Food food =
              isReversedList ? foods.reversed.toList()[index] : foods[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                CustomPageRoute(
                  child: FoodDetailScreen(food: food),
                ),
              );
            },
            child: Container(
              width: 160,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: controller.isLightTheme
                    ? Colors.white
                    : DarkThemeColor.primaryLight,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      food.image,
                      scale: 6,
                    ),
                    Text(
                      "\$${food.price}",
                      style: h3Style.copyWith(color: LightThemeColor.accent),
                    ),
                    Text(food.name,
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                              fontWeight: FontWeight.bold,
                            )),
                  ],
                ).fadeAnimation(0.7),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Padding(padding: EdgeInsets.only(right: 50));
        },
      ),
    );
  }
}
