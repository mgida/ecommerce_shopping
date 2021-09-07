import 'package:flutter/material.dart';
import 'custom_text_widget.dart';

class CustomPriceRowWidget extends StatelessWidget {
  final String price;
  final String discount;
  final FontWeight fontWeight;
  final double fontSize;

  CustomPriceRowWidget(
      {required this.price,
      required this.discount,
      this.fontWeight = FontWeight.w600,
      this.fontSize = 15});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomTextWidget(
          title: '\$$price',
          color: Colors.blue.shade300,
          fontWeight: fontWeight,
          fontSize: fontSize,
        ),
        const SizedBox(
          width: 2,
        ),
        CustomTextWidget(
          title: discount.isEmpty ? '' : '\$$discount',
          decoration: TextDecoration.lineThrough,
          fontWeight: fontWeight,
          fontSize: fontSize,
        ),
      ],
    );
  }
}
