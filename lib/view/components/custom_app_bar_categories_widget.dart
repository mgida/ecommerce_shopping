import 'package:flutter/material.dart';
import 'package:shopping_app/view/components/custom_text_widget.dart';

class CustomAppBarCategoriesWidget extends StatelessWidget
    with PreferredSizeWidget {
  final String title;
  final VoidCallback onTap;

  CustomAppBarCategoriesWidget({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10.0),
      width: double.infinity,
      height: 100.0,
      child: Scaffold(
        appBar: AppBar(
          title: CustomTextWidget(
            title: title,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
          backgroundColor: Colors.grey.shade50,
          elevation: 0,
          actions: [],
          leading: GestureDetector(
            onTap: onTap,
            child: Icon(
              Icons.close,
              color: Colors.black,
              size: 35.0,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.0);
}
