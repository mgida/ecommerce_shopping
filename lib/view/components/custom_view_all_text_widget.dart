import 'package:flutter/material.dart';
import 'custom_text_widget.dart';

class CustomViewAllTextWidget extends StatelessWidget {
  final int itemsCount;

  CustomViewAllTextWidget({required this.itemsCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      child: CustomTextWidget(
        title: 'View All ($itemsCount)',
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
