import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/view_model/auth_view_model.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.find<AuthViewModel>().currentUser;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/images/hm_black.jpg',
          width: 150.0,
          height: 150.0,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
