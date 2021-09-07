import 'package:flutter/material.dart';
import 'package:shopping_app/view/components/custom_text_widget.dart';

class CustomOrRowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 1,
          width: 150,
          color: Colors.black.withOpacity(0.3),
        ),
        CustomTextWidget(
          title: 'OR',
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        Container(
          height: 1,
          width: 150,
          color: Colors.black.withOpacity(0.3),
        ),
      ],
    );
  }
}
