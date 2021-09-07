import 'package:flutter/material.dart';
import 'custom_text_widget.dart';

class CustomProductModelRowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomTextWidget(
          title: 'Model',
          color: Colors.blue,
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.w700,
        ),
        const SizedBox(
          width: 8,
        ),
        CustomTextWidget(
          title: 'Product',
          fontWeight: FontWeight.w700,
        ),
      ],
    );
  }
}
