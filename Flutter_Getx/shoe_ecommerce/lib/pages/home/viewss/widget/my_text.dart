import 'package:flutter/material.dart';
import 'package:shoe_ecommerce/core/theme/colors.dart';
import 'package:shoe_ecommerce/core/utils/dimesions.dart';

class MyText extends StatelessWidget {
  //*Bien
  final String text;
  final Color color;
  final double size;
  final FontWeight weight;
  final TextOverflow? textOverflow;
  final double? lineHeight;

  const MyText({
    required this.text,
    this.color = AppColors.text1Color,
    this.size = 0,
    this.weight = FontWeight.w400,
    this.textOverflow,
    this.lineHeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      style: TextStyle(
        fontSize: size == 0 ? Dimensions.font12 : size,
        fontWeight: weight,
        color: color,
        height: lineHeight,
      ),
    );
  }
}
