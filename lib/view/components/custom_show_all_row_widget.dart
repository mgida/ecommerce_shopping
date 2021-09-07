import 'package:flutter/material.dart';
import 'package:shopping_app/view/components/custom_text_widget.dart';

class CustomShowAllRowWidget extends StatelessWidget {
  final String typeText;
  final VoidCallback onTap;

   CustomShowAllRowWidget({required this.typeText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextWidget(
            title: typeText,
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
            color: Colors.black.withOpacity(0.8),
          ),
          GestureDetector(
            onTap: onTap,
            child: CustomTextWidget(
              title: 'Show all',
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
