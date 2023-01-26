import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shoe_ecommerce/core/theme/colors.dart';
import 'package:shoe_ecommerce/core/utils/dimesions.dart';
import 'package:shoe_ecommerce/pages/cart/controllers/cart_controller.dart';
import 'package:shoe_ecommerce/pages/home/viewss/widget/banners.dart';
import 'package:shoe_ecommerce/pages/home/viewss/widget/categories.dart';
import 'package:shoe_ecommerce/pages/home/viewss/widget/my_text.dart';
import 'package:shoe_ecommerce/pages/home/viewss/widget/recent_products.dart';
import 'package:shoe_ecommerce/pages/home/viewss/widget/search_box.dart';
import 'package:shoe_ecommerce/routes/routes.dart';

class HomePage extends StatelessWidget {
  //*Bien*//
  final CartController cartController = Get.put(CartController());
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 3),
                        child: const MyText(
                          text: 'Delivery Address',
                          color: AppColors.text2Color,
                        ),
                      ),
                      const MyText(
                        text: 'Salatiga City, Central Java',
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () => Get.toNamed(Routes.cart),
                        icon: Badge(
                          badgeContent: Obx(
                            () => MyText(
                              text: Get.find<CartController>()
                                  .items
                                  .length
                                  .toString(),
                              color: Colors.white,
                            ),
                          ),
                          child: SvgPicture.asset('assets/icons/Buy.svg'),
                        ),
                        iconSize: Dimensions.iconSize26,
                      ),
                      SizedBox(width: Dimensions.width15),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {},
                        iconSize: Dimensions.iconSize26,
                        icon: SvgPicture.asset(
                          'assets/icons/Notification.svg',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => Get.toNamed(Routes.search),
                child: const SearchBox(
                  isEnabled: false,
                ),
              ),
              Banners(),
              const Categories(),
              const RecentProduct(),
            ],
          ),
        ],
      ),
    );
  }
}
