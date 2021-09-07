import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/view/screens/home_screen.dart';
import 'custom_button_widget.dart';
import 'custom_text_widget.dart';

class BuildEmptyMessage extends StatelessWidget {
  final String message;

  BuildEmptyMessage({required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const   SizedBox(
            height: 50.0,
          ),
          CustomTextWidget(
            title: message,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          const  SizedBox(
            height: 10.0,
          ),
          CustomButtonWidget(
              buttonTitle: 'CONTINUE SHOPPING',
              onPressed: () {
                Get.to(
                  () => HomeScreen(),
                );
              },
              buttonColor: Colors.black,
              textColor: Colors.white),
        ],
      ),
    );
  }
}
