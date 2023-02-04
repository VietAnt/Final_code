import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shoe_ecommerce/core/theme/colors.dart';
import 'package:shoe_ecommerce/core/utils/dimesions.dart';
import 'package:shoe_ecommerce/network/models/shoe.dart';
import 'package:shoe_ecommerce/pages/cart/controllers/cart_controller.dart';
import 'package:shoe_ecommerce/pages/detail/details_page.dart';
import 'package:shoe_ecommerce/pages/home/data/shoes.dart';
import 'package:shoe_ecommerce/pages/home/viewss/widget/my_text.dart';

class RecentProduct extends StatelessWidget {
  const RecentProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(
              size: Dimensions.font16,
              text: 'Recent Product',
              weight: FontWeight.w500,
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/Filter.svg',
                height: Dimensions.height20,
                width: Dimensions.width20,
              ),
            ),
          ],
        ),
        SizedBox(height: Dimensions.height10),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: Dimensions.cardHeight,
          ),
          itemBuilder: (BuildContext context, int index) {
            Shoe shoe = recent[index];
            return ShoeCard(shoe: shoe);
          },
        ),
      ],
    );
  }
}

//*Widget ShoeCard
class ShoeCard extends StatelessWidget {
  final Shoe shoe;
  const ShoeCard({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(
        DetailsPage(shoe: shoe),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius8),
            topRight: Radius.circular(Dimensions.radius8),
          ),
        ),
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius8),
                topRight: Radius.circular(Dimensions.radius8),
              ),
              child: Image.asset(
                shoe.cover,
                height: Dimensions.coverHeight,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: Dimensions.width15,
                top: Dimensions.height10,
              ),
              child: MyText(
                text: shoe.name,
                size: 14,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: Dimensions.width15,
                top: Dimensions.height15,
                bottom: Dimensions.height15,
              ),
              child: MyText(
                text: '\$${shoe.price.toStringAsFixed(2)}',
                size: 15,
                weight: FontWeight.w500,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                width: double.infinity,
                height: Dimensions.height45,
                child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(0),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColors.main),
                  ),
                  onPressed: () => Get.find<CartController>().addToCart(shoe),
                  child: const Text('Add to Cart'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
