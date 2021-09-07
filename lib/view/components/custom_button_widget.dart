import 'package:flutter/material.dart';
import 'package:shopping_app/view/components/custom_text_widget.dart';

class CustomButtonWidget extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color textColor;
  final double minWidth;
  final double height;
  final double elevation;

  CustomButtonWidget({
    required this.buttonTitle,
    required this.onPressed,
    required this.buttonColor,
    required this.textColor,
    this.minWidth = double.infinity,
    this.height = 55,
    this.elevation = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: elevation,
      onPressed: onPressed,
      minWidth: minWidth,
      height: height,
      color: buttonColor,
      child: CustomTextWidget(
        title: buttonTitle,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
    );
  }
}
