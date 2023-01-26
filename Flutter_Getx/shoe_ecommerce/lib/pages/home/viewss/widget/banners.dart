import 'package:flutter/material.dart';
import 'package:shoe_ecommerce/core/utils/dimesions.dart';

//?-->Banner:Ảnh bìa
class Banners extends StatelessWidget {
  Banners({super.key});
  //*bien
  final List<String> banners = [
    'assets/images/banner 1.png',
    'assets/images/banner 2.jpg',
    'assets/images/banner 3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Dimensions.height10),
      height: Dimensions.carousel,
      child: ListView.separated(
        separatorBuilder: (_, __) => SizedBox(
          width: Dimensions.width15,
        ),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: Dimensions.height10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Dimensions.height10),
              child: Image.asset(
                banners[index],
                height: Dimensions.bannerHeight,
                width: Dimensions.bannerWidth,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
