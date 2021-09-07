import 'package:flutter/material.dart';
import 'package:shopping_app/view/components/custom_text_widget.dart';

void displaySnackBar(BuildContext context, String title) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: CustomTextWidget(
        title: '$title',
        color: Colors.black,
        fontSize: 18,
      ),
      duration: Duration(milliseconds: 500),
      backgroundColor: Colors.white,
    ),
  );
}
